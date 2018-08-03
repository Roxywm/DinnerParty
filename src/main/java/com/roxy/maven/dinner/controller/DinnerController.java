package com.roxy.maven.dinner.controller;

import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.ApplyHost;
import com.roxy.maven.dinner.entity.Category;
import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.ApplyHostService;
import com.roxy.maven.dinner.service.CategoryService;
import com.roxy.maven.dinner.service.DinnerService;
import com.roxy.maven.dinner.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/mutually")
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
     * @param startTime
     * @param endTime
     * @param photo
     * @param photos
     * @return
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Dinner dinner, String startTime, String endTime,
                         @RequestParam("photo") MultipartFile photo, @RequestParam("photos") MultipartFile photos){
        if(photo!=null&&!photo.getOriginalFilename().equals("")){
            String suffix = getSuffix(photo.getOriginalFilename());
            long fileName = System.currentTimeMillis();
            File oldName = new File(Constants.savePath +fileName+suffix);
            try {
                photo.transferTo(oldName);
                dinner.setThumbnail(oldName.getName());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(photos!=null&&!photos.getOriginalFilename().equals("")){
            String suffix = getSuffix(photos.getOriginalFilename());
            File oldName = new File(Constants.savePath +System.currentTimeMillis()+suffix);
            try {
                photos.transferTo(oldName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            dinner.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            dinner.setStartTime(new Timestamp(sdf.parse(endTime).getTime()));
        } catch (ParseException e) {
            e.printStackTrace();
        }




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
