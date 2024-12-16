<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bootstrap Header</title>
<!-- Link Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Link Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<style>
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
</style>
</head>
<body>
	<c:set var="avatarUrl"
		value="${
    empty sessionScope.user.avatar or sessionScope.user.avatar eq 'default-avatar.jpg'
    ? '/images/default-avatar.jpg'
    : '/uploads/'.concat(sessionScope.user.avatar)}" />

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
							<li class="nav-item d-flex align-items-center">
								<!-- Avatar (không có liên kết) --> <img
								src="<c:out value='${avatarUrl}' />"
								style="width: 30px; height: 30px; border-radius: 50%; margin-right: 8px;"
								alt="Avatar"> <!-- Nút "Hồ sơ" có liên kết --> <a
								class="av-link btn btn-outline-primary btn-sm" href="/profile">Hồ sơ</a>
							</li>

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

	<!-- Link Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>