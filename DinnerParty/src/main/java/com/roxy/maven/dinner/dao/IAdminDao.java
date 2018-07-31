package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAdminDao {
    Admin findByUsername(String username);

    List<Admin> findAll();

    void update(Admin admin);
}
