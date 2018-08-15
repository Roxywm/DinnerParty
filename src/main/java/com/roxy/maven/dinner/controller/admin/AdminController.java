package com.roxy.maven.dinner.controller.admin;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.roxy.maven.dinner.entity.Admin;
import com.roxy.maven.dinner.entity.AdminLog;
import com.roxy.maven.dinner.enumeration.LogType;
import com.roxy.maven.dinner.service.AdminLogService;
import com.roxy.maven.dinner.service.AdminService;
import com.roxy.maven.dinner.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminLogService adminLogService;
	
	/**
	 * 后台首页的Controller
	 */
	@RequestMapping("/")
	public String index(HttpSession session, Map<String, Object> map){
		//获取当前登录的管理员
		Admin admin = (Admin)session.getAttribute("loginAdmin");
		//获取管理员的登录次数
		int loginCount = adminLogService.getLoginCount(admin.getId());
		PageHelper.startPage(1, 6);
		List<AdminLog> adminLogList = adminLogService.findAll();
		map.put("adminLogList", adminLogList);
		map.put("loginCount", loginCount);
		return "admin/index";
	}


	/**
	 * 跳到登录页/admin/login
	 * @return
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(){
		return "admin/login";		
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String username, String password, String passcode, 
			HttpSession session, Map<String, Object> map){
		String authCode = session.getAttribute("authCode").toString();//获取session中保存的验证码
		if(authCode.equals(passcode)){
			Admin admin = adminService.findByUsername(username);
			if(admin!=null){
				if(MD5Util.verify(password, admin.getPassword())){
					session.setAttribute("loginAdmin", admin);

					//当前时间
					Timestamp now = new Timestamp(new Date().getTime());
					
					//把当前登录时间赋值给上一次登录时间
					admin.setLastLoginTime(admin.getCurrLoginTime());
					//把当前系统时间赋值给当前登录时间
					admin.setCurrLoginTime(now);
					
					adminService.update(admin);
					
					//保存日志
					AdminLog log = new AdminLog();
					log.setAdmin(admin);
					log.setCreateTime(now);
					log.setType(LogType.LOGIN);
					log.setContent("登录后台管理系统");
					adminLogService.create(log);
					
					return "redirect:/admin/";
				}else{
					map.put("error", "用户名或密码错误！");
				}
			}else{
				map.put("error", "用户名或密码错误！");
			}
		}else{
			map.put("error", "验证码输入错误！");
		}
		return "admin/login";	
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		
		Admin admin = (Admin)session.getAttribute("loginAdmin");
		
		//保存日志
		AdminLog log = new AdminLog();
		log.setAdmin(admin);
		log.setCreateTime(new Timestamp(new Date().getTime()));
		log.setType(LogType.LOGOUT);
		log.setContent("注销后台管理系统");
		adminLogService.create(log);
		
		session.invalidate();		
		
		return "redirect:login";
	}
	
}
