package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.room.data.model.User;
import com.room.data.tools.Helper;

public class DbUser {

	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public DbUser(DbConnection db) {

		this.dbconn = db;
	}

	//根据用户ID，获取用户名
	public String getUserNameById(int tid,int uid){
		String userName=null;
		String sql="select Account from user a,bbs_topic b where a.UserId=? and TId=?";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, tid);
			rs=pstmt.executeQuery();
			if(rs.next()){
				userName=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userName;
	}
	// 根据用戶名匹配密码；
	public User getUserByAccount(String account) {
		User user = null;
		String sql = "select * from user where account=?";
		try {
			pstmt = dbconn.getConn().prepareStatement(sql);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				user = new User(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	// 判断用戶名是否村存在，根据返回的布尔值确定是否添加
	public boolean exit(String account) {

		boolean flag = false;
		String sql = "select * from user where Account=?";
		try {
			pstmt = dbconn.getConn().prepareStatement(sql);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return flag;
	}
	
	 //返回user列表
	 public List<User> getUserList(List<User> userList,int page,int
	 page_size){
	
	 String
	 sql="select * from user limit "+(page-1)*page_size+","+page_size;
	 try {
	 pstmt=dbconn.getConn().prepareStatement(sql);
	 rs=pstmt.executeQuery();
	
	 while(rs.next()){
	 User user=new User(rs);
	 userList.add(user);
	 }
	 } catch (SQLException e) {
	
	 e.printStackTrace();
	 }finally{
	 try {
	 rs.close();
	 pstmt.close();
	 } catch (SQLException e) {
	 e.printStackTrace();
	 }
	 }
	 return userList;
	 }

	// // 返回总列表数
		 public int countAll() {
		
		 String sql = "select count(*) as totalCount  from user ";
		 int rowcount = 0;
		 try {
		 pstmt=dbconn.getConn().prepareStatement(sql);
		 rs=pstmt.executeQuery();
		 if (rs.next()) {
		 rowcount = rs.getInt("totalCount");
		 }
		 } catch (Exception e) {
		 e.printStackTrace();
		 }finally{
		 try {
		 rs.close();
		 pstmt.close();
		 } catch (SQLException e) {
		 e.printStackTrace();
		 }
		 }
		 return rowcount;
		 }

	// 在user表中插入一行
	 public boolean insertUser(User user){
	
	 boolean flag=false;
	 String account=user.getAccount();
	 String password=user.getPassWord();
	 String
	 sql="insert into user(account,passWord)values(?,?)";
	
	 try {
	 pstmt=dbconn.getConn().prepareStatement(sql);
	 pstmt.setString(1, account);
	 pstmt.setString(2, password);
	 
	 if(pstmt.executeUpdate()>0){
	 flag=true;
	 };
	
	 } catch (SQLException e) {
	 e.printStackTrace();
	
	 }finally {
	
	 try {
	 pstmt.close();
	 }
	 catch (SQLException e) {
	 e.printStackTrace();
	 }
	 }
	 return flag;
	 }

	
	
	//根据教室ID，更新记录
	// public boolean updateRoom(ClassRoom room){
	//
	// boolean flag=false;
	// int adminId=room.getAdminId();
	// String roomNum=room.getRoomNum();
	// String buildNum=room.getBuildingNum();
	// int isEmpty=room.getIsEmpty();
	// int lesson=room.getLesson();
	// int day=room.getDay();
	// int week=room.getWeek();
	// String term=room.getTerm();
	//
	// String
	// sql="update classroom set AdminId=?,RoomNum=?,BuildingNum=?,IsEmpty=?,Lesson=?,Day=?,Week=?,Term=? where RoomId=?";
	// try {
	// pstmt=dbconn.getConn().prepareStatement(sql);
	// pstmt.setInt(1, adminId);
	// pstmt.setString(2, roomNum);
	// pstmt.setString(3, buildNum);
	// pstmt.setInt(4, isEmpty);
	// pstmt.setInt(5, lesson);
	// pstmt.setInt(6, day);
	// pstmt.setInt(7, week);
	// pstmt.setString(8, term);
	// pstmt.setInt(9, room.getRoomId());
	//
	// int num=pstmt.executeUpdate();
	// if(num>0){
	// flag=true;
	// }
	//
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }finally{
	// try {
	// pstmt.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	//
	// return flag;
	// }
		
}
