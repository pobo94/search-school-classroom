package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ClassRoom {

	private int adminId;
	private int roomId;
	private String roomNum;
	private String BuildingNum;
	private int isEmpty;
	private int lesson;
	private int day;
	private int week;
	private String term;
	
	public ClassRoom() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClassRoom(int adminId, int roomId, String roomNum,
			String buildingNum, int empty, int lesson, int day, int week,
			String term) {
		super();
		this.adminId = adminId;
		this.roomId = roomId;
		this.roomNum = roomNum;
		BuildingNum = buildingNum;
		this.isEmpty = empty;
		this.lesson = lesson;
		this.day = day;
		this.week = week;
		this.term = term;
	}
	
	public ClassRoom(ResultSet rs) {
	
		try {
			setAdminId(rs.getInt(1));
			setRoomId(rs.getInt(2));
			setRoomNum(rs.getString(3));
			setBuildingNum(rs.getString(4));
			setIsEmpty(rs.getInt(5));
			setLesson(rs.getInt(6));
			setDay(rs.getInt(7));
			setWeek(rs.getInt(8));
			setTerm(rs.getString(9));
			
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

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public String getBuildingNum() {
		return BuildingNum;
	}

	public void setBuildingNum(String buildingNum) {
		BuildingNum = buildingNum;
	}

	public int getIsEmpty() {
		return isEmpty;
	}

	public void setIsEmpty(int isEmpty) {
		this.isEmpty = isEmpty;
	}

	public int getLesson() {
		return lesson;
	}

	public void setLesson(int lesson) {
		this.lesson = lesson;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}
	
	
}
