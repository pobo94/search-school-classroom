package com.room.data.dao;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.ApplicationForm;
import com.room.data.model.User;

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

		String sql = "insert into application_form(adminId,userId,buildingNum,roomNum,reason,lessonEnd,result,week,lessonStart)values(?,?,?,?,?,?,?,?,?)";

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

	public List<ApplicationForm> getListByUserId(int userId) {
		
		 String sql="select * from application_form where userId=? ";
		 List<ApplicationForm> applicationFormList=new ArrayList();
		 try {
		 pstmt=dbconn.getConn().prepareStatement(sql);
		 pstmt.setInt(1, userId);
		 rs=pstmt.executeQuery();
		
		 while(rs.next()){
		 ApplicationForm applicationForm=new ApplicationForm(rs);
		 applicationFormList.add(applicationForm);
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
		 return applicationFormList;
	}

	public List<ApplicationForm> getListByResult(int i) {
		 String sql="select * from application_form where adminId=? ";
		 List<ApplicationForm> applicationFormList=new ArrayList();
		 try {
		 pstmt=dbconn.getConn().prepareStatement(sql);
		 pstmt.setInt(1, i);
		 rs=pstmt.executeQuery();
		
		 while(rs.next()){
		 ApplicationForm applicationForm=new ApplicationForm(rs);
		 applicationFormList.add(applicationForm);
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
		 return applicationFormList;
	}

	public void updateByApplyId(ApplicationForm applicationForm) {
		
		int applyId=applicationForm.getApplyId();
		int adminId = applicationForm.getAdminId();		
		int result = applicationForm.getResult();	
		String sql="update application_form set adminId=?,result=? where applyId=?";
		try {
			pstmt = dbconn.getConn().prepareStatement(sql);
		
		pstmt.setInt(1, adminId);
		pstmt.setInt(2, result);
		pstmt.setInt(3, applyId);
		pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}



}
