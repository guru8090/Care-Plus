<%@page import="com.Db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="AI chatbot/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	height: 100%;
	max-width: 100vw;
	overflow-x: hidden;
}

.card {
	box-shadow: 0 0 15px 0 rgb(1, 154, 222)
}

.key_feature_ofOhospital p {
	color: rgb(1, 154, 222)
}

.key_featcher_doctor_image img {
	filter: drop-shadow(0px 0px 7px rgba(1, 154, 222, 0.7));
}

.team p {
	color: rgb(1, 154, 222)
}

.doctor_image img {
	height: 200px;
	width: auto;
	object-fit: cover;
}

.doctor_image {
	box-shadow: 0 0 15px 0 rgba(1, 154, 222, 0.7)
}

@media ( max-width : 992px) {
	.key_featcher_doctor_image {
		display: flex;
		justify-content: center;
	}
	.key_featcher_doctor_image img {
		filter: drop-shadow(0px 0px 7px rgba(1, 154, 222, 0.7));
		height: 200px;
	}
}
}
</style>
</head>
<body>
<header>
		<%@include file="component/navbar.jsp"%>

	</header>	
	<main>
		<section class="sliding_image mt-2">
			<div id="carouselExampleInterval" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="2000">
						<img src="image/133377592_10214499.jpg"
							class="d-block w-100" alt="image1" style="height: 350px">
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="sliding_image/17806127_5893284.jpg"
							class="d-block w-100" alt="image2" style="height: 350px">
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="sliding_image/37641679_8515556.jpg"
							class="d-block w-100" alt="image3" style="height: 350px">
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="sliding_image/41604752_8950740.jpg"
							class="d-block w-100" alt="image3" style="height: 350px">
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="sliding_image/66248991_9569876.jpg"
							class="d-block w-100" alt="image3" style="height: 350px">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</section>
		<section class="key_feature_ofOhospital">
			<p class="text-center fs-4 my-3">Key feature of Medi Home</p>
			<div class="container-fluid">
				<div class="row p-4 g-4">
					<div class="col-lg-8 col-12">
						<div class="row g-3">
							<div class="col-lg-6 col-12">

								<div class="card p-3 h-50">
									<p>100% safety</p>
									<p>Our system ensures 100% safety through secure data
										handling, encrypted communications, and strict user access
										controls—protecting both patient information and hospital
										operations</p>
								</div>

								<div class="card p-3 h-50 mt-3 ">
									<p>Friendly doctor</p>
									<p>Our system connects patients with friendly,
										compassionate doctors who prioritize communication, empathy,
										and personalized care—creating a comfortable and supportive
										healthcare experience.</p>
								</div>

							</div>
							<div class="col-lg-6 col-12 ">

								<div class="card p-3 h-50">
									<p>Clean environment</p>
									<p>We ensure a clean and hygienic environment across all
										hospital facilities,following strict sanitation protocols to
										prevent infections and promote patient well being.</p>
								</div>

								<div class="card p-3 h-50 mt-3">
									<p>Medical research</p>
									<p>Enabling innovation through data-driven medical research
										and collaborative healthcare studies & enabling healthcare
										professionals to advance medical knowledge.</p>
								</div>

							</div>
						</div>

					</div>
					<div class="col-lg-4 key_featcher_doctor_image">
						<img src="sliding_image/Adobe Express - file.png"
							alt="doctor_image">
					</div>
				</div>
			</div>
		</section>
		<section class="team">
			<p class="text-center fs-4 my-5">Our Team</p>

			<div
				class="container-fluid doctor_team d-flex justify-content-around gap-5">

				<div class="doctor_image">
					<div
						class="img-thumbnail d-flex flex-column align-items-center text-center">
						<img src="webapp/sliding_image/SATYABRATA GURU_IMAGE.jpeg" alt=""
							class="img-fluid" style="width: 150px;">

						<div class="doctor_name mt-2">
							<p class="mb-1">
								<b>Dr. Ayush Kumar Das</b>
							</p>
							<p class="mb-1">
								<b>Neurosurgeon</b>
							</p>
							<p class="mb-1">
								<b>(CEO & chairmain)</b>
							</p>
						</div>
					</div>
				</div>

				<div class="doctor_image">
					<div
						class="img-thumbnail d-flex flex-column align-items-center text-center">
						<img src="sliding_image/doctor_team_image5.webp" alt=""
							class="img-fluid" style="width: 150px;">
						<div class="doctor_name mt-2">
							<p class="mb-1">
								<b>Dr. Ananya Ray</b>
							</p>
							<p class="mb-1">
								<b>Cardiologist</b>
							</p>
							<p class="mb-1">
								<b>(Cheif Doctor)</b>
							</p>
						</div>
					</div>
				</div>

				<div class="doctor_image">
					<div
						class="img-thumbnail d-flex flex-column align-items-center text-center">
						<img src="sliding_image/doctor_team_image2.jpg" alt=""
							class="img-fluid" style="width: 150px;">
						<div class="doctor_name mt-2">
							<p class="mb-1">
								<b>Dr. Prakash Satpathi</b>
							</p>
							<p class="mb-1">
								<b>Cardiologist</b>
							</p>
							<p class="mb-1">
								<b>(Chairman)</b>
							</p>
						</div>
					</div>
				</div>


				<div class="doctor_image">
					<div
						class="img-thumbnail d-flex flex-column align-items-center text-center">
						<img src="sliding_image/doctor_team_image3.jpg" alt=""
							class="img-fluid" style="width: 150px;">
						<div class="doctor_name mt-2">
							<p class="mb-1">
								<b>Dr. Rakesh Rout Ray</b>
							</p>
							<p class="mb-1">
								<b>Pediatrician</b>
							</p>
							<p class="mb-1">
								<b>(Chief Doctor)</b>
							</p>
						</div>
					</div>
				</div>

				<div class="doctor_image">
					<div
						class="img-thumbnail d-flex flex-column align-items-center text-center">
						<img src="sliding_image/doctor_team_image4.jpg" alt=""
							class="img-fluid" style="width: 150px;">
						<div class="doctor_name mt-2">
							<p class="mb-1">
								<b>Dr. Karishma Nayak</b>
							</p>
							<p class="mb-1">
								<b>General Physician</b>
							</p>
							<p class="mb-1">
								<b>(Chief Doctor)</b>
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="AI_chatbot">
			<div id="inputbox" class="bg-white">
				<div
					class="chatbot_header border border-red d-flex justify-content-between align-items-center py-1 px-2 text-white">

					<div class="d-flex align-items-center gap-2">
						<img class="chatbot_image" src="sliding_image/medical_logo.webp"
							alt="chatbot_image">
						<h5 class="text-center m-0">Care+</h5>
					</div>

					<button id="disapperInputBox">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>

				<div id="output" style="height: 80%">
					<div id="welcome" class="mt-5" style="color: rgb(1, 154, 222)">

						<h4 class=" text-center">Welcome to Care+ hospital</h4>
					</div>
					<div id="answer"
						class="d-flex flex-column gap-2 overflow-x-hidden text-wrap">

					</div>
				</div>

				<div class="d-flex align-items-center px-2 takeInput gap-2">
					<input type="text" placeholder="Type your question here...."
						id="inp">
					<button id="btn">
						<i class="bi bi-send"></i>
					</button>
				</div>

			</div>
			<button id="icon">
				<i class="bi bi-chat-text-fill "></i>
			</button>
			<script src="AI chatbot/script.js"></script>
		</section>
	</main>
	<footer>
		<%@include file="component/footer.jsp"%>
	</footer>
</body>
</html>
