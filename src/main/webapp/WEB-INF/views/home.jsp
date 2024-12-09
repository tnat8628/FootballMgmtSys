<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Football Field Selection</title>
<!-- Link Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<style>
<style>.field-image {
	width: 100%;
	height: auto;
	border-radius: 10px;
	margin-bottom: 20px;
}

.choice-card img {
	height: 150px;
	object-fit: cover;
	border-radius: 10px;
}

.news-item {
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}
/* Chống cuộn quá mức */
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	overscroll-behavior: none; /* Ngăn hiện tượng kéo vượt mức */
	overflow-x: hidden; /* Ngăn cuộn ngang */
}

.text-dark-green {
	color: #2E8B57 !important;
}
/* Màu nền xanh sân cỏ */
.bg-grass {
	background-color: #228B22; /* Màu xanh sân cỏ */
	color: #ffffff; /* Màu chữ trắng */
}

.bg-grass h5 {
	color: #f8f9fa; /* Màu tiêu đề sáng hơn */
	margin-bottom: 15px;
}

.bg-grass a {
	color: #ffe400; /* Màu vàng nổi bật */
	text-decoration: underline;
}

.bg-grass a:hover {
	color: #ffd700; /* Màu vàng nhạt khi hover */
	text-decoration: none;
}

.bg-grass .copyright {
	margin-top: 30px;
	font-size: 0.9rem;
	color: #dcdcdc; /* Màu chữ xám nhạt */
}
</style>
</head>
<body>
	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="height: 2cm;">
		<div class="container-fluid">
			<a class="navbar-brand fs-3 fw-bold text-dark-green">UTEFF</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="/home">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/field">Sân</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/contact">Contact</a>
					</li>
				</ul>
				<!-- Thanh Tìm Kiếm -->
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search"
						placeholder="Tìm kiếm..." aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Tìm</button>
				</form>
				<ul class="navbar-nav">
					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							<li class="nav-item"><a class="nav-link" href="#">Welcome
									${sessionScope.user.username}</a></li>
							<li class="nav-item"><a
								class="nav-link btn btn-outline-danger btn-sm" href="/logout">Logout</a>
							</li>
							<li class="nav-item"><a
								class="nav-link btn btn-outline-danger btn-sm" href="/schedule">Sân
									đã đặt</a></li>
							<li class="nav-item"><a
								class="nav-link btn btn-outline-primary btn-sm" href="/profile">
									<i class="bi bi-person-fill"></i> Hồ sơ
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a
								class="nav-link btn btn-outline-primary btn-sm" href="/login">Login</a>
							</li>
							<li class="nav-item"><a
								class="nav-link btn btn-outline-success btn-sm" href="/register">Register</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container mt-4">
		<!-- Form Tìm kiếm -->
		<div class="my-4">
			<input type="text" id="searchResults" class="form-control"
				placeholder="Nhập tên loại sân để tìm kiếm..."
				value="${keyword != null ? keyword : ''}">
		</div>
		<!-- Hình sân cỏ -->
		<div class="text-center">
			<img src="<%=request.getContextPath()%>/images/field.jpeg"
				alt="Football Field" class="field-image">
		</div>

		<!-- Lựa chọn loại sân -->
		<div class="container mt-4">
			<h2 class="text-center">Chọn Loại Sân</h2>
			<div class="row text-center mt-4">
				<c:forEach var="category" items="${categories}">
					<div class="col-md-4 mt-3">
						<div class="card choice-card">
							<div class="card-body">
								<h5 class="card-title">${category.categoryName}</h5>
								<a href="<c:url value='/fields/${category.categoryId}'/>"
									class="btn btn-primary">Chọn</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- Tin tức bóng đá -->
		<div class="mt-5">
			<h2>Football News</h2>
			<div class="news-list">
				<%
				String[][] news = {
						{ "Breaking: Team A wins championship",
						"Team A has secured a victory in the finals with a dramatic penalty shootout.", "1" },
						{ "Player X signs with Team Y", "Star player X officially joins Team Y on a record-breaking transfer deal.",
						"2" },
						{ "Upcoming: National League fixtures", "The schedule for the upcoming National League has been released.",
						"3" } };
				for (String[] newsItem : news) {
				%>
				<div class="news-item">
					<h5>
						<a href="<%=request.getContextPath()%>/news/<%=newsItem[2]%>"><%=newsItem[0]%></a>
					</h5>
					<p><%=newsItem[1]%></p>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-grass pt-4 pb-4">
		<div class="container">
			<div class="row">
				<!-- Địa chỉ -->
				<div class="col-md-3">
					<h5>Address</h5>
					<p>123 Football Street, Sport City, Country</p>
				</div>
				<!-- Số điện thoại -->
				<div class="col-md-3">
					<h5>Contact</h5>
					<p>
						<strong>Phone:</strong> +123 456 7890
					</p>
					<p>
						<strong>Email:</strong> info@footballclub.com
					</p>
				</div>
				<!-- Thời gian hoạt động -->
				<div class="col-md-3">
					<h5>Opening Hours</h5>
					<p>Mon - Fri: 8:00 AM - 8:00 PM</p>
					<p>Sat - Sun: 9:00 AM - 10:00 PM</p>
				</div>
				<!-- Thông tin bổ sung -->
				<div class="col-md-3">
					<h5>About Us</h5>
					<p>We provide the best football fields and services for
						enthusiasts of all levels.</p>
					<p>
						<a href="<%=request.getContextPath()%>/about">Learn more</a>
					</p>
				</div>
			</div>
			<!-- Bản quyền -->
			<div class="text-center copyright">&copy; 2024 Football Club.
				All Rights Reserved.</div>
		</div>
	</footer>

	<!-- Link Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="<c:url value='/js/search.js'/>"></script>
</body>
</html>