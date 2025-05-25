package com;

import java.sql.*;

public class DB {
	private static Connection conn = null;
	
	public static Connection connect() {
		try {
			String db = "Database Name";
			String url = "jdbc:mysql://localhost:3306/"+db;
			String username = "mysql username";
			String password = "mysql password";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
