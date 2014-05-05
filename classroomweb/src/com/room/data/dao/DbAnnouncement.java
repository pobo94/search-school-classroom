package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.Announcement;
import com.room.data.tools.Helper;

public class DbAnnouncement {
	
	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	int pagesize=10;
	
	public DbAnnouncement(DbConnection db){
		
		this.dbconn=db;	
	}
	//添加一条公告
	public boolean insertAnnounce(Announcement ann) throws SQLException{
		
		int adminId=ann.getAdminId();
		String content=ann.getContent();
		String  pubtime=Helper.changeTime(ann.getPubTime());
		
		
		String sql="insert into announcement (AdminId,Content,PubTime) values(?,?,?)";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, adminId);
			pstmt.setString(2, content);
			pstmt.setString(3, pubtime);
			
			if(pstmt.executeUpdate()>0){
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pstmt.close();
		}
		return false;
		
	}
	//删除一条公告
	public boolean deleteAnnounce(int announceId) throws SQLException{
		
		String sql="delete from announcement where AnnounceId=?";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, announceId);
			int num=pstmt.executeUpdate();
			if(num>0){
				return true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			pstmt.close();
		}
		return false;
		
	}
	//全部列表显示
	public List<Announcement> getAnnList() throws SQLException{
		
		List<Announcement> annlist=new ArrayList<Announcement>();
		String sql="select AnnounceId,Content,PubTime from announcement";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				Announcement announcement=new Announcement(rs);
				annlist.add(announcement);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
		}
		return annlist;
		
	}
	
	//限制列表条数显示：按日期降序排序，取前6条
	public List<Announcement> getSortAnnList() throws SQLException{
		
	
		List<Announcement> annlist=new ArrayList<Announcement>();
		String sql="select AnnounceId,Content,PubTime from announcement order by PubTime desc limit 0,"+pagesize;
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				Announcement announcement=new Announcement(rs);
				annlist.add(announcement);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
		}
		return annlist;
		
	}
	//更新公告
	public boolean updateAnnounce(Announcement announcement) throws SQLException{
		
		int adminId=announcement.getAdminId();
		String content=announcement.getContent();
		String pubTime=Helper.changeTime(announcement.getPubTime());
		
		String sql="update announcement set AdminId=? Content=? PubTime=?";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, adminId);
			pstmt.setString(2, content);
			pstmt.setString(3, pubTime);
			int num=pstmt.executeUpdate();
			if(num>0){
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pstmt.close();
		}
		
		return false;
		
	}
	
	//统计公告条数
	public int getCountAnn() throws SQLException{
		
		int annNum=0;
		String sql="select count(*) as num from announcement";
		pstmt=dbconn.getConn().prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			
			annNum=rs.getInt("num");
		}
		rs.close();
		pstmt.close();
		return annNum;
		
	}
}
