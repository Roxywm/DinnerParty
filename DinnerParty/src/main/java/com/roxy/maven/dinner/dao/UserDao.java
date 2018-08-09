package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    User findByEmail(String email);

    User findById(long id);

    void register(User user);

    int update(User user);

    List<User> findAll();

}
