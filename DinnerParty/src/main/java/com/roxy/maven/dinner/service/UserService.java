package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.User;

import java.util.List;

public interface UserService {

    /**
     * 按用户名查找用户
     * @param email
     * @return
     */
    User findByEmail(String email);

    /**
     * 按用户名查找用户
     * @param id
     * @return
     */
    User findById(long id);

    /**
     * 注册用户
     * @param user
     */
    void register(User user);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    int update(User user);


    /**
     * 查询所有用户
     * @return
     */
    List<User> findAll();


}
