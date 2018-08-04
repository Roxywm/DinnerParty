package com.roxy.maven.dinner.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * 饭局
 */
public class Dinner implements Serializable {
    private Long id;
    private User user;//所属用户
    private String titel;//标题
    private Double price;
    private Integer maximum;//设置最多报名人数
    private Timestamp startTime;//开始时间
    private Timestamp endTime;//结束时间
    private Category category;//类型
    private String label;//标签
    private String thumbnail;//缩略图
    private String details;//活动详情
    private Integer enrolment;//报名人数
    private Integer interest;//感兴趣
    private Integer status;//0未开始 1已开始 2已结束

    private List<Photo> photos;//饭局照片

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

    public String getTitel() {
        return titel;
    }

    public void setTitel(String titel) {
        this.titel = titel;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getMaximum() {
        return maximum;
    }

    public void setMaximum(Integer maximum) {
        this.maximum = maximum;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Integer getEnrolment() {
        return this.enrolment;
    }

    public void setEnrolment(Integer enrolment) {
        this.enrolment = enrolment;
    }

    public Integer getInterest() {
        return interest;
    }

    public void setInterest(Integer interest) {
        this.interest = interest;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<Photo> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }

    public Dinner() {
    }

    public Dinner(Long id) {
        this.id = id;
    }

    public Dinner(User user, String titel, Double price, Integer maximum, Timestamp startTime, Timestamp endTime, Category category, String label, String thumbnail, String details, Integer enrolment, Integer interest, Integer status, List<Photo> photos) {
        this.user = user;
        this.titel = titel;
        this.price = price;
        this.maximum = maximum;
        this.startTime = startTime;
        this.endTime = endTime;
        this.category = category;
        this.label = label;
        this.thumbnail = thumbnail;
        this.details = details;
        this.enrolment = enrolment;
        this.interest = interest;
        this.status = status;
        this.photos = photos;
    }

    @Override
    public String toString() {
        return "Dinner{" +
                "id=" + id +
                ", user=" + user +
                ", titel='" + titel + '\'' +
                ", price=" + price +
                ", maximum=" + maximum +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", category=" + category +
                ", label='" + label + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", details='" + details + '\'' +
                ", Enrolment=" + enrolment +
                ", interest=" + interest +
                ", status=" + status +
                ", photos=" + photos +
                '}';
    }
}
