package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.Admin;

import java.util.List;

public interface AdminService {
    Admin findByUsername(String username);
    List<Admin> findAll();
    void update(Admin admin);
}
