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

/**
 * Servlet implementation class UpdateDoctor
 */
@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String fullName=request.getParameter("fullname");
			String dob=request.getParameter("dob");
			String qualification=request.getParameter("qualification");
			String spec=request.getParameter("specialist");
			String email=request.getParameter("email");
			String mobno=request.getParameter("mobno");
			String password=request.getParameter("password");
			
	        Doctor d=new Doctor(id,fullName,dob,qualification,spec,email,mobno,password);
	        
			DoctorDao dao=new DoctorDao(DBConnection.getConnection());
			boolean f=dao.updateDoctor(d);
			
			HttpSession session=request.getSession();
			if(f) {
				session.setAttribute("succMsg","Doctor update successfully");
				response.sendRedirect("admin/view_doctor.jsp");
			}
			else {
				session.setAttribute("errorMsg","Doctor is not update successfully");
				response.sendRedirect("admin/view_doctor.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
