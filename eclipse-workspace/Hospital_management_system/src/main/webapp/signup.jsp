<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
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
padding:0;
}
body{
height:100vh;
width:100vw;
}
.card{
box-shadow:0 0 15px 0 rgb(1,154,222)
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
<p class="fs-4 text-center">User Register</p>

<c:if test="${not empty succMsg}">
<p class="text-center fs-4" style="color:green">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg}">
<p class="text-center text-danger fs-4">${errorMsg}</p>
<c:remove var="errorMsg" scope="session"/>
</c:if>

<form action="./UserRegister" method="post">

<div class="mb-3">

<label class="form-label" for="full_name">Full name</label>
<input type="text" id="full_name" name="fullname" required class="form-control">

<label class="form-label" for="admin_email">Email address</label>
<input type="email" id="admin_email" name="email" required class="form-control">

</div>

<div class="mb-3">

<label class="form-label" for="admin_pass">Password</label>
<input type="password" id="admin_pass" name="password" required class="form-control">

</div>
<button type="submit" class="text-white col-md-12">Register</button>
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