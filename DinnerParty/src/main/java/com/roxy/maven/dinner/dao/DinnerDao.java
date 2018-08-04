package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.entity.Photo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DinnerDao {
    /**
     * 发布饭局
     * @param dinner
     */
    int create(Dinner dinner);

    /**
     * 发布饭局里带的照片集
     * @param list
     */
    int createPhoto(List<Photo> list);

}
