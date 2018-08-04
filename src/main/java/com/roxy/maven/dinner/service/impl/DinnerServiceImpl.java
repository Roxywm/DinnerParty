package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.DinnerDao;
import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.entity.Photo;
import com.roxy.maven.dinner.service.DinnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class DinnerServiceImpl implements DinnerService {

    @Autowired
    private DinnerDao dinnerDao;

    @Override
    public int create(Dinner dinner, List<Photo> list) {
        long dinnerId = dinnerDao.create(dinner);

        for(Photo photo1:list){
            photo1.setDinner(new Dinner(dinnerId));
        }

        return dinnerDao.createPhoto(list);
    }


}
