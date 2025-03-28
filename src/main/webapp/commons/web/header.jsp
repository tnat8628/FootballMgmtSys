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

.navbar-custom {
    background-color: #006600; /* Xanh lá đậm */
    position: fixed !important;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
}

body {
    padding-top: 70px; /* Điều chỉnh theo chiều cao thực tế của header */
}

</style>

</head>
<body>

	<c:set var="avatarUrl"
		value="${
    empty sessionScope.user.avatar or sessionScope.user.avatar eq 'default-avatar.jpg'
    ? '/images/default-avatar.jpg'
    : '/uploads/'.concat(sessionScope.user.avatar)}" />

	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom"
		style="height: 2cm;">
		<div class="container-fluid">
			<a class="navbar-brand fs-3 fw-bold text-white" href="/">UTEFF</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link text-white" href="/field">Sân</a>
					</li>
					<li class="nav-item"><a class="nav-link text-white" href="/contact">Liên hệ</a>
					</li>
					<li class="nav-item"><a class="nav-link text-white" href="/instruction">Hướng dẫn</a>
					</li>
				</ul>
				<ul class="navbar-nav">
					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							<li class="nav-item">
								<a class="nav-link text-white" href="#">Welcome ${sessionScope.user.username}</a>
							</li>
							<li class="nav-item">
							<a class="nav-link btn btn-sm text-white" href="/logout">Logout</a>
							</li>
							<li class="nav-item">
							<a class="nav-link btn btn-sm text-white" href="/booking/schedule/${sessionScope.user.userId}">Sân đã đặt</a>
							</li>
							<li class="nav-item d-flex align-items-center">
    							<!-- Avatar được bọc trong thẻ <a> để có thể bấm vào và chuyển hướng đến hồ sơ -->
    							<a href="/profile">
        							<img src="<c:out value='${avatarUrl}' />"
             						style="width: 40px; height: 40px; border-radius: 50%; margin-right: 8px;"
             						alt="Avatar">
    							</a>

						</c:when>
						<c:otherwise>
							<li class="nav-item"><a
								class="nav-link btn btn-outline-primary btn-sm text-white" href="/login">Login</a>
							</li>
							<li class="nav-item"><a
								class="nav-link btn btn-outline-success btn-sm text-white" href="/register">Register</a>
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