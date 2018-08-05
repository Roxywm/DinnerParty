package com.roxy.maven.dinner.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 报名
 */
public class ApplyParty implements Serializable {
    private Long id;
    private User user;
    private Dinner dinner;
    private String reason;//申请理由
    private String remark;//备注
    private Timestamp applyTime;//报名时间

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

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Timestamp getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Timestamp applyTime) {
        this.applyTime = applyTime;
    }

    public ApplyParty() {
    }

    public ApplyParty(User user, Dinner dinner, String reason, String remark, Timestamp applyTime) {
        this.user = user;
        this.dinner = dinner;
        this.reason = reason;
        this.remark = remark;
        this.applyTime = applyTime;
    }

    @Override
    public String toString() {
        return "ApplyParty{" +
                "id=" + id +
                ", user=" + user +
                ", dinner=" + dinner +
                ", reason='" + reason + '\'' +
                ", remark='" + remark + '\'' +
                ", applyTime=" + applyTime +
                '}';
    }
}
