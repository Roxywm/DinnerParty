package com.roxy.maven.dinner.entity;

import java.io.Serializable;

/**
 * 地区
 */
public class Area implements Serializable {
    private Long id;
    private String name;
    private Area parent;

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

    public Area getParent() {
        return parent;
    }

    public void setParent(Area parent) {
        this.parent = parent;
    }

    public Area() {
        this.id = 450521L;
        this.name = "中国";
    }

    public Area(String name, Area parent) {
        this.name = name;
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parent=" + parent +
                '}';
    }
}
