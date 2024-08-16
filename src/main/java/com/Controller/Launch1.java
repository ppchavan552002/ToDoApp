package com.Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConnectionFactory.ConnectionFactory;
import com.Dao.NotesDao;
import com.Dao.UserDao;

@WebServlet("/signup")
public class Launch1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid=req.getParameter("userid");
		String password=req.getParameter("password");
		String email=req.getParameter("email");
		
		Connection con=ConnectionFactory.getCon();
		UserDao uDao=new UserDao();
		NotesDao nDao=new NotesDao();
		
		String res=uDao.insertUser(userid, password, email, con);
		HttpSession session = req.getSession();
		
		if(res.equals("insert")) {
			nDao.CreateTable(userid, con);
			session.setAttribute("msg", "Account is Created");
			resp.sendRedirect("login.jsp");
		}else {
			session.setAttribute("msg", "Account is Already Exists");
			resp.sendRedirect("signup.jsp");
		}
	}
}
