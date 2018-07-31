package com.roxy.maven.dinner.service.impl;

import java.util.List;

import com.roxy.maven.dinner.dao.IAdminLogDao;
import com.roxy.maven.dinner.entity.AdminLog;
import com.roxy.maven.dinner.service.IAdminLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminLogServiceImpl implements IAdminLogService {

	@Autowired
	private IAdminLogDao adminLogDao;
	
	public void create(AdminLog log) {
		adminLogDao.create(log);		
	}

	public List<AdminLog> findByAdminId(Long id) {
		return adminLogDao.findByAdminId(id);
	}

	public List<AdminLog> findAll() {
		return adminLogDao.findAll();
	}

	public int getLoginCount(Long id) {
		return adminLogDao.getLoginCount(id);
	}
	
}
