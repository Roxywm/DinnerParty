package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.IAdminDao;
import com.roxy.maven.dinner.entity.Admin;
import com.roxy.maven.dinner.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements IAdminService {

    @Autowired
    private IAdminDao adminDao;

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
