<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
	<%@ page import="com.dao.SpecialistDao" %>
	<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.Db.DBConnection" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="java.util.List" %>

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
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-body">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<%
						int id=Integer.parseInt(request.getParameter("id"));
		DoctorDao dao2=new DoctorDao(DBConnection.getConnection());
		Doctor d1=dao2.getDoctorById(id);
		%>
						<form action="../updateDoctor" method="post">
						
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" value="<%=d1.getFullName() %>" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" value="<%=d1.getDob() %>" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input type="text"
									required name="qualification" value="<%=d1.getQualification()%>"class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select required 
								name="specialist" class="form-control">
								<option><%=d1.getSpec()%></option>
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
									required name="email" value="<%=d1.getEmail()%>" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Mobile No.</label> <input type="text"
									required name="mobno" value="<%=d1.getMobno()%>" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Password</label> <input type="text"
									required name="password" value="<%=d1.getPassword()%>" class="form-control">
							</div>
							<input type="hidden" name="id" value="<%=d1.getId() %>">
							<button type="submit" class="btn btn-primary col-12">Update</button>
							
						</form>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>