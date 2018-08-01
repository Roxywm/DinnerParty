package com.roxy.maven.dinner.controller;

import com.roxy.maven.dinner.entity.Area;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.UserService;
import com.roxy.maven.dinner.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(){
        return "user/register";
    }
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "user/login";
    }
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String home(){
        return "user/home";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(User user, HttpSession session, Map<String, Object> map){
        User oldUser = userService.findByAccount(user.getAccount());
        if (oldUser==null){
            user.setPassword(MD5Util.generate(user.getPassword()));
            user.setArea(new Area());
            userService.register(user);
            map.put("message","注册成功！使用账户密码进行登录！");
            return "user/login";
        }
        map.put("error", "用户名已存在！");
        return "user/register";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(User user, HttpSession session, Map<String, Object> map){
        User oldUser = userService.findByAccount(user.getAccount());
        if (oldUser!=null){
            if(MD5Util.verify(user.getPassword(), oldUser.getPassword())){
                session.setAttribute("loginUser", oldUser);
                return "redirect:/";
            }
        }
        map.put("error", "账号或密码错误！");
        return "user/login";
    }

}
