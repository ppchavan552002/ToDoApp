package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import com.Model.Note;

public class NotesDao {
	public void CreateTable(String userid, Connection con) {
		try {
		String sql="create table "+userid+"notes(notesdec varchar(255), adddate varchar(50), editdate varchar(50))";
		Statement st=con.createStatement();
		
		st.execute(sql);
		
		}catch (Exception e) {
			System.out.println(e);
		}
	}

	public void addNote(String userid, String note, Connection con) {
		
		try {
			String sql="insert into "+userid+"notes values(?,?,'No Edit')";
			String adddate=LocalDate.now().toString();
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, note);
			ps.setString(2, adddate);
			
			ps.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
	}

	public ArrayList<Note> readAllNote(String userid, Connection con) {
		ArrayList<Note> al=new ArrayList<Note>();
		try {
			
			String sql="select * from "+userid+"notes";
			
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Note n=new Note();
				n.setNote(rs.getString(1));
				n.setAdddate(rs.getString(2));
				n.setEditdate(rs.getString(3));
				al.add(n);
			}
			
		}catch (Exception e) {
			System.out.println(e);
		}finally {
			return al;
		}
	}

	public void deleteNote(String userid, String note, Connection con) {
		ArrayList<Note> al=new ArrayList<Note>();
		try {
			
			String sql="delete from "+userid+"notes where notesdec=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, note);
			
			ps.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
			
	}

	public void editNote(String userid, String oldnote, String note, Connection con) {
		try {
			
			String sql="update "+userid+"notes set notesdec=?, editdate=? where notesdec=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			String editdate=LocalDate.now().toString();
			
			ps.setString(1, note);
			ps.setString(2, editdate);
			ps.setString(3, oldnote);
			
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
}
