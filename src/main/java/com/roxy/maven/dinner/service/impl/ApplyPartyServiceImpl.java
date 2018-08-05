package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.ApplyPartyDao;
import com.roxy.maven.dinner.entity.ApplyParty;
import com.roxy.maven.dinner.service.ApplyPartyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class ApplyPartyServiceImpl implements ApplyPartyService {

    @Autowired
    private ApplyPartyDao applyPartyDao;

    @Override
    public int create(ApplyParty applyParty) {
        return applyPartyDao.create(applyParty);
    }

    @Override
    public int delete(long id) {
        return applyPartyDao.delete(id);
    }

    @Override
    public List<ApplyParty> findByUserId(long userId) {
        return applyPartyDao.findByUserId(userId);
    }

    @Override
    public List<ApplyParty> findByDinnerId(long dinnerId) {
        return applyPartyDao.findByDinnerId(dinnerId);
    }

    @Override
    public ApplyParty findByUserIDandDinnerId(long userId, long dinnerId) {
        return applyPartyDao.findByUserIDandDinnerId(userId, dinnerId);
    }
}
