package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Announcement {
	
	private int adminId;
	private int announceId;
	private String content;
	private Date pubTime;
	
	public Announcement() {
		super();
	}

	public Announcement(int adminId, int announceId, String content,
			Date pubTime) {
		super();
		this.adminId = adminId;
		this.announceId = announceId;
		this.content = content;
		this.pubTime = pubTime;
	}

	public Announcement(ResultSet rs) {
		try {
			
			setAdminId(rs.getInt(1));
			setAnnounceId(rs.getInt(2));
			setContent(rs.getString(3));
			setPubTime(rs.getDate(4));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public int getAnnounceId() {
		return announceId;
	}

	public void setAnnounceId(int announceId) {
		this.announceId = announceId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPubTime() {
		return pubTime;
	}

	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}
	
	
	

}
