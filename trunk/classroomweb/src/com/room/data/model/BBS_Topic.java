package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.xml.crypto.Data;

public class BBS_Topic implements java.io.Serializable{

	private int tId;
	private int tSId;
	private int tUId;
	private String tTopic;
	private String tContents;
	private Date tPubTime;
	private int tReplyCount;
	private int tClickCount;
	
	private BBS_Section bbs_section;
	
	public BBS_Topic() {
		
	}

	public BBS_Topic(ResultSet rs) {
		
		try {
			settId(rs.getInt(1));
			settSId(rs.getInt(2));
			settUId(rs.getInt(3));
			settTopic(rs.getString(4));
			settContents(rs.getString(5));
			settPubTime(rs.getTimestamp(6));
			settReplyCount(rs.getInt(7));
			settClickCount(rs.getInt(8));
			//settLastClickTime(rs.getTimestamp(9));
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}

	public int gettId() {
		return tId;
	}

	public void settId(int tId) {
		this.tId = tId;
	}

	public int gettSId() {
		return tSId;
	}

	public void settSId(int tSId) {
		this.tSId = tSId;
	}

	public int gettUId() {
		return tUId;
	}

	public void settUId(int tUId) {
		this.tUId = tUId;
	}

	public String gettTopic() {
		return tTopic;
	}

	public void settTopic(String tTopic) {
		this.tTopic = tTopic;
	}

	public String gettContents() {
		return tContents;
	}

	public void settContents(String tContents) {
		this.tContents = tContents;
	}

	public Date gettPubTime() {
		return tPubTime;
	}

	public void settPubTime(Date tPubTime) {
		this.tPubTime = tPubTime;
	}

	public int gettReplyCount() {
		return tReplyCount;
	}

	public void settReplyCount(int tReplyCount) {
		this.tReplyCount = tReplyCount;
	}

	public int gettClickCount() {
		return tClickCount;
	}

	public void settClickCount(int tClickCount) {
		this.tClickCount = tClickCount;
	}

	public BBS_Section getBbs_section() {
		return bbs_section;
	}

	public void setBbs_section(BBS_Section bbs_section) {
		this.bbs_section = bbs_section;
	}
	
	
	
	
}
