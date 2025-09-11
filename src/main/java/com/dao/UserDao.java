package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		this.conn = conn;
	}

	public boolean userRegister(User u) {
		boolean b = false;
		try {
			String query = "insert into user_details(full_name,email,password) values(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, u.getFullname());
			pst.setString(2, u.getEmail());
			pst.setString(3, u.getPassword());

			int rowCount = pst.executeUpdate();
			if (rowCount == 1) {
				b = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public User login(String email, String password) {
		User u = null;
		try {
			String query = "select * from user_details where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet resultSet = pst.executeQuery();
			while (resultSet.next()) {
				u=new User();
				u.setId(resultSet.getInt(1));
				u.setFullname(resultSet.getString(2));
				u.setEmail(resultSet.getString(3));
				u.setPassword(resultSet.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public boolean checkOldPassword(int userId,String oldPassword) {
		boolean f=false;
		try {
			String query = "select * from user_details where id=? and password=?";
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
			String query = "update user_details set password=? where id=?";
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
}
