package com.user.servlet;

import java.io.IOException;

import com.Db.DBConnection;
import com.dao.UserDao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			HttpSession session = request.getSession();

			UserDao userDao = new UserDao(DBConnection.getConnection());
			User user = userDao.login(email, password);

			if (user != null) {
				session.setAttribute("userObj", user);
				response.sendRedirect("index.jsp");
			} else {
				session.setAttribute("errorMsg", "Invalid Email & Password");
				response.sendRedirect("user_login.jsp");
			}
        } 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
