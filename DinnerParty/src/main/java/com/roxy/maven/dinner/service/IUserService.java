package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.User;

public interface IUserService {

    /**
     * 按用户名查找用户
     * @param account
     * @return
     */
    User findByAccount(String account);

    /**
     * 注册用户
     * @param user
     */
    void register(User user);
}
