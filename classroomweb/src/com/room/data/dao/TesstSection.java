package com.room.data.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.room.data.model.BBS_Reply;
import com.room.data.model.BBS_Section;
import com.room.data.model.BBS_Topic;
import com.room.data.tools.Helper;

public class TesstSection {

	public static void main(String[] args) {
		
		DbConnection dbconn=new DbConnection();
		DbBBS_Section dbSection=new DbBBS_Section(dbconn);
		DbBBS_Topic dbTopic=new DbBBS_Topic(dbconn);
		DbBBS_Reply dbreply=new DbBBS_Reply(dbconn);
		
		List<BBS_Section> sectionList=new ArrayList<BBS_Section>();
		List<BBS_Topic> topicList=new ArrayList<BBS_Topic>();
		List<Integer> tCountList=new ArrayList<Integer>();//存放不同板块内帖子总数数列表
		
		sectionList=dbSection.getBBS_SecList(1);
		tCountList=dbTopic.getEachTopicCount();
		
		for(int i=0;i<sectionList.size();i++){
			
			BBS_Section section=sectionList.get(i);
			int secId=section.getsId();//获取板块编号
			String secName=section.getsName();//获取板块名称
			String secStatement=section.getsStatement();//获取板块描述
			int total=tCountList.get(i);//帖子数
			
			System.out.println(secName+"      "+secStatement+"   帖子总数："+total);
			
			topicList=dbTopic.getList(secId);//根据板块Id,获取该版内的帖子列表
			for(int j=0;j<topicList.size();j++){
				
				BBS_Topic bbs_topic=topicList.get(j);
				int topicId=bbs_topic.gettId();//获取帖子ID
				String topicName=bbs_topic.gettTopic();//获取帖子名称；
				
				int num=dbreply.getReplyCount(topicId);//根据帖子ID获取每个帖子对应的回复数
				
				System.out.println("    帖子"+(j+1)+"  "+topicName+"   回复总数："+num);
			}
		}
		
		//获取指定帖子的回复列表
		List<BBS_Reply> replyList=new ArrayList<BBS_Reply>();
		BBS_Topic topic=dbTopic.getTopic(8);
		String name=topic.gettTopic();
		String content=topic.gettContents();
		String tPubTime=Helper.changeSimpleTime(topic.gettPubTime());
		System.out.println("["+name+"] "+content);
		System.out.println("发表于："+tPubTime);
		
		replyList=dbreply.getReplyList(8);
		BBS_Reply reply=new BBS_Reply();
		for(int m=0;m<replyList.size();m++){
			reply=replyList.get(m);
			String rcontent=reply.getrContent();
			String rTime=Helper.changeSimpleTime(reply.getrTime());
			System.out.println((m+1)+"楼回复:");
			System.out.println(rcontent);
			System.out.println(rTime);
		}
		
	   //添加帖子；
		boolean flag=false;
		BBS_Topic t1=new BBS_Topic();
		t1.settSId(1);
		t1.settUId(5);
		t1.settTopic("教学楼暑假安排");
		t1.settContents("只有一二楼教室开放，其他的教室关闭");
		t1.settPubTime(new Date());
		try {
			flag=dbTopic.addTopic(t1);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println("添加帖子="+flag);

	}

}
