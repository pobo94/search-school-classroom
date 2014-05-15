package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.BBS_Reply;

public class DbBBS_Reply {
	
	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	public DbBBS_Reply(DbConnection dbconn) {
		this.dbconn = dbconn;
	}
	
	//根据帖子ID，获取所有的回复信息
	public List<BBS_Reply> getReplyList(int tId){
		
		List<BBS_Reply> replyList=new ArrayList<BBS_Reply>();
		
		String sql="select * from bbs_reply where RTId=? order by RTime desc";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, tId);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				BBS_Reply reply=new BBS_Reply(rs);
				replyList.add(reply);
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
		
		return replyList;
	}
	//获取不同板块中帖子对应的回复的总数
		public int getReplyCount(int tId){
			
			int count=0;
			String sql="select count(*) as totalCount from bbs_reply where RTId=?";			
			try {
				pstmt=dbconn.getConn().prepareStatement(sql);
				pstmt.setInt(1, tId);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					count = rs.getInt("totalCount");
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
			
			return count;
		}
		
	

}
