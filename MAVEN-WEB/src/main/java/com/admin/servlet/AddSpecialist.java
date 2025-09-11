package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Db.DBConnection;
import com.dao.SpecialistDao;

/**
 * Servlet implementation class AddSpecialist
 */
@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String specName=request.getParameter("specName");
		SpecialistDao dao=new SpecialistDao(DBConnection.getConnection());
		
		boolean f=dao.addSpecialist(specName);
		
		HttpSession session=request.getSession();
		
		if(f) {
			session.setAttribute("succMag", "Specialist added successfully");
			response.sendRedirect("admin/index.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("admin_login.jsp");
		}
		
	}

}
