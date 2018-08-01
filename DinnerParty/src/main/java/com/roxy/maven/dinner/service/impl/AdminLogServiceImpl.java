package com.roxy.maven.dinner.service.impl;

import java.util.List;

import com.roxy.maven.dinner.dao.AdminLogDao;
import com.roxy.maven.dinner.entity.AdminLog;
import com.roxy.maven.dinner.service.AdminLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class AdminLogServiceImpl implements AdminLogService {

	@Autowired
	private AdminLogDao adminLogDao;
	
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
