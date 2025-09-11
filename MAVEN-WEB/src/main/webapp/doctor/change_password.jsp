<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.Db.DBConnection"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	height: 100vh;
	width: 100vw;
}
.admin_login{
margin-top:20px;
margin-bottom:20px;
}
margin:20px 0px;
}
.card {
	box-shadow: 0 0 15px 0 rgb(1, 154, 222);
	background-color:black;
}

button {
	background-color: rgb(1, 154, 222);
	border: 2px solid rgb(1, 154, 222)
}
</style>
<body>
	<c:if test="${empty doctorObj }">
		<c:redirect url="doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container admin_login">
		<div class="row">
			<div class="col-md-4">
				<div class="card hello paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty succMsg}">
						<p class="text-center fs-4" style="color: green">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg}">
						<p class="text-center fs-4" style="color: red">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<div>
								<input type="hidden" name="uid" value="${doctorObj.id}">
							</div>
							<button class="btn col-md-12"
								style="background-color: rgb(1, 154, 222); color: white">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6 offset-md-2">
				<div class="card paint-card">
				<p class="text-center fs-4">Edit Profile</p>
				<c:if test="${not empty succMsgd}">
						<p class="text-center fs-4" style="color: green">${succMsgd}</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd}">
						<p class="text-center fs-4" style="color: red">${errorMsgd}</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctEditProfile" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" value='${doctorObj.fullName }' class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" value='${doctorObj.dob }' class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" required name="qualification" value='${doctorObj.qualification }' class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select required
									name="specialist" class="form-control">
									<option>${doctorObj.spec }</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnection.getConnection());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									required name="email" value='${doctorObj.email }' class="form-control readonly">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile No.</label> <input type="text"
									required name="mobno" value='${doctorObj.mobno }' class="form-control">
							</div>
							
							<input type="hidden" name="uid" value="${doctorObj.id }">
							<div class="mb-3">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
