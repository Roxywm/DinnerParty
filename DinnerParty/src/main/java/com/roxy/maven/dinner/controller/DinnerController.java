package com.roxy.maven.dinner.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.*;
import com.roxy.maven.dinner.service.*;
import com.roxy.maven.dinner.util.SaveImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/mutually/dinner")
public class DinnerController {

    @Autowired
    private DinnerService dinnerService;
    @Autowired
    private ApplyHostService applyHostService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UserService userService;
    @Autowired
    private ApplyPartyService applyPartyService;
    @Autowired
    private DinnerMsgService dinnerMsgService;
    @Autowired
    private ConcernService concernService;

    /**
     * 跳到发布饭局页面
     * @param map
     * @param session
     * @return
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(Map<String, Object> map, HttpSession session){
        User loginUser = (User) session.getAttribute("loginUser");
        ApplyHost applyHost = applyHostService.findByUserId(loginUser.getId());
        List<Category> categoryList = categoryService.findAll();
        User user = userService.findByEmail(loginUser.getEmail());
        map.put("user",user);
        map.put("categoryList",categoryList);
        map.put("applyHost",applyHost);
        return "dinner/new_dinner";
    }

    /**
     * 发布饭局活动
     * @param dinner
     * @param startDate
     * @param endDate
     * @param photo
     * @param files
     * @return
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Dinner dinner, Date startDate, Date endDate, String categoryId,
                         @RequestParam("photo") MultipartFile photo,
                         @RequestParam("files") MultipartFile[] files, HttpSession session){
        //获取缩略图
        if(photo!=null&&!photo.getOriginalFilename().equals("")){
            String suffix = getSuffix(photo.getOriginalFilename());
            long fileName = System.currentTimeMillis();
            File oldName = new File(Constants.savePath +fileName+suffix);
            try {
                photo.transferTo(oldName);
                dinner.setThumbnail(oldName.getName());//添加到饭局对象中
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //获取上传的饭局照片集合
        List<Photo> photos = null;
        try {
            photos = SaveImg.getFiles(files);
            dinner.setPhotos(photos);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }

        //设置开始时间和报名结束时间
        dinner.setCategory(new Category(Long.parseLong(categoryId)));
        dinner.setStartTime(new Timestamp(startDate.getTime()));
        dinner.setEndTime(new Timestamp(endDate.getTime()));

        User user = (User) session.getAttribute("loginUser");
        dinner.setUser(user);
        //提交数据库
        int rows = dinnerService.create(dinner, photos);//返回插入照片数量条数
        if(rows>0){
            //重定向到自己发布的饭局页面
            return "redirect:/mutually/dinner/hostDinner";
        }

        return "redirect:/mutually/dinner/create";
    }


    /**
     * 跳到自己主持的饭局页面
     * 带分页
     * @return
     */
    @RequestMapping(value = "/hostDinner", method = RequestMethod.GET)
    public String hostDinner(HttpSession session, Map<String, Object> map,
                             @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                             @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        User user = (User) session.getAttribute("loginUser");
        PageHelper.startPage(pageNum, pageSize);//设置分页
        //找出自己主持的饭局活动
        List<Dinner> list = dinnerService.findByUserId(user.getId());
        PageInfo<Dinner> page = new PageInfo<Dinner>(list);
        map.put("page", page);
        map.put("newDate", new Timestamp(new Date().getTime()));
        return "dinner/host_dinner";
    }


    /**
     * 跳到自己参加的饭局页面
     * 带分页
     * @return
     */
    @RequestMapping(value = "/joinDinner", method = RequestMethod.GET)
    public String joinDinner(HttpSession session, Map<String, Object> map,
                             @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                             @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        User user = (User) session.getAttribute("loginUser");

        PageHelper.startPage(pageNum, pageSize);//设置分页
        //找出自己参加的饭局活动
        List<ApplyParty> list = applyPartyService.findByUserId(user.getId());
        for(ApplyParty applyParty:list){
            Dinner dinner = dinnerService.findByDinnerId(applyParty.getDinner().getId());
            applyParty.setDinner(dinner);
        }

        PageInfo<ApplyParty> page = new PageInfo<ApplyParty>(list);
        map.put("page", page);
        map.put("newDate", new Timestamp(new Date().getTime()));
        return "dinner/join_dinner";
    }

