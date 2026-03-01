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
	<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center">Appointment List</p>
						<c:if test="${not empty succMsg}">
<p class="text-center fs-4" style="color:green">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg}">
<p class="text-center fs-4" style="color:red">${errorMsg}</p>
<c:remove var="errorMsg" scope="session"/>
</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Phone no.</th>
									<th scope="col">Disease</th>
									<th scope="col">Status</th>
									<th scope="col">Comment</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor doctor = (Doctor) session.getAttribute("doctorObj");
								AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
								List<Appointment> list = dao.getAllAppointmentByDoctor(doctor.getId());

								for (Appointment ap : list) {
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									
									<td>
									<%
									if("pending".equals(ap.getStatus())){%>
										<a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-sm btn-success"><i class="bi bi-chat-dots px-1"></i>Comment</a>
									<%}else{%>
										<a href="#" class="btn btn-sm btn-success disable"><i class="bi bi-chat-dots px-1"></i>Comment</a>
									<%}
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