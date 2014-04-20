package com.room.data.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	public String DBDRIVER="org.gjt.mm.mysql.Driver";
	public String DBURL="jdbc:mysql://192.168.100.1:3306/ksdb";
	public String DBUSER="wangweijuan";
	public String DBPASS="wwj12345";
	private Connection conn=null;
	private boolean isConnected=false;
	
	public DbConnection(){
		
		try {
			Class.forName(DBDRIVER);
			System.out.println("加载驱动");
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
			if(conn!=null){
				
				System.out.println("连接数库成功");
			}
			
			 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("连接数据库失败");
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("连接数据库失败");
		}
	}

	public void disConnect(){
		if(isConnected){
			isConnected=false;
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("关闭数据库失败");
				e.printStackTrace();
			}
		}
	}
	
	public boolean isConnected(){
		return isConnected;
	}
	public Connection getConn() {
		
		if(conn!=null){
			isConnected=true;
		}
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	
	
	
}
