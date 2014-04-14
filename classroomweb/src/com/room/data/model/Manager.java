package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Manager {

	private int adminId;
	private String account;
	private String passWord;
	private String realName;
	private int gender;
	private String qq;
	private String email;
	private String mobile;
	private int status;
	private int role;
	private Date registerTime;
	private Date LastTime;
	private int vistCount=0;
	private String description;
	
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Manager(ResultSet rs) {
		try {
		    setAdminId(rs.getInt(1));
			setAccount(rs.getString(2));
			setPassWord(rs.getString(3));
			setRealName(rs.getString(4));			
			setGender(rs.getInt(5));
			setEmail(rs.getString(6));
			setMobile(rs.getString(7));
			setStatus(rs.getInt(8));
			setRole(rs.getInt(9));
			setRegisterTime(rs.getDate(10));
			setLastTime(rs.getDate(11));			
			setVistCount(rs.getInt(12));
			setDescription(rs.getString(13));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Manager(int adminId, String account, String passWord,
			String realName, int gender, String qq, String email,
			String mobile, int status, int role, Date registerTime,
			Date lastTime, int vistCount, String description) {
		super();
		this.adminId = adminId;
		this.account = account;
		this.passWord = passWord;
		this.realName = realName;
		this.gender = gender;
		this.qq = qq;
		this.email = email;
		this.mobile = mobile;
		this.status = status;
		this.role = role;
		this.registerTime = registerTime;
		LastTime = lastTime;
		this.vistCount = vistCount;
		this.description = description;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
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

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}

	
