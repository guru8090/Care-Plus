package com.admin.servlet;

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

@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullName=request.getParameter("fullname");
		String dob=request.getParameter("dob");
		String qualification=request.getParameter("qualification");
		String spec=request.getParameter("specialist");
		String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		String password=request.getParameter("password");
		
		Doctor d=new Doctor(fullName,dob,qualification,spec,email,mobno,password);
		
		DoctorDao dao=new DoctorDao(DBConnection.getConnection());
		boolean f=dao.registerDoctor(d);
		HttpSession session=request.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Doctor Added Successfully");
			response.sendRedirect("admin/doctor.jsp");
		}
		else{
			session.setAttribute("errorMsg", "Something Went Wrong On Server");
			response.sendRedirect("admin/doctor.jsp");
		}
	}
}
