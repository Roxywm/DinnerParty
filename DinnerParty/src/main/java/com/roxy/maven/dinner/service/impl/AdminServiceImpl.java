package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.AdminDao;
import com.roxy.maven.dinner.entity.Admin;
import com.roxy.maven.dinner.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin findByUsername(String username) {
        return adminDao.findByUsername(username);
    }

    @Override
    public List<Admin> findAll() {
        return adminDao.findAll();
    }

    @Override
    public void update(Admin admin) {
        adminDao.update(admin);
    }
}
