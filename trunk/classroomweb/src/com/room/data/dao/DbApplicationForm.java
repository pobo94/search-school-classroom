package com.room.data.dao;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.room.data.model.ApplicationForm;

public class DbApplicationForm {

	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public DbApplicationForm(DbConnection db) {

		this.dbconn = db;
	}

	// 在user表中插入一行
	public boolean insertApplicationForm(ApplicationForm applicationForm) {

		boolean flag = false;
		int adminId = applicationForm.getAdminId();
		int userId = applicationForm.getUserId();
		String buildingNum = applicationForm.getBuildingNum();
		String roomNum = applicationForm.getRoomNum();
		String reason = applicationForm.getReason();
		int lessEnd = applicationForm.getLessonEnd();
		int result = applicationForm.getResult();
		int week = applicationForm.getWeek();
		int lessonStart = applicationForm.getLessonStart();

		String sql = "insert into application_form(adminId,userId,buildingNum,roomNum,reason,lessEnd,result,week,lessonStart)values(?,?,?,?,?,?,?,?,?)";

		try {
			pstmt = dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, adminId);
			pstmt.setInt(2, userId);
			pstmt.setString(3, buildingNum);
			pstmt.setString(4, roomNum);
			pstmt.setString(5, reason);
			pstmt.setInt(6, lessEnd);
			pstmt.setInt(7, result);
			pstmt.setInt(8, week);
			pstmt.setInt(9, lessonStart);

			if (pstmt.executeUpdate() > 0) {
				flag = true;
			}
			;

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	/*
	 * // 根据用戶名匹配密码； public ApplicationForm getApplicationFormByAccount(String
	 * account) { ApplicationForm user = null; String sql =
	 * "select * from user where account=?"; try { pstmt =
	 * dbconn.getConn().prepareStatement(sql); pstmt.setString(1, account); rs =
	 * pstmt.executeQuery();
	 * 
	 * while (rs.next()) { user = new User(rs); } } catch (SQLException e) {
	 * e.printStackTrace(); } return user; }
	 * 
	 * // 判断用戶名是否村存在，根据返回的布尔值确定是否添加 public boolean exit(String account) {
	 * 
	 * boolean flag = false; String sql = "select * from user where Account=?";
	 * try { pstmt = dbconn.getConn().prepareStatement(sql); pstmt.setString(1,
	 * account); rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) { flag = true; } } catch (SQLException e) {
	 * e.printStackTrace(); } finally { try { rs.close(); pstmt.close(); } catch
	 * (SQLException e) { e.printStackTrace(); }
	 * 
	 * }
	 * 
	 * return flag; }
	 */

	// 返回user列表
	// public List<User> getUserList(List<User> userList,int page,int
	// page_size){
	//
	// String
	// sql="select * from user limit "+(page-1)*page_size+","+page_size;
	// try {
	// pstmt=dbconn.getConn().prepareStatement(sql);
	// rs=pstmt.executeQuery();
	//
	// while(rs.next()){
	// User user=new User(rs);
	// userList.add(user);
	// }
	// } catch (SQLException e) {
	//
	// e.printStackTrace();
	// }finally{
	// try {
	// rs.close();
	// pstmt.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	// return userList;
	// }

	// // 返回总列表数
	// public int countAll() {
	//
	// String sql = "select count(*) as totalCount  from user ";
	// int rowcount = 0;
	// try {
	// pstmt=dbconn.getConn().prepareStatement(sql);
	// rs=pstmt.executeQuery();
	// if (rs.next()) {
	// rowcount = rs.getInt("totalCount");
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }finally{
	// try {
	// rs.close();
	// pstmt.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	// return rowcount;
	// }

	// //根据教室ID，删除一条记录
	// public boolean deleteRoom(int roomId){
	//
	// boolean flag=false;
	// String sql="delete from classroom where RoomId=?";
	// try {
	// pstmt=dbconn.getConn().prepareStatement(sql);
	// pstmt.setInt(1, roomId);
	// int num=pstmt.executeUpdate();
	// if(num>0){
	// flag=true;
	// }
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }finally{
	// try {
	// pstmt.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	// return flag;
	// }

}
