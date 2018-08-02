package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.UserDao;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public void register(User user) {
        userDao.register(user);
    }

    @Override
    public int update(User user) {
        return userDao.update(user);
    }
}
