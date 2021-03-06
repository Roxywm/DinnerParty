package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.CategoryDao;
import com.roxy.maven.dinner.entity.Category;
import com.roxy.maven.dinner.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

//    @CacheEvict(value = "findAllCategory",allEntries = true)
    @Override
    public int create(Category category) {
        return categoryDao.create(category);
    }

//    @CacheEvict(value = "findAllCategory",allEntries = true)
    @Override
    public int delete(long id) {
        return categoryDao.delete(id);
    }

    @Override
    public Category findById(long id) {
        return categoryDao.findById(id);
    }

//    @Cacheable(value = "findAllCategory", key = "CategoryServiceImpl")
    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }
}
