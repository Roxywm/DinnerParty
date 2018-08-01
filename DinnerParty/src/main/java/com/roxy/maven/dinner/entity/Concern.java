package com.roxy.maven.dinner.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 关注
 */
public class Concern implements Serializable {
    private Long id;
    private User user;//染月
    private User concernUser;//染月关注的人
    private Integer status;
    private Timestamp concernTime;//关注时间

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

    public User getConcernUser() {
        return concernUser;
    }

    public void setConcernUser(User concernUser) {
        this.concernUser = concernUser;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Timestamp getConcernTime() {
        return concernTime;
    }

    public void setConcernTime(Timestamp concernTime) {
        this.concernTime = concernTime;
    }

    public Concern() {
    }

    public Concern(User user, User concernUser, Integer status, Timestamp concernTime) {
        this.user = user;
        this.concernUser = concernUser;
        this.status = status;
        this.concernTime = concernTime;
    }

    @Override
    public String toString() {
        return "Concern{" +
                "id=" + id +
                ", user=" + user +
                ", concernUser=" + concernUser +
                ", status=" + status +
                ", concernTime=" + concernTime +
                '}';
    }
}
