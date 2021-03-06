package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.entity.Photo;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.Date;
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
     * 根据用户ID来查找该用户发布饭局
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


    /**
     * 添加感兴趣
     * @param dinner
     * @return
     */
    int interest(Dinner dinner);

    /**
     * 添加报名人数
     * @param dinner
     * @return
     */
    int enrolment(Dinner dinner);

    /**
     * 推荐活动 (报名人数倒叙)
     * @return
     */
    List<Dinner> recommendDinner();

    /**
     * 模糊搜索
     * @return
     */
    List<Dinner> fuzzySearch(String keyword);

    /**
     * 模糊搜索
     * 日期降序
     * @return
     */
    List<Dinner> fuzzySearchDateDesc(String keyword);

    /**
     * 模糊搜索
     * 价钱降序
     * @return
     */
    List<Dinner> fuzzySearchPriceDesc(String keyword);

    /**
     * 时间段
     * @return
     */
    List<Dinner> fuzzySearchTimeSlot(Date startDate, Date endDate);

    /**
     * 类型搜索
     * @return
     */
    List<Dinner> categorySearch(long categoryId);

}
