package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.BBS_Section;

public class DbBBS_Section {
	
	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	int pagesize=3;
	
	public DbBBS_Section(DbConnection dbconn) {
		this.dbconn = dbconn;
	}
	
	//获取板块列表
	public List<BBS_Section> getBBS_SecList(int page){
		
		List<BBS_Section> sectionList=new ArrayList<BBS_Section>(); 
		String sql="select * from bbs_section limit "+(page-1)*pagesize+","+pagesize;
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BBS_Section bbs_section=new BBS_Section(rs);
				sectionList.add(bbs_section);
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
		
		return sectionList;
		
	}
	
	
}
