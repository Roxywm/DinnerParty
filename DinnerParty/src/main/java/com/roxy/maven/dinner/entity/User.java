package com.roxy.maven.dinner.entity;

import java.io.Serializable;

/**
 * 用户
 */
public class User implements Serializable {
    private Long id;
    private String email;
    private String password;//密码
    private String nickname;//昵称
    private String icon;//用户头像
    private String sex;
    private String mobile;
    private String job;//职业
    private Area area;//城市
    private String about;//介绍
    private Integer hostStatus;//是否可用发布饭局

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Integer getHostStatus() {
        return hostStatus;
    }

    public void setHostStatus(Integer hostStatus) {
        this.hostStatus = hostStatus;
    }

    public User() {
    }

    public User(String email, String password, String nickname, String icon, String sex, String mobile, String job, Area area, String about, Integer hostStatus) {
        this.email = email;
        this.password = password;
        this.nickname = nickname;
        this.icon = icon;
        this.sex = sex;
        this.mobile = mobile;
        this.job = job;
        this.area = area;
        this.about = about;
        this.hostStatus = hostStatus;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", icon='" + icon + '\'' +
                ", sex='" + sex + '\'' +
                ", mobile='" + mobile + '\'' +
                ", job='" + job + '\'' +
                ", area=" + area +
                ", about='" + about + '\'' +
                ", hostStatus=" + hostStatus +
                '}';
    }
}
