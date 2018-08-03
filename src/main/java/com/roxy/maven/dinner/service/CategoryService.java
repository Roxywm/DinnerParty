package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.Category;

import java.util.List;

public interface CategoryService {

    int create(Category category);

    int delete(long id);

    Category findById(long id);

    List<Category> findAll();

}
