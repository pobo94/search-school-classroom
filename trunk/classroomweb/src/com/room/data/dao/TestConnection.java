package com.room.data.dao;

public class TestConnection {

	public static void main(String[] args) {
		
		DbConnection db = new DbConnection();
		db.getConn();
		System.out.println(db.getConn());
	}

}
