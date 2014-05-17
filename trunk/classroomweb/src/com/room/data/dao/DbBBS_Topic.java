package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.BBS_Topic;

public class DbBBS_Topic {
	
	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	public DbBBS_Topic(DbConnection dbconn) {
		this.dbconn = dbconn;
	}
	
	//根据帖子ID，获取帖子对象
	 public BBS_Topic getTopic(int tId){
		 
		 BBS_Topic topic=null;
		 String sql="select * from bbs_topic where TId=?";
		 try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, tId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				topic=new BBS_Topic(rs);
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
		 return topic;
	 }
	//获取板块对应的帖子列表
		public List<BBS_Topic> getList(int sId){
			
			List<BBS_Topic> topicList=new ArrayList<BBS_Topic>();
			String sql="select * from bbs_topic where TSId=?";
			try {
				pstmt=dbconn.getConn().prepareStatement(sql);
				pstmt.setInt(1, sId);
	     		rs=pstmt.executeQuery();
	     		while(rs.next()){
	     			
	     			BBS_Topic bbs_topic=new BBS_Topic(rs);
	     			topicList.add(bbs_topic);
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
			
			return topicList;
		}
		
	//获取板块对应的帖子名称列表
	public List<String> getTopicList(int sId){
		
		List<String> topicList=new ArrayList<String>();
		String sql="select TTopic from bbs_topic where TSId=?";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, sId);
     		rs=pstmt.executeQuery();
     		while(rs.next()){
     			String topic=rs.getString(1);
     			topicList.add(topic);
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
		
		return topicList;
	}
	//获取所有的帖子总数
	public int getCountAll(){
		int countAll=0;
		String sql="select count(*) as totalCount from bbs_topic";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			rs=pstmt.executeQuery(sql);
			if(rs.next()){
				countAll = rs.getInt("totalCount");
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
		
		return countAll;
	}
	//获取不同板块中帖子的总数
	public List<Integer> getEachTopicCount(){
		
		List<Integer> countList=new ArrayList<Integer>();
		String sql="select count(*) from bbs_topic group by TSId";
		
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				Integer i=rs.getInt(1);
				countList.add(i);
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
		
		return countList;
	}
	
	
	
}
