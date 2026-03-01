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
	<div class="container-fluid p-3">
		<div class="row">
			
			<div class="col-12">
				<div class="card paint-body">
					<div class="card-body">
						<p class="fs-5 text-center" s>Doctor Details</p>
						<table class="table" style="font-size:14px">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No.</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
						<tbody>
						<%
						DoctorDao dao2=new DoctorDao(DBConnection.getConnection());
						List<Doctor> list1=dao2.getAllDoctor();
						for(Doctor d:list1)
						{%>
						<tr>
				        <td><%=d.getFullName() %></td>
				        <td><%=d.getDob() %></td>
				        <td><%=d.getQualification() %></td>
				        <td><%=d.getEmail() %></td>
				        <td><%=d.getSpec() %></td>
				        <td><%=d.getMobno() %></td>
				        <td>
                        <a href="editDoctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary" style="font-size:10px">Edit</a>
				        <a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger" style="font-size:10px">Delete</a>
				        </td>
				        </tr>
						<%} 
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