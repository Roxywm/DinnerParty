package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.AdminLog;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminLogDao {
    void create(AdminLog log);
    List<AdminLog> findByAdminId(Long id);
    List<AdminLog> findAll();
    int getLoginCount(Long id);
}
