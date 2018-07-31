package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.AdminLog;

import java.util.List;

public interface IAdminLogDao {
    void create(AdminLog log);
    List<AdminLog> findByAdminId(Long id);
    List<AdminLog> findAll();
    int getLoginCount(Long id);
}
