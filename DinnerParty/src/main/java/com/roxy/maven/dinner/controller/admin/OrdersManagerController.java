package com.roxy.maven.dinner.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.entity.ApplyHost;
import com.roxy.maven.dinner.entity.Orders;
import com.roxy.maven.dinner.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/orders")
public class OrdersManagerController {

    @Autowired
    private OrdersService ordersService;

    @RequestMapping(value = "/")
    public String findAllOrders(Map<String, Object> map,
                                @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                                @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<Orders> ordersList = ordersService.findAll();
        PageInfo<Orders> page = new PageInfo<Orders>(ordersList);
        map.put("page", page);
        return "admin/orders_list";
    }


}
