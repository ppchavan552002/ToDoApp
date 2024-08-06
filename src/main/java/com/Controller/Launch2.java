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

@WebServlet("/login")
public class Launch2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid=req.getParameter("userid");
		String password=req.getParameter("password");
		
		Connection con=ConnectionFactory.getCon();
		UserDao uDao=new UserDao();
		NotesDao nDao=new NotesDao();
		
		String res=uDao.CheckUser(userid, password, con);
		HttpSession session = req.getSession();
		ArrayList<Note> al = nDao.readAllNote(userid, con);
		
		
		if(res.equals("exists")) {
			session.setAttribute("al", al);
			session.setAttribute("check", userid);
			resp.sendRedirect("home.jsp");
		}else {
			session.setAttribute("msg", "invailed user credential");
			resp.sendRedirect("login.jsp");
		}
	}
}
