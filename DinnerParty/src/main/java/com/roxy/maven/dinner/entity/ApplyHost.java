package com.roxy.maven.dinner.entity;

import java.io.Serializable;

/**
 * 报名主持
 */
public class ApplyHost implements Serializable {
    private Long id;
    private String name;
    private User user;
    private Area area;
    private String email;
    private String mobile;
    private String photo;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public ApplyHost() {
    }

    public ApplyHost(String name, User user, Area area, String email, String mobile, String photo, Integer status) {
        this.name = name;
        this.user = user;
        this.area = area;
        this.email = email;
        this.mobile = mobile;
        this.photo = photo;
        this.status = status;
    }

    @Override
    public String toString() {
        return "ApplyHost{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", user=" + user +
                ", area=" + area +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", photo='" + photo + '\'' +
                ", status=" + status +
                '}';
    }
}
