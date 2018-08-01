package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.Dinner;
import org.springframework.stereotype.Repository;

@Repository
public interface DinnerDao {
    /**
     * 发布饭局
     * @param dinner
     */
    void create(Dinner dinner);

    /**
     * 发布饭局里带的照片集
     * @param dinnerId
     */
    void createPhoto(long dinnerId);

}
