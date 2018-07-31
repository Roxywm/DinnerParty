package com.roxy.maven.dinner.entity;

import java.sql.Timestamp;

/**
 * 饭局照片
 */
public class Photo {
    private Long id;
    private Dinner dinner;//照片所属饭局
    private String src;//照片路径
    private Timestamp createTime;//创建时间

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Dinner getDinner() {
        return dinner;
    }

    public void setDinner(Dinner dinner) {
        this.dinner = dinner;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Photo() {
    }

    public Photo(Dinner dinner, String src, Timestamp createTime) {
        this.dinner = dinner;
        this.src = src;
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Photo{" +
                "id=" + id +
                ", dinner=" + dinner +
                ", src='" + src + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
