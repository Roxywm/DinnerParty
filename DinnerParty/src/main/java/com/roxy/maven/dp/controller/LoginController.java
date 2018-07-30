package com.roxy.maven.dp.controller;

import com.roxy.maven.dp.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/user")
public class LoginController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/login")
    public String login(String email, String password, HttpServletRequest request, RedirectAttributes model){
//        Employee employee = userService.findByUserName(email);
//        if (employee!=null&&employee.getUsername()!=null){
//            if(employee.getPassword().equals(password)){
//                request.getSession().setAttribute("loginManager", employee);
//                return "redirect:/manager/index";
//            }
//        }
//        model.addFlashAttribute("message", "用户名或密码错误");
//        return "redirect:/";
        return null;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginManager");
        return "redirect:/";
    }

}
