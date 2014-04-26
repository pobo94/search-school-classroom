package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class User {
	
	private int userId;
	private String account;
	private String passWord;
	private String realName;
	private int gender;
	private String qq;
	private String email;
	private String mobile;
	private int status;
	private Date registerTime;
	private Date LastTime;
	private int vistCount=0;
	
	public User() {
		super();
		
	}

	public User(int userId, String account, String passWord, String realName,
			int gender, String qq, String email, String mobile, int status,
			Date register, Date lastTime, int vistCount) {
		super();
		this.userId = userId;
		this.account = account;
		this.passWord = passWord;
		this.realName = realName;
		this.gender = gender;
		this.qq = qq;
		this.email = email;
		this.mobile = mobile;
		this.status = status;
		this.registerTime = register;
		this.LastTime = lastTime;
		this.vistCount = vistCount;
	}

	public User(ResultSet rs){
		try {
		    setUserId(rs.getInt(1));
			setAccount(rs.getString(2));
			setPassWord(rs.getString(3));
			setRealName(rs.getString(4));			
			setGender(rs.getInt(5));
			setQq(rs.getString(6));
			setEmail(rs.getString(7));
			setMobile(rs.getString(8));
			setStatus(rs.getInt(9));
			setRegisterTime(rs.getDate(10));
			setLastTime(rs.getDate(11));			
			setVistCount(rs.getInt(12));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Date getLastTime() {
		return LastTime;
	}

	public void setLastTime(Date lastTime) {
		LastTime = lastTime;
	}

	public int getVistCount() {
		return vistCount;
	}

	public void setVistCount(int vistCount) {
		this.vistCount = vistCount;
	}
	
	
	

}
