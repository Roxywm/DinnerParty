package com.roxy.maven.dinner.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 留言
 */
public class UserMsg implements Serializable {
    private Long id;
    private User user;//染月
    private User msgUser;//给染月留言的人
    private String message;//留言内容
    private Timestamp msgTime;//留言时间

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

    public User getMsgUser() {
        return msgUser;
    }

    public void setMsgUser(User msgUser) {
        this.msgUser = msgUser;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getMsgTime() {
        return msgTime;
    }

    public void setMsgTime(Timestamp msgTime) {
        this.msgTime = msgTime;
    }

    public UserMsg() {
    }

    public UserMsg(User user, User msgUser, String message, Timestamp msgTime) {
        this.user = user;
        this.msgUser = msgUser;
        this.message = message;
        this.msgTime = msgTime;
    }

    @Override
    public String toString() {
        return "UserMsg{" +
                "id=" + id +
                ", user=" + user +
                ", msgUser=" + msgUser +
                ", message='" + message + '\'' +
                ", msgTime=" + msgTime +
                '}';
    }
}
