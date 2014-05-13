package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class BBS_Reply {
	
	private int rId;//回复编号
	private int rTId;//回复帖子编号
	private int rSId;//回复板块编号
	private int rUId;//回复用户编号
	private String rContent;//回帖内容
	private Date rTime;//回帖时间
	private int rClickCount;//回帖点击次数
	
	private BBS_Section bbs_section;
	private BBS_Topic bbs_topic;
	
	public BBS_Topic getBbs_topic() {
		return bbs_topic;
	}

	public void setBbs_topic(BBS_Topic bbs_topic) {
		this.bbs_topic = bbs_topic;
	}

	public BBS_Reply() {
		
	}

	public BBS_Reply(ResultSet rs) {
		
		try {
			setrId(rs.getInt(1));
			setrTId(rs.getInt(2));
			setrSId(rs.getInt(3));
			setrUId(rs.getInt(4));
			setrContent(rs.getString(5));
			setrTime(rs.getTimestamp(6));
			setrClickCount(rs.getInt(7));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getrTId() {
		return rTId;
	}

	public void setrTId(int rTId) {
		this.rTId = rTId;
	}

	public int getrSId() {
		return rSId;
	}

	public void setrSId(int rSId) {
		this.rSId = rSId;
	}

	public int getrUId() {
		return rUId;
	}

	public void setrUId(int rUId) {
		this.rUId = rUId;
	}


	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrTime() {
		return rTime;
	}

	public void setrTime(Date rTime) {
		this.rTime = rTime;
	}

	public int getrClickCount() {
		return rClickCount;
	}

	public void setrClickCount(int rClickCount) {
		this.rClickCount = rClickCount;
	}

	public BBS_Section getBbs_section() {
		return bbs_section;
	}

	public void setBbs_section(BBS_Section bbs_section) {
		this.bbs_section = bbs_section;
	}
	
	
	
}
