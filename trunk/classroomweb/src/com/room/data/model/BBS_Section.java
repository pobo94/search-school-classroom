package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BBS_Section {
	
	
	private int sId;
	private String sName;
	private int sMasterId;
	private String sStatement;
	private int sClickCount;
	private int sTopicCount;
	
	public BBS_Section() {
		
	}

	public BBS_Section(ResultSet rs) {
		
		try {
			setsId(rs.getInt(1));
			setsName(rs.getString(2));
			setsMasterId(rs.getInt(3));
			setsStatement(rs.getString(4));
			setsClickCount(rs.getInt(5));
			setsTopicCount(rs.getInt(6));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public int getsMasterId() {
		return sMasterId;
	}

	public void setsMasterId(int sMasterId) {
		this.sMasterId = sMasterId;
	}

	public String getsStatement() {
		return sStatement;
	}

	public void setsStatement(String sStatement) {
		this.sStatement = sStatement;
	}

	public int getsClickCount() {
		return sClickCount;
	}

	public void setsClickCount(int sClickCount) {
		this.sClickCount = sClickCount;
	}

	public int getsTopicCount() {
		return sTopicCount;
	}

	public void setsTopicCount(int sTopicCount) {
		this.sTopicCount = sTopicCount;
	}
	
	
	

}
