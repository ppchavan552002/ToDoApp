package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConnectionFactory.ConnectionFactory;
import com.Dao.NotesDao;
import com.Model.Note;

@WebServlet("/addnote")
public class Launch4 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String note = req.getParameter("note");
		String userid = req.getParameter("userid");
		
		Connection con=ConnectionFactory.getCon();
		NotesDao nDao=new NotesDao();
		
		nDao.addNote(userid, note, con);
		
		HttpSession session = req.getSession();
		ArrayList<Note> al=nDao.readAllNote(userid,con);
		
		session.setAttribute("al", al);
		resp.sendRedirect("home.jsp");
		
		
	}
}
