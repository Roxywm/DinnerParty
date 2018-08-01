package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.DinnerDao;
import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.service.DinnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class DinnerServiceImpl implements DinnerService {

    @Autowired
    private DinnerDao dinnerDao;

    @Override
    public void create(Dinner dinner) {
        dinnerDao.create(dinner);
        dinnerDao.createPhoto(dinner.getId());
    }



}
