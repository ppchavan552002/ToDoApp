package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	String res="";
	
	public String insertUser(String n, String p, String e, Connection con) {
		try {
			String sql="insert into usersinfo values(?,?,?);";
			
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, n);
			ps.setString(2, p);
			ps.setString(3, e);
			
			int r=ps.executeUpdate();
			if(r==1) {
				res="insert";
			}else {
				res="failed";
			}
			
		}catch (Exception o) {
			// TODO: handle exception
			System.out.println(o);
			res="failed";
		}finally {
			return res;
		}
	}
	public String CheckUser(String userid, String password, Connection con) {
		try {
			String sql="Select * from usersinfo where userid=? and password=?";
			
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, userid);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			boolean flag=false;
			while(rs.next()) {
				flag=true;
			}
			if(flag) {
				res="exists";
			}else {
				res="failed";
			}
			
		}catch (Exception o) {
			// TODO: handle exception
			res="failed";
		}finally {
			return res;
		}
	}
}
