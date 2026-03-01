<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg" style="background-color:rgb(1,154,222);">
  <div class="container-fluid ">
  <img src="../sliding_image/medical_logo.webp" alt="medical_logo" style="height:40px; border-radius:50%;margin-right:13px; margin-left:10px;">
      <a class="navbar-brand" href="index.jsp" style="font-size:20px; color:white">Care<b>+</b></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto ms-auto mb-2 mb-lg-0">
        <li class="nav-item ">
          <a class="nav-link active" aria-current="page" href="../index.jsp" target="_blank" style="color:white">HOME</a>
        </li>
 
       <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="patient.jsp" target="_blank" style="color:white">PAISENT</a>
        </li>
      </ul>
      <ul class="navbar-nav  me-1 mb-2 mb-lg-0">
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle back bg-white " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           ${doctorObj.fullName}
          </a>
          <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="change_password.jsp">Edit</a></li>
            <li><a class="dropdown-item" href="../doctorLogout">LOG OUT</a></li>
          </ul>
        </li>
        </ul>
      </div>
      
    
  </div>
</nav>