package com.roxy.maven.dinner.controller;

import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.Area;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.AreaService;
import com.roxy.maven.dinner.service.UserService;
import com.roxy.maven.dinner.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private AreaService areaService;

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
        User oldUser = userService.findByEmail(user.getEmail());
        if (oldUser==null){
            user.setPassword(MD5Util.generate(user.getPassword()));
            user.setArea(new Area());
            user.setNickname("User"+user.getEmail().substring(0,user.getEmail().lastIndexOf("@")+1));
            userService.register(user);
            map.put("message","注册成功！使用账户密码进行登录！");
            return "user/login";
        }
        map.put("error", "用户名已存在！");
        return "user/register";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(User user, HttpSession session, Map<String, Object> map){
        User oldUser = userService.findByEmail(user.getEmail());
        if (oldUser!=null){
            if(MD5Util.verify(user.getPassword(), oldUser.getPassword())){
                Area area = areaService.findById(oldUser.getArea().getId());
                oldUser.setArea(area);
                session.setAttribute("loginUser", oldUser);
                return "redirect:/";
            }
        }
        map.put("error", "账号或密码错误！");
        return "user/login";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(HttpSession session, Map<String, Object> map){
        User loginUser = (User) session.getAttribute("loginUser");
        User user = userService.findByEmail(loginUser.getEmail());
        map.put("user",user);
        return "/user/user_edit";
    }

    @RequestMapping(value = "/update")
    public String update(User user, @RequestParam("photo")MultipartFile photo, String areaId, String cityId, HttpSession session, Map<String, Object> map){
        if(photo!=null&&!photo.getOriginalFilename().equals("")){
            String suffix = getSuffix(photo.getOriginalFilename());
            long fileName = System.currentTimeMillis();
            File oldName = new File(Constants.userIcon +fileName+suffix);
            try {
                photo.transferTo(oldName);
                user.setIcon(oldName.getName());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Area area = new Area();
        if(areaId!=null){
            area.setId(Long.parseLong(areaId));
        }else{
            area.setId(Long.parseLong(cityId));
        }
        user.setArea(area);
        //更新
        int rows = userService.update(user);
        if(rows>0){
            map.put("message","修改成功！");
        }else {
            map.put("error","修改失败！");
        }
        User user1 = userService.findByEmail(user.getEmail());

        Area area1 = areaService.findById(user1.getArea().getId());
        user1.setArea(area1);

        map.put("user",user1);
        session.setAttribute("loginUser", user1);

        return "/user/user_edit";
    }


    @RequestMapping(value = "/edit/pwd", method = RequestMethod.GET)
    public String updatePwd(HttpSession session, Map<String, Object> map){
        User loginUser = (User) session.getAttribute("loginUser");
        User user = userService.findByEmail(loginUser.getEmail());
        map.put("user",user);
        return "/user/user_pwd";
    }

    @RequestMapping(value = "/update/pwd", method = RequestMethod.POST)
    public String update(HttpSession session, Map<String,Object> map, String password, String newPassword, String qrPassword){
        User loginUser = (User) session.getAttribute("loginUser");
        if(MD5Util.verify(password, loginUser.getPassword())){
            if(newPassword.equals(qrPassword)){
                loginUser.setPassword(MD5Util.generate(newPassword));
                int rows = userService.update(loginUser);
                if(rows>0){
                    map.put("message","修改成功！");
                }else {
                    map.put("error","修改失败！");
                }
            }else{
                map.put("qrerror","两次密码不一致！");
            }
        }else{
            map.put("yserror","原始密码错误！");
        }
        map.put("password",password);
        map.put("newPassword",newPassword);
        map.put("qrPassword",qrPassword);
        return "/user/user_pwd";
    }


    /**
     * 按文件名获取后缀名的方法
     * @param filename 文件名
     * @return 后缀名
     */
    private String getSuffix(String filename){
        return filename.substring(filename.lastIndexOf("."));
    }

}
