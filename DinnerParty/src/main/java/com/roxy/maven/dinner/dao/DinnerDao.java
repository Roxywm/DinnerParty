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


    /**
     * 根据用户ID来查找自己发布饭局
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
