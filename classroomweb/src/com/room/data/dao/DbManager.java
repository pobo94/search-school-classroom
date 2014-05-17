package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.Manager;
import com.room.data.model.User;

public class DbManager {

	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public DbManager(DbConnection db) {

		this.dbconn = db;
	}

	// 根据用戶名匹配密码；
	public Manager getManagerByAccount(String account) {
		Manager manager = null;
		String sql = "select * from manager where account=?";
		try {
			pstmt = dbconn.getConn().prepareStatement(sql);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				manager = new Manager(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return manager;
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

	// 返回manager列表
	public List<Manager> getManagerList() {

		List<Manager> managerList = new ArrayList();

		String sql = "select * from manager";
		try {
			pstmt = dbconn.getConn().prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Manager manager = new Manager(rs);
				managerList.add(manager);
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
		return managerList;
	}

}
