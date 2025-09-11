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
<%@include file="../component/allcss.jsp"%>
</head>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.card-body, p {
	color: rgb(1, 154, 222);
}
}
</style>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center">Appointment List</p>
						<c:if test="${not empty succMsg}">
							<p class="text-center fs-4" style="color: green">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="text-center fs-4" style="color: red">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<table class="table " style="font-size:14px">
						
							<thead>
								<tr >
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Phone no.</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Address</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
								List<Appointment> list = dao.getAllAPpointment();
								DoctorDao dao2 = new DoctorDao(DBConnection.getConnection());
								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td><%=ap.getAddress()%></td>
									<td><%
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
		</div>
	</div>

</body>
</html>