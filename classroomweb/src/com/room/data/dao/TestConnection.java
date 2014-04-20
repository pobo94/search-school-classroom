package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.ClassRoom;

public class TestConnection {

	public static void main(String[] args) {
		
		
		DbConnection db = new DbConnection();		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ClassRoom> roomList=new ArrayList<ClassRoom>();
		String sql="select * from classroom";
		try {
			pstmt=db.getConn().prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				ClassRoom room=new ClassRoom(rs);
				roomList.add(room);			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
				db.disConnect();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
		
		for(int i=0;i<roomList.size();i++){
			ClassRoom room1=roomList.get(i);
			int adminId=room1.getAdminId();
			int roomId=room1.getRoomId();
			String roomNum=room1.getRoomNum();
			String buildNum=room1.getBuildingNum();
			int lesson=room1.getLesson();
			int day=room1.getDay();
			int week=room1.getWeek();
			String term=room1.getTerm();
			System.out.println(adminId+" "+roomId+" "+roomNum+" "+buildNum+" "+lesson+" "+day+" "+week+" "+term);
		}

	}

}
