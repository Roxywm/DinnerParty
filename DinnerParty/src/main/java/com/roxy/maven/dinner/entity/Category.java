package com.roxy.maven.dinner.entity;

import java.io.Serializable;

/**
 * 类别
 */
public class Category implements Serializable {
    private Long id;
    private String name;
    private Integer type;
    private Integer status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Category() {
    }

    public Category(String name, Integer type, Integer status) {
        this.name = name;
        this.type = type;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", status=" + status +
                '}';
    }
}
