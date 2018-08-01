package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.Dinner;

public interface DinnerService {

    /**
     * 发布饭局
     * @param dinner
     */
    void create(Dinner dinner);


}
