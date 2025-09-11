
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg" style="background-color:rgb(1,154,222);">
  <div class="container ">
  <img src="image/medical_logo.webp" alt="medical_logo" style="height:40px; border-radius:50%; margin-right:13px;">
      <a class="navbar-brand" href="index.jsp" style="font-size:20px; color:white">Care <b>+</b></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
      <c:if test="${empty userObj}">
      <li class="nav-item ">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp" target="_blank" style="color:white"><i class="fa-solid fa-right-to-bracket"></i>ADMIN</a>
        </li>
 
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor_login.jsp" target="_blank" style="color:white">DOCTOR</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment.jsp" style="color:white">APPOTTNMENT</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_login.jsp" target="_blank" style="color:white">USER</a>
        </li>
      </c:if>
  <c:if test="${not empty userObj}">
  <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_appointment.jsp" target="_blank" style="color:white">APPOINTMENT</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="view_appointment.jsp" target="_blank" style="color:white">VIEW APPOINTMENT</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:white">
            <i class="fa-solid fa-user" style="margin-right:10px;"></i>${userObj.fullname}
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
            <li><a class="dropdown-item" href="UserLogout">Log out</a></li>
            
          </ul>
        </li>
        
  </c:if>
         <%--
          <%@ 
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
         %> 
         --%>
      </ul>
    </div>
  </div>
</nav>