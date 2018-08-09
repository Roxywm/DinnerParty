package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.ConcernDao;
import com.roxy.maven.dinner.entity.Concern;
import com.roxy.maven.dinner.service.ConcernService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ConcernServiceImpl implements ConcernService {

    @Autowired
    private ConcernDao concernDao;

    @Override
    public List<Concern> findAllConcern(long userId) {
        return concernDao.findAllConcern(userId);
    }

    @Override
    public List<Concern> findAllFans(long userId) {
        return concernDao.findAllFans(userId);
    }

    @Override
    public int add(Concern concern) {
        return concernDao.add(concern);
    }

    @Override
    public int cancel(Concern concern) {
        return concernDao.cancel(concern);
    }

    @Override
    public Concern findISConcern(Concern concern) {
        return concernDao.findISConcern(concern);
    }
}
