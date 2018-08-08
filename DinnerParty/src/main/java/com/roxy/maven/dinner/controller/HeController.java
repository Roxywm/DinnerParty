package com.roxy.maven.dinner.controller;

import com.roxy.maven.dinner.entity.Concern;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.sql.Timestamp;
import java.util.HashMap;
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


    /**
     * 跳到他人信息首页
     * @return
     */
    @RequestMapping(value = "/heMain")
    public String heMain(String userId, Map<String, Object> map, HttpSession session){
        User loginUser = (User)session.getAttribute("loginUser");
        User user = userService.findById(Long.parseLong(userId));
        if(loginUser.getId()==user.getId()){
            return "redirect:/me/home";
        }else{
            Concern concern = new Concern();
            concern.setUser(loginUser);
            concern.setConcernUser(user);
            Concern isConcern = concernService.findISConcern(concern);
            map.put("user", user);
            map.put("isConcern", isConcern);
            return "he/he_home";
        }

    }

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

}
