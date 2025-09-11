<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.Db.DBConnection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.entity.Doctor"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgb(0, 0, 0, 0.3);
}

body {
	max-width: 100vw;
  overflow-x: hidden;
  
}
</style>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="userr_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>
	
	<img src="image/user_appointment_image.jpg" style="height:200px ;width:100%;filter: brightness(50%);">
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center">Appointment List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
								DoctorDao dao2 = new DoctorDao(DBConnection.getConnection());
								List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td>
										<%
										if ("pending".equalsIgnoreCase(ap.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <a href="#" class="btn btn-sm btn-success">Complete</a> <%
 }
 %>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3  p-0 ">
				<img src="image/Adobe Express - file.png" alt="doctor_image"
					style="height: 200px; width: 300px">
			</div>
		</div>
	</div>
</body>
</html>