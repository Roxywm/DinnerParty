package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.entity.Photo;

import java.util.List;

public interface DinnerService {

    /**
     * 发布饭局
     * @param dinner
     */
    int create(Dinner dinner, List<Photo> list);



}
