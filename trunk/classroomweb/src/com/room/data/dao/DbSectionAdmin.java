package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DbSectionAdmin {

	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	public DbSectionAdmin(DbConnection dbconn) {
		this.dbconn = dbconn;
	}
	
	//获取所有版块管理者的名字列表
	public List<String> getSANames(){

		List<String> saNameList=new ArrayList<String>();
		String sql="select name from section_admin a,bbs_section b where a.id=b.SMasterID";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				String name=rs.getString(1);
				saNameList.add(name);
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
		return saNameList;
	}
}
