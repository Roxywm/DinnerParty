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

    /**
     * 根据用户ID来查找饭局
     * @param id
     * @return
     */
    List<Dinner> findByUserId(long id);

    /**
     * 根据饭局ID来查找饭局
     * @param id
     * @return
     */
    Dinner findByDinnerId(long id);

    /**
     * 查询所有饭局未停止报名的饭局
     * @return
     */
    List<Dinner> findNotStart();

    /**
     * 查询所有饭局
     * @return
     */
    List<Dinner> findAll();


}
