package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.UserMsgDao;
import com.roxy.maven.dinner.entity.UserMsg;
import com.roxy.maven.dinner.service.UserMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserMsgServiceImpl implements UserMsgService {

    @Autowired
    private UserMsgDao userMsgDao;

    @Override
    public int add(UserMsg userMsg) {
        return userMsgDao.add(userMsg);
    }

    @Override
    public int delete(long id) {
        return userMsgDao.delete(id);
    }

    @Override
    public List<UserMsg> findByUserId(long userId) {
        return userMsgDao.findByUserId(userId);
    }
}
