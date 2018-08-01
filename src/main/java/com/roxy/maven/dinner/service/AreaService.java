package com.roxy.maven.dinner.service;


import com.roxy.maven.dinner.entity.Area;

import java.util.List;

public interface AreaService {
	Area findById(Long id);
	List<Area> findByParentId(Long parentId);
}
