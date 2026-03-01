<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.Db.DBConnection"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
</head>
<style>
body{
height:100%;
width:100vw;
overflow-x: hidden;
}
.card {
	box-shadow: 0 0 15px 0 rgb(1, 154, 222)
}
 .doctor_image img{
filter: drop-shadow(0px 0px 7px rgba(1,154,222,0.7));
}
</style>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container">
		<div class="row align-items-center">
			<div class="col-12 col-lg-6 doctor_image  d-flex justify-content-center">
				<img src="sliding_image/Adobe Express - file.png" alt="doctor_img" class="doctor_image">
			</div>
			<div class="col-12 col-lg-6 py-5 px-3">
				<div class="card paint-body">
					<div class="card-body">
						<p class="fs-4 text-center">User Appointment</p>
						<c:if test="${not empty succMsg}">
							<p class="text-center fs-4" style="color: green">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="text-center fs-4" style="color: red">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="appointmentServlet" method="post">

							<input type="hidden" name="userid" value="${userObj.id}">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									type="text" class="form-control" name="fullname" required>
							</div>

							<div class="col-md-6">
								<label class="form-label">Gender</label> <select
									class="form-control" name="gender" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									type="number" class="form-control" name="age" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control"
									name="appointment_date" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" class="form-control" name="email" required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No.</label> <input
									type="number" class="form-control" name="phno" maxlength="10"
									required>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									type="text" class="form-control" name="diseases" required>
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									class="form-control" name="doct" required>
									<option value="">--select--</option>
									<%
									DoctorDao dao = new DoctorDao(DBConnection.getConnection());
									List<Doctor> doctor = dao.getAllDoctor();
									for (Doctor d : doctor) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%>(<%=d.getSpec()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea class="form-control" name="address" rows="3" col=""
									required></textarea>
							</div>

							<c:if test="${empty userObj}">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn "
									style="background-color: rgb(1, 154, 222); color: white">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn "
									style="background-color: rgb(1, 154, 222); color: white">Sumbit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
<%@include file="component/footer.jsp" %>
</footer>
</body>
</html>