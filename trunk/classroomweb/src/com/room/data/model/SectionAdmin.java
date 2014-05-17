package com.room.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SectionAdmin {

	private int SAid;
	private String SAname;
	
	public SectionAdmin(ResultSet rs){
		
		try {
			setSAid(rs.getInt(1));
			setSAname(rs.getString(2));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public int getSAid() {
		return SAid;
	}
	public void setSAid(int sAid) {
		SAid = sAid;
	}
	public String getSAname() {
		return SAname;
	}
	public void setSAname(String sAname) {
		SAname = sAname;
	}
	
}
