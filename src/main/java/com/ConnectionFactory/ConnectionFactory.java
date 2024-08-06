package com.ConnectionFactory;

import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.cj.jdbc.MysqlDataSource;

public class ConnectionFactory {
	
	public static Connection con;
	
	public static Connection getCon() {
		
		try {
		MysqlDataSource ms=new MysqlDataSource();
		
		ms.setUrl("jdbc:mysql://localhost:3306/todo");
		ms.setUser("root");
		ms.setPassword("");
		
		con=ms.getConnection();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}finally {
			return con;
		}
	}
}
