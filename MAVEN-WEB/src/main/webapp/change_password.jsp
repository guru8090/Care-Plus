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

.admin_login{

margin-top: 22px;
margin-bottom: 22px;

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
<c:if test="${empty userObj }">
		<c:redirect url="userr_login.jsp"></c:redirect>
	</c:if>
<%@include file="component/navbar.jsp" %>
    <div class="container admin_login">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <p class="text-center fs-3">Change Password</p>
                    <c:if test="${not empty succMsg}">
<p class="text-center fs-4" style="color:green">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg}">
<p class="text-center fs-4" style="color:red">${errorMsg}</p>
<c:remove var="errorMsg" scope="session"/>
</c:if>
                    <div class="card-body">
                        <form action="changePassword" method="post">
                            <div class="mb-3">
                                <label>Enter New Password</label>
                                <input type="text" name="newPassword" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label>Enter Old Password</label>
                                <input type="text" name="oldPassword" class="form-control" required>
                            </div>
                            <div>
                            <input type="hidden" name="uid" value="${userObj.id}">
                            </div>
                            <button class="btn col-md-12" style="background-color:rgb(1,154,222);color:white">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
