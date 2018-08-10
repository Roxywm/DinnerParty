package com.roxy.maven.dinner.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.entity.Category;
import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
public class IndexController {

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

    @RequestMapping(value = "/")
    public String index(Map<String, Object> map){

        PageHelper.startPage(1, 4);//设置分页
        //获取推荐饭局(报名人数最多 未停止报名)
        List<Dinner> dinnerList = dinnerService.recommendDinner();
        PageInfo<Dinner> dinnerPage = new PageInfo<Dinner>(dinnerList);
        map.put("dinnerPage", dinnerPage);

        return "index";
    }
}
