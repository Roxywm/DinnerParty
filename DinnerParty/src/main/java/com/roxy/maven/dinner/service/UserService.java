package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.User;

public interface UserService {

    /**
     * 按用户名查找用户
     * @param email
     * @return
     */
    User findByEmail(String email);

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
}
