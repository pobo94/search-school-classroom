package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.room.data.model.ClassRoom;

public class DbClassRoom {
	
	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	public DbClassRoom(DbConnection db){
		
		// 通过构造方法取得数据库的连接
			this.dbconn = db;		
	}
	public boolean insertRoom(ClassRoom room){
		
		boolean flag=false;
		int adminId=room.getAdminId();
		int roomId=room.getRoomId();
		String roomNum=room.getRoomNum();
		String buildingNum=room.getBuildingNum();
		int isEmpty=room.getIsEmpty();
		int lesson=room.getLesson();
		int day=room.getDay();
		int week=room.getWeek();
		String term=room.getTerm();
		
		String sql="insert into classroom(AdminId,RoomId,RoomNum,BuildingNum,IsEmpty,Lesson,)"+
		"(Day,Week,Term)values(?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, adminId);
			pstmt.setInt(2, roomId);
			pstmt.setString(3, roomNum);
			pstmt.setString(4, buildingNum);
			pstmt.setInt(5, isEmpty);
			pstmt.setInt(6, lesson);
			pstmt.setInt(7, day);
			pstmt.setInt(8, week);
			pstmt.setString(9, term);
			
			if(pstmt.executeUpdate()>0){
				flag=true;
			};
			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			
			try {
				pstmt.close();
				dbconn.disConnect();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return flag;
	}
}
