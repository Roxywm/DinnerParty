package com.roxy.maven.dinner.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.*;
import com.roxy.maven.dinner.service.ApplyHostService;
import com.roxy.maven.dinner.service.CategoryService;
import com.roxy.maven.dinner.service.DinnerService;
import com.roxy.maven.dinner.service.UserService;
import com.roxy.maven.dinner.util.SaveImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
                         @RequestParam("files") MultipartFile[] files, Map<String, Object> map){
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

        //提交数据库
        int rows = dinnerService.create(dinner, photos);//返回插入照片数量条数
        if(rows>0){

            PageHelper.startPage(1, 5);//设置分页
            List<ApplyHost> list = applyHostService.findAll();
            PageInfo<ApplyHost> page = new PageInfo<ApplyHost>(list);
            map.put("page", page);

            return "dinner/host_dinner";
        }

        return "redirect:/mutually/create";
    }


    /**
     * 跳到主持的饭局页面
     * @return
     */
    @RequestMapping(value = "/hostDinner", method = RequestMethod.GET)
    public String hostDinner(){
        return "dinner/host_dinner";
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
