package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Db.DBConnection;
import com.dao.AppointmentDao;
import com.entity.Appointment;

/**
 * Servlet implementation class AppointmentServlet
 */
@WebServlet("/appointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId=Integer.parseInt(request.getParameter("userid"));
		String fullname=request.getParameter("fullname");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String appointment_date=request.getParameter("appointment_date");
		String email=request.getParameter("email");
		String phno=request.getParameter("phno");
		String diseases=request.getParameter("diseases");
		int doctor_id=Integer.parseInt(request.getParameter("doct"));
		String address=request.getParameter("address");
		
		Appointment ap=new Appointment(userId,fullname,gender,age,appointment_date,email,phno,diseases,doctor_id,address,"pending");
		AppointmentDao dao=new AppointmentDao(DBConnection.getConnection());
		boolean f=dao.addAppointment(ap);
		
		HttpSession session=request.getSession();
		if(f) {
			session.setAttribute("succMsg", "Appointment Successfull");
			response.sendRedirect("user_appointment.jsp");
		}else {
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("user_appointment.jsp");
		}
		
	}

}
