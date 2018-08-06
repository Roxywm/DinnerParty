package com.roxy.maven.dinner.entity;

import java.sql.Timestamp;

public class Orders {
    private Long id;
    private User user;
    private Dinner dinner;
    private String remark;
    private Double total;
    private String outTradeNo;//订单号
    private String tradeNo;//支付宝交易号
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Orders() {
    }

    public Orders(Long id) {
        this.id = id;
    }

    public Orders(User user, Dinner dinner, String remark, Double total, String outTradeNo, String tradeNo, Timestamp createTime) {
        this.user = user;
        this.dinner = dinner;
        this.remark = remark;
        this.total = total;
        this.outTradeNo = outTradeNo;
        this.tradeNo = tradeNo;
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", user=" + user +
                ", dinner=" + dinner +
                ", remark='" + remark + '\'' +
                ", total=" + total +
                ", outTradeNo=" + outTradeNo +
                ", tradeNo=" + tradeNo +
                ", createTime=" + createTime +
                '}';
    }
}
