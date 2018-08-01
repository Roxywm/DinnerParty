package com.roxy.maven.dinner.service.impl;

import java.util.List;

import com.roxy.maven.dinner.dao.AreaDao;
import com.roxy.maven.dinner.entity.Area;
import com.roxy.maven.dinner.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaDao areaDao;
	
	public Area findById(Long id) {
		return areaDao.findById(id);
	}

	public List<Area> findByParentId(Long parentId) {
		return areaDao.findByParentId(parentId);
	}

}
