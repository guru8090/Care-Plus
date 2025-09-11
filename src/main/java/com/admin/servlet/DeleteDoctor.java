package com.admin.servlet;

import java.io.IOException;

import com.Db.DBConnection;
import com.dao.DoctorDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		DoctorDao dao=new DoctorDao(DBConnection.getConnection());
		boolean f=dao.deleteDoctor(id);
		if(f==true) {
			request.setAttribute("succMsg", "Doctor Deleted Successfully");
			response.sendRedirect("admin/view_doctor.jsp");
		}else {
			request.setAttribute("succMsg", "Doctor not Deleted Successfully");
			response.sendRedirect("admin/view_doctor.jsp");
		}
	}

}
