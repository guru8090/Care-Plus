<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.entity.Doctor" %>
   <%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.Db.DBConnection" %>
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

.card-body,p {
	color: rgb(1, 154, 222);
}
}
</style>
<body>
<%@include file="navbar.jsp"%>
<p class="text-center fs-3 mt-2">Doctor Dashbord</p>

<c:if test="${empty doctorObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<% 
	Doctor d=(Doctor)session.getAttribute("doctorObj");
	DoctorDao dao=new DoctorDao(DBConnection.getConnection()); 
	%>
<div class="row ">
				<div class="col-md-4 offset-md-2">
					<div class="card paint-card">
						<div class="card-body text-center">
							<i class="fas fa-user-md fa-3x"></i><br>
							<p class="fs-4 text-center">
								Doctor<br><%=dao.countDoctor() %>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card paint-card">
						<div class="card-body text-center">
							<i class="fas fa-calendar-check fa-3x"></i><br>
							<p class="fs-4 text-center">
								User<br><%=dao.countAppointmentByDoctorId(d.getId()) %>
							</p>
						</div>
					</div>
				</div>
				</div>
			

</body>
</html>