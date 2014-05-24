package com.room.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.room.data.model.BBS_Reply;
import com.room.data.tools.Helper;

public class DbBBS_Reply {
	
	private DbConnection dbconn;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	public DbBBS_Reply(DbConnection dbconn) {
		this.dbconn = dbconn;
	}
	
	//获取回复人的账号
	public String getReplyUser(int userId){
		String account=null;
		String sql="select Account from user where UserId=?";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				account=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return account;
	}
	//发表回复（添加回复）
	public boolean addReply(BBS_Reply reply){
		
		boolean flag=false;
		int sectionId=reply.getrSId();
		int topicId=reply.getrTId();
		int userId=reply.getrUId();
		String content=reply.getrContent();
		String reply_time=Helper.changeTime(reply.getrTime());
		
		String sql="insert into bbs_reply (RTId,RSId,RUId,RContents,RTime) values (?,?,?,?,?)";
		try {
			pstmt=dbconn.getConn().prepareStatement(sql);
			pstmt.setInt(1, topicId);
			pstmt.setInt(2, sectionId);
			pstmt.setInt(3, userId);
			pstmt.setString(4, content);
			pstmt.setString(5, reply_time);
			int num=pstmt.executeUpdate();
			if(num>0){
				flag=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	//根据帖子ID，获取所有的回复信息
	public List<BBS_Reply> getReplyList(int tId){
		
		List<BBS_Reply> replyList=new ArrayList<BBS_Reply>();
		
		//String sql="select * from bbs_reply where RTId=? order by RTime desc";
		String sql="select * from bbs_reply where RTId=?";
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
