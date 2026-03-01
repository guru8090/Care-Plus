package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;
	public DoctorDao(Connection conn) {
		this.conn=conn;
	}
	public boolean registerDoctor(Doctor d)  {
		boolean f=false;
		try {
			String query="insert into doctor(full_name,dob,qualification,email,specialist,mobno,password) values(?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1, d.getFullName());
			pst.setString(2, d.getDob());
			pst.setString(3, d.getQualification());
			pst.setString(4, d.getEmail());
			pst.setString(5, d.getSpec());
			pst.setString(6, d.getMobno());
			pst.setString(7, d.getPassword());
			int rowCount=pst.executeUpdate();
			if(rowCount==1) {
				f=true;
				return f;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public List<Doctor> getAllDoctor() {
		List<Doctor> list=new ArrayList<Doctor>();

		Doctor d=null;
		try {
			String query="select * from doctor";
			PreparedStatement pst=conn.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				d=new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setEmail(rs.getString(5));
				d.setSpec(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));
				list.add(d);	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	public Doctor getDoctorById(int id) {
		Doctor d=null;
		try {
			String query="select * from doctor where id=?";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				d=new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setEmail(rs.getString(5));
				d.setSpec(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return d;
	}
	public boolean updateDoctor(Doctor d)  {
		boolean f=false;
		try {
			String query="update doctor set full_name=?,dob=?,qualification=?,email=?,specialist=?,mobno=?,password=? where id=?";

			PreparedStatement pst=conn.prepareStatement(query);
			
			pst.setString(1, d.getFullName());
			pst.setString(2, d.getDob());
			pst.setString(3, d.getQualification());
			pst.setString(4, d.getEmail());
			pst.setString(5, d.getSpec());
			pst.setString(6, d.getMobno());
			pst.setString(7, d.getPassword());
			pst.setInt(8,d.getId());
			int rowCount=pst.executeUpdate();
 	
			if(rowCount==1) {
				f=true;
				return f;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public boolean deleteDoctor(int id) {
		boolean f=false;
		try {
			String query="delete from doctor where id=?";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setInt(1, id);
			int rowCount=pst.executeUpdate();
			if(rowCount==1) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public Doctor login(String email,String password) {
		Doctor d=null;
		
		try {
			String query="select * from Doctor where email=? and password=?";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				d=new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setEmail(rs.getString(5));
				d.setSpec(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public int countDoctor() {
		int i=0;
		
		try {
			String sql="select * from Doctor";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countUser() {
		int i=0;
		
		try {
			String sql="select * from user_details";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countAppointment() {
		int i=0;
		
		try {
			String sql="select * from Appointment";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countSpecialist() {
		int i=0;
		
		try {
			String sql="select * from Specialist";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int countAppointmentByDoctorId(int did) {
		int i=0;
		
		try {
			String sql="select * from Appointment where doctor_id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, did);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public boolean checkOldPassword(int userId,String oldPassword) {
		boolean f=false;
		try {
			String query = "select * from doctor where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, userId);
			pst.setString(2, oldPassword);
			ResultSet resultSet = pst.executeQuery();
			while (resultSet.next()) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean changePassword(int userId,String newPassword) {
		boolean f=false;
		try {
			String query = "update doctor set password=? where id=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, newPassword);
			pst.setInt(2, userId);
			int rowCount=pst.executeUpdate();
			if(rowCount==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean editDoctorProfile(Doctor d)  {
		boolean f=false;
		try {
			String query="update doctor set full_name=?,dob=?,qualification=?,email=?,specialist=?,mobno=? where id=?";

			PreparedStatement pst=conn.prepareStatement(query);
			
			pst.setString(1, d.getFullName());
			pst.setString(2, d.getDob());
			pst.setString(3, d.getQualification());
			pst.setString(4, d.getEmail());
			pst.setString(5, d.getSpec());
			pst.setString(6, d.getMobno());
			pst.setInt(7,d.getId());
			int rowCount=pst.executeUpdate();
 	
			if(rowCount==1) {
				f=true;
				return f;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
