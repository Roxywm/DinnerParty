package com.roxy.maven.dinner.entity;

import java.sql.Timestamp;

/**
 * 留言
 */
public class DinnerMessage {
    private Long id;
    private Dinner dinner;//打火锅
    private User msgUser;//给打火锅留言的人
    private String message;//留言内容
    private Timestamp msgTime;//留言时间

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

    public DinnerMessage() {
    }

    public DinnerMessage(Dinner dinner, User msgUser, String message, Timestamp msgTime) {
        this.dinner = dinner;
        this.msgUser = msgUser;
        this.message = message;
        this.msgTime = msgTime;
    }

    @Override
    public String toString() {
        return "DinnerMessage{" +
                "id=" + id +
                ", dinner=" + dinner +
                ", msgUser=" + msgUser +
                ", message='" + message + '\'' +
                ", msgTime=" + msgTime +
                '}';
    }
}
