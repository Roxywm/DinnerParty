package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.Orders;

import java.util.List;

public interface OrdersService {

    /**
     * 添加一条订单1记录
     * @param orders
     * @return
     */
    int create(Orders orders);


    /**
     * 查询所有订单
     * @return
     */
    List<Orders> findAll();
}
