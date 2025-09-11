<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
</head>
<style>

*{
margin:0;
paddin:0;
}
body{
height:100vh;
width:100vw;
}

.card{
box-shadow:0 0 15px 0 rgb(1,154,222)
}

.admin_login{
margin-top:24px;
margin-bottom:24px;
}

button{
background-color:rgb(1,154,222);
border:2px solid rgb(1,154,222)
}
</style>
<body>
<header>
<%@include file="component/navbar.jsp" %>
</header>
<main>
<div class="container p-5 admin_login ">
<div class="row">
<div class="col-lg-4 offset-lg-4">
<div class="card paint-card">
<div class="card-body">
<p class="fs-4 text-center">Doctor Login</p>
<form action="doctorlogin" method="post">
<c:if test="${not empty errorMsg}">
							<p class="text-center fs-4 text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg}">
							<p class="text-center fs-4 text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

<div class="mb-3">

<label class="form-label" for="doctor_email">Email address</label>
<input type="email" id="doctor_email" name="email" required class="form-control">

</div>

<div class="mb-3">

<label class="form-label" for="doctor_pass">Password</label>
<input type="password" id="doctor_pass" name="password" required class="form-control">

</div>
<button type="submit" class="text-white col-md-12">Login</button>
</form>
</div>
</div>
</div>
</div>
</div>
</main>
<footer>
<%@include file="component/footer.jsp" %>
</footer>
</body>
</html>