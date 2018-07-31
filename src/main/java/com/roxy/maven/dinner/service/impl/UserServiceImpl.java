package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.IUserDao;
import com.roxy.maven.dinner.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

}