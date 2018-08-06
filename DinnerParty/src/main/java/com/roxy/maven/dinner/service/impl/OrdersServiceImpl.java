package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.OrdersDao;
import com.roxy.maven.dinner.entity.Orders;
import com.roxy.maven.dinner.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersDao ordersDao;

    @Override
    public int create(Orders orders) {
        return ordersDao.create(orders);
    }


    @Override
    public List<Orders> findAll() {
        return ordersDao.findAll();
    }
}
