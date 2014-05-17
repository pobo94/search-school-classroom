package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ApplicationForm {

	private int applyId;
	private int adminId;
	private int userId;
	private String buildingNum;
	private String roomNum;
	private String reason;
	private int lessonEnd;
	private int result;
	private int week;
	private int lessonStart;

	public ApplicationForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApplicationForm(ResultSet rs) {
		try {
			setApplyId(rs.getInt(1));
			setAdminId(rs.getInt(2));
			setUserId(rs.getInt(3));
			setBuildingNum(rs.getString(4));
			setRoomNum(rs.getString(5));
			setReason(rs.getString(6));
			setLessonEnd(rs.getInt(7));
			setResult(rs.getInt(8));
			setWeek(rs.getInt(9));
			setLessonStart(rs.getInt(10));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ApplicationForm(int applyId, int adminId, int userId,
			String buildingNum, String roomNum, String reason,
			int lessonEnd, int result, int week, int lessonStart) {
		super();
		this.applyId = applyId;
		this.adminId = adminId;
		this.userId = userId;
		this.buildingNum = buildingNum;
		this.roomNum = roomNum;
		this.reason = reason;
		this.lessonEnd = lessonEnd;
		this.result = result;
		this.week = week;
		this.lessonStart = lessonStart;
	}

	public int getApplyId() {
		return applyId;
	}

	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getBuildingNum() {
		return buildingNum;
	}

	public void setBuildingNum(String buildingNum) {
		this.buildingNum = buildingNum;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}


	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		result = result;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	
	

	public int getLessonEnd() {
		return lessonEnd;
	}

	public void setLessonEnd(int lessonEnd) {
		this.lessonEnd = lessonEnd;
	}

	public int getLessonStart() {
		return lessonStart;
	}

	public void setLessonStart(int lessonStart) {
		this.lessonStart = lessonStart;
	}

}
