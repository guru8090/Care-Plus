package com.doctor.servlet;

import java.io.IOException;

import com.Db.DBConnection;
import com.dao.DoctorDao;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctEditProfile")
public class DoctEditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("uid"));
		String fullName=request.getParameter("fullname");
		String dob=request.getParameter("dob");
		String qualification=request.getParameter("qualification");
		String spec=request.getParameter("specialist");
		String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		
		Doctor d=new Doctor(id,fullName,dob,qualification,spec,email,mobno);
		DoctorDao dao=new DoctorDao(DBConnection.getConnection());
		
		HttpSession session=request.getSession();
		
		boolean f=dao.editDoctorProfile(d);
		System.out.println(f);
		if(f) {
			Doctor updateDoctorSession=dao.getDoctorById(id);//After updating in our page the updated details are not showing ,because our doctor without updated value store in the session so i againg create one more session for storing updated details of the doctor
			session.setAttribute("succMsgd", "Doctor Profile changed successfully");
			session.setAttribute("doctorObj",updateDoctorSession);
			response.sendRedirect("doctor/change_password.jsp");
		}else {
			session.setAttribute("errorMsgd","Something wrong on server");
			response.sendRedirect("doctor/change_password.jsp");
		}
	}

}
