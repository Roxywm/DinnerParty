package com.roxy.maven.dinner.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 管理员类
 */
public class Admin implements Serializable {
	private Long id;
	private String username;
	private String password;
	private Timestamp lastLoginTime;//上一次登录时间
	private Timestamp currLoginTime;//当前登录时间
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public Timestamp getCurrLoginTime() {
		return currLoginTime;
	}
	public void setCurrLoginTime(Timestamp currLoginTime) {
		this.currLoginTime = currLoginTime;
	}

	@Override
	public String toString() {
		return "Admin{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", lastLoginTime=" + lastLoginTime +
				", currLoginTime=" + currLoginTime +
				'}';
	}
}
