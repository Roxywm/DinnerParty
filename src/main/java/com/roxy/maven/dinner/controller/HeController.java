package com.roxy.maven.dinner.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.entity.*;
import com.roxy.maven.dinner.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/he")
public class HeController {

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
    @Autowired
    private AreaService areaService;
    @Autowired
    private UserMsgService userMsgService;


    /**
     * 跳到他人信息首页 (他参加的饭局)
     * @return
     */
    @RequestMapping(value = "/heMain", method = RequestMethod.GET)
    public String heMain(String userId, Map<String, Object> map, HttpSession session,
                         @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                         @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        User loginUser = (User)session.getAttribute("loginUser");
        //要查看的用户
        User user = userService.findById(Long.parseLong(userId));
        user.setArea(areaService.findById(user.getArea().getId()));//查找地址

        Concern concern = new Concern();
        concern.setUser(loginUser);
        concern.setConcernUser(user);
        Concern isConcern = concernService.findISConcern(concern);

        PageHelper.startPage(pageNum, pageSize);//设置分页

        List<ApplyParty> list = applyPartyService.findByUserId(user.getId());
        for(ApplyParty applyParty:list){
            Dinner dinner = dinnerService.findByDinnerId(applyParty.getDinner().getId());
            applyParty.setDinner(dinner);
        }

        PageInfo<ApplyParty> page = new PageInfo<ApplyParty>(list);


        //接待人数
        List<Dinner> dinnerList = dinnerService.findByUserId(user.getId());
        int reception = 0;
        for(Dinner dinner:dinnerList){
            reception += dinner.getEnrolment();
        }

        map.put("user", user);
        map.put("isConcern", isConcern);
        map.put("page", page);
        map.put("newDate", new Timestamp(new Date().getTime()));
        session.setAttribute("reception", reception);
        if(loginUser!=null){
            if(loginUser.getId()==user.getId()){
                return "redirect:/me/meHome";
            }
        }
        return "he/he_join_dinner";
    }


    /**
     * 跳到他主持的饭局)
     * @return
     */
    @RequestMapping(value = "/heHostDinner", method = RequestMethod.GET)
    public String heHostDinner(String userId, Map<String, Object> map, HttpSession session,
                         @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                         @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        User loginUser = (User)session.getAttribute("loginUser");
        //要查看的用户
        User user = userService.findById(Long.parseLong(userId));
        user.setArea(areaService.findById(user.getArea().getId()));//查找地址

        Concern concern = new Concern();
        concern.setUser(loginUser);
        concern.setConcernUser(user);
        Concern isConcern = concernService.findISConcern(concern);//判断是否关注他

        PageHelper.startPage(pageNum, pageSize);//设置分页
        //找出他主持的饭局活动
        List<Dinner> list = dinnerService.findByUserId(user.getId());
        PageInfo<Dinner> page = new PageInfo<Dinner>(list);

        map.put("user", user);
        map.put("isConcern", isConcern);
        map.put("page", page);
        map.put("newDate", new Timestamp(new Date().getTime()));

        return "he/he_host_dinner";
    }


    /**
     * 跳到他的留言页
     * @param userId
     * @param map
     * @param session
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/heMessage", method = RequestMethod.GET)
    public String heMessage(String userId, Map<String, Object> map, HttpSession session,
                            @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                            @RequestParam(value="pageSize",defaultValue="10") int pageSize){
        User loginUser = (User)session.getAttribute("loginUser");
        //要查看的用户
        User user = userService.findById(Long.parseLong(userId));
        user.setArea(areaService.findById(user.getArea().getId()));//查找地址

        Concern concern = new Concern();
        concern.setUser(loginUser);
        concern.setConcernUser(user);
        Concern isConcern = concernService.findISConcern(concern);//判断是否关注他

        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<UserMsg> userMsgList = userMsgService.findByUserId(user.getId());
        PageInfo<UserMsg> page = new PageInfo<UserMsg>(userMsgList);

        map.put("user", user);
        map.put("isConcern", isConcern);
        map.put("page", page);
        return "he/he_message";
    }


    /**
     * 跳到他的关注
     * @param userId
     * @param map
     * @param session
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/heConcern", method = RequestMethod.GET)
    public String heConcern(String userId, Map<String, Object> map, HttpSession session,
                            @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                            @RequestParam(value="pageSize",defaultValue="6") int pageSize){
        User loginUser = (User)session.getAttribute("loginUser");
        //要查看的用户
        User user = userService.findById(Long.parseLong(userId));
        user.setArea(areaService.findById(user.getArea().getId()));//查找地址

        Concern concern = new Concern();
        concern.setUser(loginUser);
        concern.setConcernUser(user);
        Concern isConcern = concernService.findISConcern(concern);

        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<Concern> concernList = concernService.findAllConcern(user.getId());
        PageInfo<Concern> page = new PageInfo<Concern>(concernList);

        map.put("page", page);
        map.put("user",user);
        map.put("isConcern", isConcern);
        return "he/he_concern";
    }

    /**
     * 添加关注
     * @param userId
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/addConcern")
    public Map<String, Object> addConcern(String userId, HttpSession session){
        User user = (User) session.getAttribute("loginUser");//染月
        User concernUser = new User(Long.parseLong(userId));//染月关注的人

        Concern concern = new Concern();
        concern.setUser(user);
        concern.setConcernUser(concernUser);
        concern.setConcernTime(new Timestamp(new Date().getTime()));

        Map<String, Object> map = new HashMap<String, Object>();
        int rows = concernService.add(concern);
        if(rows>0){
            map.put("ok",true);
        }else{
            map.put("ok",false);
            map.put("error","关注失败！");
        }
        return map;
    }

    /**
     * 取消关注
     * @param userId
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/cancelConcern")
    public Map<String, Object> cancelConcern(String userId, HttpSession session){
        User user = (User) session.getAttribute("loginUser");//染月
        User concernUser = new User(Long.parseLong(userId));//染月关注的人

        Concern concern = new Concern();
        concern.setUser(user);
        concern.setConcernUser(concernUser);

        Map<String, Object> map = new HashMap<String, Object>();
        int rows = concernService.cancel(concern);
        if(rows>0){
            map.put("ok",true);
        }else{
            map.put("ok",false);
            map.put("error","取关失败！");
        }
        return map;
    }


    /**
     * 添加对他人的留言
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/addMessage")
    public Map<String, Object> addMessage(String message, String userId, HttpSession session){

        User user = userService.findById(Long.parseLong(userId));//染月
        User msgUser = (User) session.getAttribute("loginUser");//给留言的人  当前登录用户

        UserMsg userMsg = new UserMsg();
        userMsg.setUser(user);
        userMsg.setMsgUser(msgUser);
        userMsg.setMessage(message);
        userMsg.setMsgTime(new Timestamp(new Date().getTime()));

        Map<String, Object> map = new HashMap<String, Object>();
        int rows = userMsgService.add(userMsg);
        if(rows>0){
            map.put("ok", true);
        }else{
            map.put("ok",false);
            map.put("error", "留言失败！");
        }
        return map;
    }


}
