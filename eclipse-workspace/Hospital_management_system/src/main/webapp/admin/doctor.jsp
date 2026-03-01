<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.dao.SpecialistDao" %>
	<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.Db.DBConnection" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${not empty errorMsg}">
							<p class="text-center fs-4 text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="text-center fs-4" style="color: green">${succMsg}</p>
							<c:remove var="succMag" scope="session" />
						</c:if>
	<div class="container container-fluid-lg p-3">
		<div class="row">
			<div class="col-lg-4 offset-lg-4">
				<div class="card paint-body">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						
						<form action="../AddDoctor" method="post">
						
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input type="text"
									required name="qualification" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select required 
								name="specialist" class="form-control">
								<option>--Select--</option>
								<%
								SpecialistDao dao=new SpecialistDao(DBConnection.getConnection());
								List<Specialist> list=dao.getAllSpecialist();
						        for(Specialist s:list)
						        {%>
						        <option><%=s.getSpecialistName()%></option>
								<%} 
								%>
								</select>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									required name="email" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Mobile No.</label> <input type="text"
									required name="mobno" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Password</label> <input type="password"
									required name="password" class="form-control">
							</div>
							
							<div class="mb-3">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<footer>
<%@include file="../component/footer.jsp" %>
</footer>
</body>
</html>