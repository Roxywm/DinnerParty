package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.DinnerDao;
import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.entity.Photo;
import com.roxy.maven.dinner.service.DinnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Transactional
@Service
public class DinnerServiceImpl implements DinnerService {

    @Autowired
    private DinnerDao dinnerDao;

    @Override
    public int create(Dinner dinner, List<Photo> list) {
        int rows = 0;

        rows = dinnerDao.create(dinner);

        for(Photo photo1:list){
            photo1.setDinner(dinner);
        }
        rows = 0;
        rows = dinnerDao.createPhoto(list);

        return rows;
    }

    @Override
    public List<Dinner> findByUserId(long id) {
        return dinnerDao.findByUserId(id);
    }

    @Override
    public Dinner findByDinnerId(long id) {
        return dinnerDao.findByDinnerId(id);
    }

    @Override
    public List<Dinner> findNotStart() {
        return null;
    }

    @Override
    public List<Dinner> findAll() {
        return null;
    }

    @Override
    public int interest(Dinner dinner) {
        return dinnerDao.interest(dinner);
    }

    @Override
    public int enrolment(Dinner dinner) {
        return dinnerDao.enrolment(dinner);
    }

    @Override
    public List<Dinner> recommendDinner() {
        return dinnerDao.recommendDinner();
    }

    @Override
    public List<Dinner> fuzzySearch(String keyword) {
        return dinnerDao.fuzzySearch(keyword);
    }

    @Override
    public List<Dinner> fuzzySearchDateDesc(String keyword) {
        return dinnerDao.fuzzySearchDateDesc(keyword);
    }

    @Override
    public List<Dinner> fuzzySearchPriceDesc(String keyword) {
        return dinnerDao.fuzzySearchPriceDesc(keyword);
    }

    @Override
    public List<Dinner> fuzzySearchTimeSlot(Date startDate, Date endDate) {
        return dinnerDao.fuzzySearchTimeSlot(startDate, endDate);
    }

    @Override
    public List<Dinner> categorySearch(long categoryId) {
        return dinnerDao.categorySearch(categoryId);
    }


}
