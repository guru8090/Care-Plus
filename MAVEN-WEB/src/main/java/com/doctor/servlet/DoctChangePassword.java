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

/**
 * Servlet implementation class DoctChangePassword
 */
@WebServlet("/doctChangePassword")
public class DoctChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		
		HttpSession session=request.getSession();
		DoctorDao dao=new DoctorDao(DBConnection.getConnection());
		boolean f=dao.checkOldPassword(uid,oldPassword);
		if(f) {
			if(dao.changePassword(uid,newPassword)) {
				session.setAttribute("succMsg", "Password Change Succsessfully");
				response.sendRedirect("doctor/change_password.jsp");
			}else {
				session.setAttribute("errorMsg", "Something wrong on server");
				response.sendRedirect("change_password.jsp");
			}
		}else {
			session.setAttribute("errorMsg","Old Password Incorrect");
			response.sendRedirect("doctor/change_password.jsp");
		}

	}

}
