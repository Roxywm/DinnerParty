package com.roxy.maven.dinner.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/find/dinner")
public class FindController {

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


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(String keyword, Map<String, Object> map,
                         @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                         @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        
        PageHelper.startPage(pageNum, pageSize);//设置分页
        //模糊查找
        List<Dinner> dinnerList = dinnerService.fuzzySearch(keyword);
        PageInfo<Dinner> dinnerPage = new PageInfo<Dinner>(dinnerList);

        //获取推荐饭局(报名人数最多 未停止报名)
        List<Dinner> list = dinnerService.recommendDinner();

        map.put("dinnerPage", dinnerPage);
        map.put("dinner", list.get(0));

        return "/dinner/active";
    }

}
