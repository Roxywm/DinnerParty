package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryDao {

    int create(Category category);

    int delete(long id);

    Category findById(long id);

    List<Category> findAll();

}
