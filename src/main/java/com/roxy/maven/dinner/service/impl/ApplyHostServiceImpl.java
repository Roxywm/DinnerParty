package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.ApplyHostDao;
import com.roxy.maven.dinner.entity.ApplyHost;
import com.roxy.maven.dinner.service.ApplyHostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ApplyHostServiceImpl implements ApplyHostService {

    @Autowired
    private ApplyHostDao applyHostDao;

    @Override
    public ApplyHost findByUserId(long id) {
        return applyHostDao.findByUserId(id);
    }

    @Override
    public int applyHost(ApplyHost applyHost) {
        return applyHostDao.applyHost(applyHost);
    }
}
