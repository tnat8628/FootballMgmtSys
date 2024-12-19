<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FORGET PASSWORD</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
html, body {
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f0f2f5;
	margin: 0;
}

.container {
	width: 100%;
	max-width: 500px;
	padding: 2rem;
	background-color: #fff;
	border: 1px solid #ccc;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.btn-primary {
	width: 100%;
	background-color: #2E8B57;
	border: none;
	border-radius: 0;
}

.text-dark-green {
	color: #2E8B57 !important;
	font-weight: bold;
}

.error-message {
	color: red;
	font-weight: bold;
}

.success-message {
	color: green;
	font-weight: bold;
}

/* Loại bỏ bo góc cho các textbox */
.form-control {
	border-radius: 0;
}
</style>
</head>
<body>
	<div class="container">
		<h3 class="text-center text-dark-green">FORGET PASSWORD</h3>
		

		<c:if test="${not empty error and fn:trim(error) ne ''}">
			<div class="alert alert-danger mt-4 text-center">
				<c:out value="${error}" />
			</div>
		</c:if>

		<c:if test="${not empty success and fn:trim(success) ne ''}">
			<div class="alert alert-success mt-4 text-center">
				<c:out value="${success}" />
			</div>
		</c:if>

		<form action="/process-forgot-password" method="POST">
			<!-- Hiển thị thông báo -->

			<div class="mb-3">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="email"
					placeholder="Nhập email của bạn" required>
			</div>
			<button type="submit" class="btn btn-primary">Send OTP</button>
		</form>
		<div class="mt-3 text-center">
			<a href="/login">Back to LOGIN page</a>
		</div>
	</div>
</body>
</html>
