package com.roxy.maven.dinner.entity;

/**
 * 用户
 */
public class User {
    private Long id;
    private String account;//账号
    private String password;//密码
    private String salt;//盐
    private String nickname;//昵称
    private String icon;//用户头像
    private String sex;
    private String mobile;
    private String email;
    private String job;//职业
    private Area area;//城市
    private String about;//介绍

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public User() {
    }

    public User(String account, String password, String salt, String nickname, String icon, String sex, String mobile, String email, String job, Area area, String about) {
        this.account = account;
        this.password = password;
        this.salt = salt;
        this.nickname = nickname;
        this.icon = icon;
        this.sex = sex;
        this.mobile = mobile;
        this.email = email;
        this.job = job;
        this.area = area;
        this.about = about;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", nickname='" + nickname + '\'' +
                ", icon='" + icon + '\'' +
                ", sex='" + sex + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", job='" + job + '\'' +
                ", area=" + area +
                ", about='" + about + '\'' +
                '}';
    }
}
