package com.roxy.maven.dinner.entity;

import com.roxy.maven.dinner.enumeration.LogType;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 管理员日志类
 */
public class AdminLog implements Serializable {
	private Long id;
	private Admin admin;
	private Timestamp createTime;
	private LogType type;
	private String content;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public LogType getType() {
		return type;
	}
	public void setType(LogType type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "AdminLog{" +
				"id=" + id +
				", admin=" + admin +
				", createTime=" + createTime +
				", type=" + type +
				", content='" + content + '\'' +
				'}';
	}
}
