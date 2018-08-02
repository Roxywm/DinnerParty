package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.ApplyHostDao;
import com.roxy.maven.dinner.dao.AreaDao;
import com.roxy.maven.dinner.entity.ApplyHost;
import com.roxy.maven.dinner.entity.Area;
import com.roxy.maven.dinner.service.ApplyHostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    @Override
    public List<ApplyHost> findAll() {
        return applyHostDao.findAll();
    }

    @Override
    public int updateStatus(long id) {
        return applyHostDao.updateStatus(id);
    }
}
