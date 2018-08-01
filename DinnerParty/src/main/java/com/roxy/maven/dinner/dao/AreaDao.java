package com.roxy.maven.dinner.dao;

import java.util.List;

import com.roxy.maven.dinner.entity.Area;

public interface AreaDao {
	Area findById(Long id);
	List<Area> findByParentId(Long parentId);
}