    /**
     * 跳到饭局详情页
     * @return
     */
    @RequestMapping(value = "/dinnerDetail", method = RequestMethod.GET)
    public String dinnerDetail(String dinnerId, Map<String, Object> map, HttpSession session,
                               @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                               @RequestParam(value="pageSize",defaultValue="6") int pageSize){
        Dinner dinner = dinnerService.findByDinnerId(Long.parseLong(dinnerId));

        PageHelper.startPage(pageNum, pageSize);//设置分页
        //查找该饭局的留言
        List<DinnerMsg> dinnerMsgList = dinnerMsgService.findByDinnerId(dinner.getId());
        PageInfo<DinnerMsg> dinnerMsgPage = new PageInfo<DinnerMsg>(dinnerMsgList);

        //查找报名该饭局的用户
        List<ApplyParty> applyPartyList = applyPartyService.findByDinnerId(dinner.getId());
        User loginUser = (User) session.getAttribute("loginUser");
        ApplyParty isApplyParty = null;
        if(loginUser!=null){
            isApplyParty = applyPartyService.findByUserIdAndDinnerId(loginUser.getId(), dinner.getId());
        }

        Concern concern = new Concern();
        concern.setUser(loginUser);
        concern.setConcernUser(dinner.getUser());
        Concern isConcern = concernService.findISConcern(concern);//判断是否关注

        List<Concern> fansList = concernService.findAllFans(dinner.getUser().getId());

        map.put("isConcern", isConcern);
        map.put("fansnum", fansList.size());
        map.put("dinner", dinner);
        map.put("isApplyParty", isApplyParty);
        map.put("dinnerMsgPage", dinnerMsgPage);
        map.put("applyPartyList", applyPartyList);
        map.put("newDate", new Timestamp(new Date().getTime()));
        return "/dinner/dinner_detail";
    }


    /**
     * 添加感兴趣的人数
     * @param dinnerId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/interest")
    public Map<String, Object> interest(String dinnerId){
        Map<String, Object> map = new HashMap<String, Object>();
        Dinner dinner = dinnerService.findByDinnerId(Long.parseLong(dinnerId));
        dinner.setInterest(dinner.getInterest()+1);
        int rows = dinnerService.interest(dinner);
        if(rows>0){
            map.put("ok",true);
            map.put("interest", "（"+dinner.getInterest()+"人）");
        }else{
            map.put("ok",false);
        }
        return map;
    }

    /**
     * 跳到报名活动填表页面
     * @return
     */
    @RequestMapping(value = "/applyParty", method = RequestMethod.GET)
    public String applyParty(String dinnerId, Map<String, Object> map){
        Dinner dinner = dinnerService.findByDinnerId(Long.parseLong(dinnerId));
        map.put("dinner", dinner);
        return "dinner/sign_up";
    }

    /**
     * 提交报名申请 (跳到报名成功页 未付款不提交数据库)
     * @return
     */
    @RequestMapping(value = "/applyParty", method = RequestMethod.POST)
    public String applyParty(ApplyParty applyParty, String dinnerId, HttpSession session, Map<String, Object> map){
        User user = (User) session.getAttribute("loginUser");
        applyParty.setDinner(new Dinner(Long.parseLong(dinnerId)));
        applyParty.setUser(user);
        applyParty.setApplyTime(new Timestamp(new Date().getTime()));

        //提交到数据库
        int rows = 0;
        rows = applyPartyService.create(applyParty);
        Dinner dinner = dinnerService.findByDinnerId(Long.parseLong(dinnerId));
        dinner.setEnrolment(dinner.getEnrolment()+1);
        rows = dinnerService.enrolment(dinner);

        applyParty.setDinner(dinner);
        List<ApplyParty> applyPartyList = applyPartyService.findByDinnerId(Long.parseLong(dinnerId));
        map.put("applyParty", applyParty);
        map.put("applyPartyList", applyPartyList);

        return "dinner/party_apply_success";

    }


    /**
     * 用户提交留言
     * @param dinnerId
     * @param message
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/dinnerMsg")
    public Map<String, Object> dinnerMsg(String dinnerId, String message, HttpSession session){
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("loginUser");
        DinnerMsg dinnerMsg = new DinnerMsg();
        dinnerMsg.setDinner(new Dinner(Long.parseLong(dinnerId)));
        dinnerMsg.setMsgUser(user);
        dinnerMsg.setMessage(message);
        dinnerMsg.setMsgTime(new Timestamp(new Date().getTime()));
        ApplyParty applyParty = applyPartyService.findByUserIdAndDinnerId(user.getId(), Long.parseLong(dinnerId));
        if(applyParty!=null){
            int rows = dinnerMsgService.create(dinnerMsg);
            if(rows>0){
                map.put("ok",true);
            }else{
                map.put("ok",false);
                map.put("error","留言失败！");
            }
        }else{
            map.put("ok",false);
            map.put("error","你还没有报名该活动，无法留言！");
        }

        return map;
    }


    /**
     * 按文件名获取后缀名的方法
     * @param filename 文件名
     * @return 后缀名
     */
    private String getSuffix(String filename){
        return filename.substring(filename.lastIndexOf("."));
    }

    //处理Date类型的参数
    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }

}
