package com.roxy.maven.dinner.entity;

import java.sql.Timestamp;

/**
 * 饭局
 */
public class Dinner {
    private Long id;
    private String titel;//标题
    private Double price;
    private Integer maximum;//设置最多报名人数
    private Timestamp startTime;//开始时间
    private Timestamp endTime;//结束时间
    private Category category;//类型
    private String label;//标签
    private String thumbnail;//缩略图
    private String details;//活动详情
    private Integer interest;//感兴趣

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Integer getInterest() {
        return interest;
    }

    public void setInterest(Integer interest) {
        this.interest = interest;
    }

    public Dinner() {
    }

    public Dinner(String titel, Double price, Integer maximum, Timestamp startTime, Timestamp endTime, Category category, String label, String thumbnail, String details, Integer interest) {
        this.titel = titel;
        this.price = price;
        this.maximum = maximum;
        this.startTime = startTime;
        this.endTime = endTime;
        this.category = category;
        this.label = label;
        this.thumbnail = thumbnail;
        this.details = details;
        this.interest = interest;
    }

    @Override
    public String toString() {
        return "Dinner{" +
                "id=" + id +
                ", titel='" + titel + '\'' +
                ", price=" + price +
                ", maximum=" + maximum +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", category=" + category +
                ", label='" + label + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", details='" + details + '\'' +
                ", interest=" + interest +
                '}';
    }
}
