package com.roxy.maven.dinner.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.entity.Orders;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/user")
public class UserManagerController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/")
    public String findAllUser(Map<String, Object> map,
                              @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                              @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<User> userList = userService.findAll();
        PageInfo<User> page = new PageInfo<User>(userList);

        map.put("page",page);
        return "admin/user_list";
    }

}
