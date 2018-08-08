package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.Concern;

import java.util.List;

public interface ConcernService {

    /**
     * 根据用户ID查询该用户所关注的其他用户
     * @return
     */
    List<Concern> findAllConcern(long userId);


    /**
     * 根据被关注的用户ID查询该用户的粉丝
     * 谁关注他谁就是他的粉丝
     * @return
     */
    List<Concern> findAllFans(long userId);

    /**
     * 添加一条关注
     * @param concern
     * @return
     */
    int add(Concern concern);

    /**
     * 取消关注
     * @return
     */
    int delete(Concern concern);

    /**
     * 查找user是否关注concernUser
     * 查询一条关注记录
     * @param concern
     * @return
     */
    Concern findISConcern(Concern concern);
}
