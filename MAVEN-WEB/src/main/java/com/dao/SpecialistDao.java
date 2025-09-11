package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDao {
	private Connection conn;

	public SpecialistDao(Connection conn) {
		this.conn=conn;
	}
	public boolean addSpecialist(String spec) {
		boolean f=false;
		try {
			String query="insert into specialist(spec_name) values(?)";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1,spec);
			
			int rowCount=pst.executeUpdate();
			
			if(rowCount==1) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List getAllSpecialist() {
		List<Specialist> list=new ArrayList<>();
		
		Specialist s=null;
		try {
			String query="select * from specialist";
			PreparedStatement pst=conn.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				s=new Specialist();
				s.setId(rs.getInt("id"));
				s.setSpecialistName(rs.getString("spec_name"));
				list.add(s);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

