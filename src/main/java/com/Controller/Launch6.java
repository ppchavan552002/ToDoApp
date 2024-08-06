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
import com.Dao.UserDao;
import com.Model.Note;

@WebServlet("/editenote")
public class Launch6 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		String note = req.getParameter("note");
		String oldnote = req.getParameter("oldnote");
		
		Connection con=ConnectionFactory.getCon();
		NotesDao nDao=new NotesDao();
		
		nDao.editNote(userid, oldnote, note, con);
		HttpSession session = req.getSession();
		
		ArrayList<Note> al=nDao.readAllNote(userid, con);
		session.setAttribute("al", al);
		resp.sendRedirect("home.jsp");
		
		
	}
}
