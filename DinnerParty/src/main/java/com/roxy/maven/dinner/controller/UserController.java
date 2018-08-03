package com.roxy.maven.dinner.controller;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.exceptions.ClientException;
import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.Area;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.AreaService;
import com.roxy.maven.dinner.service.UserService;
import com.roxy.maven.dinner.util.MD5Util;
import com.roxy.maven.dinner.util.VerificationCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

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
    public String register(User user, String qrPassword, Map<String, Object> map){
        if(user.getPassword().equals(qrPassword)){
            User oldUser = userService.findByEmail(user.getEmail());
            if (oldUser==null){
                user.setPassword(MD5Util.generate(user.getPassword()));
                user.setArea(new Area());
                user.setNickname("User"+user.getEmail().substring(0,5));
                userService.register(user);
                map.put("message","注册成功！使用账户密码进行登录！");
                return "user/login";
            }
            map.put("error", "用户名已存在！");
        }else {
            map.put("error", "两次密码不一致！");
        }
        map.put("email",user.getEmail());
        map.put("password",user.getPassword());
        map.put("qrPassword",qrPassword);
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

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("loginUser");
        return "redirect:login";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(HttpSession session, Map<String, Object> map){
        User loginUser = (User) session.getAttribute("loginUser");
        User user = userService.findByEmail(loginUser.getEmail());
        map.put("user",user);
        return "/user/user_edit";
    }

    /**
     * 修改基本资料
     * @param user
     * @param photo
     * @param areaId
     * @param cityId
     * @param session
     * @param map
     * @return
     */
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


    /**
     * 跳到修改密码页面
     * @param session
     * @param map
     * @return
     */
    @RequestMapping(value = "/edit/pwd", method = RequestMethod.GET)
    public String editPwd(HttpSession session, Map<String, Object> map){
        User loginUser = (User) session.getAttribute("loginUser");
        User user = userService.findByEmail(loginUser.getEmail());
        map.put("user",user);
        return "/user/user_pwd";
    }

    /**
     * 修改密码
     * @param session
     * @param map
     * @param password
     * @param newPassword
     * @param qrPassword
     * @return
     */
    @RequestMapping(value = "/update/pwd", method = RequestMethod.POST)
    public String updatePwd(HttpSession session, Map<String,Object> map, String password, String newPassword, String qrPassword){
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
     * 跳到绑定页面
     * @param session
     * @param map
     * @return
     */
    @RequestMapping(value = "/edit/binding", method = RequestMethod.GET)
    public String editBinding(HttpSession session, Map<String, Object> map){
        User loginUser = (User) session.getAttribute("loginUser");
        User user = userService.findByEmail(loginUser.getEmail());
        map.put("user",user);
        return "/user/user_binding";
    }

    /**
     * 跳到绑定手机号页面
     * @param session
     * @param map
     * @return
     */
    @RequestMapping(value = "/edit/mobile", method = RequestMethod.GET)
    public String bindingMobile(HttpSession session, Map<String, Object> map){
        User loginUser = (User) session.getAttribute("loginUser");
        User user = userService.findByEmail(loginUser.getEmail());
        map.put("user",user);
        return "/user/user_phone";
    }

    /**
     * 绑定手机号
     * @param session
     * @param map
     * @return
     */
    @RequestMapping(value = "/update/mobile", method = RequestMethod.POST)
    public String updateMobile(HttpSession session, Map<String, Object> map, String phoneNumber, String mobileCode){
        String sessionCode = (String)session.getAttribute("mobileCode");
        if(mobileCode.equals(sessionCode)){
            User loginUser = (User)session.getAttribute("loginUser");
            loginUser.setMobileStatus(1);
            loginUser.setMobile(phoneNumber);
            int rows = userService.update(loginUser);
            if(rows>0){
                User user = (User)session.getAttribute("loginUser");
                map.put("user", user);
                return "/user/user_phone_done";
            }else {
                map.put("error","绑定失败！");
            }

        }else{
            map.put("error","验证码错误！");
            map.put("phoneNumber", phoneNumber);
        }
        return "/user/user_phone";
    }

    /**
     * 发送手机验证码
     * @param session
     * @param phoneNumber
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/mobileCode", method = RequestMethod.GET)
    public String getMobileVC(final HttpSession session, String phoneNumber){
        String mobileCode = (String)session.getAttribute("mobileCode");
        JSONObject resultJsonObject = null;

        //判断session中是否存在验证码
        if(mobileCode!=null){
            try {
                resultJsonObject = VerificationCode.sendAliyunMobileCode(phoneNumber, mobileCode);
            } catch (ClientException e) {
                e.printStackTrace();
            }
        }else{
            try {
                resultJsonObject = VerificationCode.sendAliyunMobileCode(phoneNumber, VerificationCode.createRandomVcode());
            } catch (ClientException e) {
                e.printStackTrace();
            }
            try {
                //TimerTask实现5分钟后从session中删除checkCode
                final Timer timer=new Timer();
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        session.removeAttribute("mobileCode");
                        timer.cancel();
                    }
                },5*60*1000);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //判断是否发送成功
        System.out.println(resultJsonObject.toJSONString());
        String status = resultJsonObject.get("status").toString();
        if (status.equals("OK")){
            String code = resultJsonObject.get("code").toString();
            session.setAttribute("mobileCode", code);
            return "ok";
        }else{
            return "error";
        }

    }


    /**
     * 跳到邮箱绑定页面
     * @return
     */
    @RequestMapping(value = "/edit/email", method = RequestMethod.GET)
    public String bindingEmail(){
        return "user/user_email";
    }

    /**
     * 发送邮箱验证码并跳到绑定邮箱下一步页面
     * @return
     */
    @RequestMapping(value = "/edit/updateEmail", method = RequestMethod.POST)
    public String nextEmail(String email, HttpSession session){
        String eamilCode = VerificationCode.sendEamilCode(email);
        session.setAttribute("emailCode", eamilCode);
        return "user/user_updateEmail";
    }

    /**
     * 绑定邮箱
     * @return
     */
    @RequestMapping(value = "/update/email", method = RequestMethod.GET)
    public String updateEmail(String code, HttpSession session, Map<String, Object> map){
        String emailCode = (String)session.getAttribute("emailCode");
        User user = (User) session.getAttribute("loginUser");
        if(code.equals(emailCode)){
            user.setEmailStatus(1);
            int rows = userService.update(user);
            if(rows>0){
                User user1 = userService.findByEmail(user.getEmail());
                map.put("user",user1);
                return "/user/user_binding";
            }
        }
        map.put("error", "验证失败！");
        map.put("user",user);
        return "user/user_email";
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
