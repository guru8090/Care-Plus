package com.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Db.DBConnection;
import com.dao.AppointmentDao;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String comm=request.getParameter("comm");
		int id=Integer.parseInt(request.getParameter("id"));
		int did=Integer.parseInt(request.getParameter("did"));
		
		AppointmentDao dao=new AppointmentDao(DBConnection.getConnection());
		boolean b=dao.updateComment(id, did, comm);
		
		HttpSession session=request.getSession();
		if(b==true) {
			session.setAttribute("succMsg", "Patient status update successfully");
			response.sendRedirect("doctor/patient.jsp");
		}else {
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("doctor/comment.jsp");
		}
	}

}
