package com.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Db.DBConnection;
import com.dao.DoctorDao;
import com.entity.Doctor;

/**
 * Servlet implementation class DoctorLogin
 */
@WebServlet("/doctorlogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		DoctorDao dao=new DoctorDao(DBConnection.getConnection());
		Doctor d=dao.login(email, password);
		
		HttpSession session=request.getSession();
		if(d!=null) {
			session.setAttribute("doctorObj", d);
			response.sendRedirect("doctor/index.jsp");
		}else {
			session.setAttribute("errorMsg", "Invalid Email & Password");
			response.sendRedirect("doctor_login.jsp");
		}
	}


}