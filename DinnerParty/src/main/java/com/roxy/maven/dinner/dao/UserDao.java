package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    User findByEmail(String email);

    void register(User user);

    int update(User user);

}
