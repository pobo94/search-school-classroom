package com.room.data.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.ClassRoom;

public class Test2 {

	public static void main(String[] args) {
		
		DbConnection dbconn=new DbConnection();
		DbClassRoom dbroom=new DbClassRoom(dbconn);
		ClassRoom classroom=new ClassRoom();
		List<ClassRoom> roomList=new ArrayList<ClassRoom>();
		String[] strLesson={"1-2节","3-4节","5-6节","7-8节","9-10节"};
		roomList=dbroom.getCurDayEmptyRoom("A", 1, 1);
		if(roomList==null){
			System.out.println("很抱歉，没有查询到。");
		}else{
			for(int i=0;i<roomList.size();i++){
				classroom=roomList.get(i);
				String roomNum=classroom.getRoomNum();
				int lesson=classroom.getLesson();
				String buildNum=classroom.getBuildingNum();
				System.out.println(strLesson[lesson-(lesson+1)/2]);
				System.out.print(buildNum);
				System.out.print(roomNum+"");
				System.out.println();
				
			}
		}
		dbconn.disConnect();
		

	}

}
