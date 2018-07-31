package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserDao {

    User findByAccount(String account);

    void register(User user);

}
