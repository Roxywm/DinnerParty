package com.roxy.maven.dinner.entity;

import java.sql.Timestamp;

/**
 * 粉丝
 */
public class Fans {
    private Long id;
    private User user;//染月
    private User fansUser;//染月的粉丝
    private Integer status;
    private Timestamp fansTime;

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

    public User getFansUser() {
        return fansUser;
    }

    public void setFansUser(User fansUser) {
        this.fansUser = fansUser;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Timestamp getFansTime() {
        return fansTime;
    }

    public void setFansTime(Timestamp fansTime) {
        this.fansTime = fansTime;
    }

    public Fans() {
    }

    public Fans(User user, User fansUser, Integer status, Timestamp fansTime) {
        this.user = user;
        this.fansUser = fansUser;
        this.status = status;
        this.fansTime = fansTime;
    }

    @Override
    public String toString() {
        return "Fans{" +
                "id=" + id +
                ", user=" + user +
                ", fansUser=" + fansUser +
                ", status=" + status +
                ", fansTime=" + fansTime +
                '}';
    }
}
