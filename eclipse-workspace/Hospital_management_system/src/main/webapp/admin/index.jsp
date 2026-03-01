<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.Db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.card-body {
	color: rgb(1, 154, 222);
}

</style>
<body>

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<main>
		<div class="container p-2">
			<p class="text-center fs-3" style="color: rgb(1, 154, 222)">Admin
				Dashboard</p>
				
			<c:if test="${not empty succMag}">
				<p class="text-center fs-4" style="color: green">${succMag}</p>
				<c:remove var="succMag" scope="session" />
			</c:if>

			<c:if test="${not empty errorMsg}">
				<p class="text-center fs-4 text-danger">${errorMsg}</p>
				<c:remove var="errorMsg" scope="session" />
			</c:if>
			
			<%DoctorDao dao=new DoctorDao(DBConnection.getConnection()); %>
			<div class="row">
				<div class="col-md-4 ">
					<div class="card paint-card" >
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
							<i class="fas fa-user-circle fa-3x"></i><br>
							<p class="fs-4 text-center">
								User<br><%=dao.countUser() %>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4" >
					<div class="card paint-card" style="height:170px">
						<div class="card-body text-center">
							<i class="far fa-calendar-check fa-3x"></i><br>
							<p class="fs-4 text-center">
								Total Appointment<br><%=dao.countAppointment() %>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 mt-2">
					<div class="card paint-card" data-bs-toggle="modal"
						data-bs-target="#exampleModal">
						<div class="card-body text-center ">
							<i class="far fa-calendar-check fa-3x"></i><br>
							<p class="fs-4 text-center">
								Specialist<br><%=dao.countSpecialist() %>
							</p>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
							title</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="../addSpecialist" method="post">
							<div class="form-group">
								<label>Enter Specialist Name</label> <input type="text"
									name="specName" class="form-control">
							</div>
							<div class="text-center mt-3">
								<button type="submit"
									style="background-color: rgb(1, 154, 222); color: white; border: 2px solid rgb(1, 154, 222)">Add</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
<%@include file="../component/footer.jsp" %>
</footer>
	</body>
</html>