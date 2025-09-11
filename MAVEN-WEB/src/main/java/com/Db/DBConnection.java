package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection conn;

	public static Connection getConnection() {
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			conn = DriverManager.getConnection("jdbc:mysql://mysql.railway.internal:3306/railway??useSSL=false&allowPublicKeyRetrieval=true", "root",
//					"OtVzDiZbEicCItDQzkUrScVrXgPKchFF");
//		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://switchyard.proxy.rlwy.net:12407/railway?useSSL=false&allowPublicKeyRetrieval=true", "root",
					"OtVzDiZbEicCItDQzkUrScVrXgPKchFF");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
//my sql host :mysql.railway.internal
//mysql port :3306
//mysql database:railway
//MYSQLUSER :root
//MYSQLPASSWORD :OtVzDiZbEicCItDQzkUrScVrXgPKchFF
/*String url = "jdbc:mysql://switchyard.proxy.rlwy.net:12407/railway?useSSL=false&allowPublicKeyRetrieval=true";
String user = "root";
String pass = "YOUR_RAILWAY_PASSWORD";
*/



