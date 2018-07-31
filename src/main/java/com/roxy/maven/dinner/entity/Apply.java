package com.roxy.maven.dinner.entity;

import java.sql.Timestamp;

/**
 * 报名
 */
public class Apply {
    private Long id;
    private User user;
    private Dinner dinner;
    private Timestamp createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Dinner getDinner() {
        return dinner;
    }

    public void setDinner(Dinner dinner) {
        this.dinner = dinner;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Apply() {
    }

    public Apply(User user, Dinner dinner, Timestamp createTime) {
        this.user = user;
        this.dinner = dinner;
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Apply{" +
                "id=" + id +
                ", user=" + user +
                ", dinner=" + dinner +
                ", createTime=" + createTime +
                '}';
    }
}
