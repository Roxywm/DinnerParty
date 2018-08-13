package com.roxy.maven.dinner.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.entity.Category;
import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
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


    /**
     * 模糊搜索
     * @param keyword
     * @param map
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(String keyword, Map<String, Object> map,
                         @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                         @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        
        PageHelper.startPage(pageNum, pageSize);//设置分页
        //模糊查找
        List<Dinner> dinnerList = dinnerService.fuzzySearch(keyword);

        PageInfo<Dinner> dinnerPage = new PageInfo<Dinner>(dinnerList);

        PageHelper.startPage(1, 6);//设置分页
        //获取推荐饭局(报名人数最多 未停止报名)
        List<Dinner> list = dinnerService.recommendDinner();

        //查找类型
        List<Category> categoryList = categoryService.findAll();

        map.put("dinnerPage", dinnerPage);
        map.put("recommendDinner", list);
        map.put("keyword", keyword);
        map.put("categoryList", categoryList);

        return "/dinner/active";
    }

    /**
     * 模糊搜索
     * @param keyword
     * @param rule
     * @param map
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(String keyword, String rule, Map<String, Object> map,
                         @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                         @RequestParam(value="pageSize",defaultValue="5") int pageSize){

        PageHelper.startPage(pageNum, pageSize);//设置分页
        //模糊查找
        List<Dinner> dinnerList = null;
        if(rule==null){
            dinnerList = dinnerService.fuzzySearch(keyword);
        }else if("dateDesc".equals(rule)){
            //时间降序
            dinnerList = dinnerService.fuzzySearchDateDesc(keyword);
        }else if("priceDesc".equals(rule)){
            //价钱降序
            dinnerList = dinnerService.fuzzySearchPriceDesc(keyword);
        }

        PageInfo<Dinner> dinnerPage = new PageInfo<Dinner>(dinnerList);

        PageHelper.startPage(1, 6);//设置分页
        //获取推荐饭局(报名人数最多 未停止报名)
        List<Dinner> list = dinnerService.recommendDinner();

        //查找类型
        List<Category> categoryList = categoryService.findAll();

        map.put("dinnerPage", dinnerPage);
        map.put("recommendDinner", list);
        map.put("keyword", keyword);
        map.put("categoryList", categoryList);

        return "/dinner/active";
    }

    /**
     * 通过时间段来搜索饭局
     * @param startDate
     * @param endDate
     * @param map
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/fuzzySearchTimeSlot", method = RequestMethod.GET)
    public String fuzzySearchTimeSlot(Date startDate, Date endDate, Map<String, Object> map,
                           @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                           @RequestParam(value="pageSize",defaultValue="5") int pageSize){

        PageHelper.startPage(pageNum, pageSize);//设置分页

        List<Dinner> dinnerList = dinnerService.fuzzySearchTimeSlot(startDate, endDate);

        PageInfo<Dinner> dinnerPage = new PageInfo<Dinner>(dinnerList);

        PageHelper.startPage(1, 6);//设置分页
        //获取推荐饭局(报名人数最多 未停止报名)
        List<Dinner> list = dinnerService.recommendDinner();

        //查找类型
        List<Category> categoryList = categoryService.findAll();

        map.put("dinnerPage", dinnerPage);
        map.put("recommendDinner", list);
        map.put("categoryList", categoryList);
        return "/dinner/active";
    }

    /**
     * 通过类型来搜索饭局
     * @param categoryId
     * @param map
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/categorySearch", method = RequestMethod.GET)
    public String categorySearch(String categoryId, Map<String, Object> map,
                           @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                           @RequestParam(value="pageSize",defaultValue="5") int pageSize){

        PageHelper.startPage(pageNum, pageSize);//设置分页

        List<Dinner> dinnerList = dinnerService.categorySearch(Long.parseLong(categoryId));

        PageInfo<Dinner> dinnerPage = new PageInfo<Dinner>(dinnerList);

        PageHelper.startPage(1, 6);//设置分页
        //获取推荐饭局(报名人数最多 未停止报名)
        List<Dinner> list = dinnerService.recommendDinner();

        //查找类型
        List<Category> categoryList = categoryService.findAll();

        //查找类型名称
        Category category = categoryService.findById(Long.parseLong(categoryId));

        map.put("dinnerPage", dinnerPage);
        map.put("recommendDinner", list);
        map.put("categoryList", categoryList);
        map.put("categoryId", categoryId);
        map.put("keyword", category.getName());
        return "/dinner/active";
    }


    //处理Date类型的参数
    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }

}
