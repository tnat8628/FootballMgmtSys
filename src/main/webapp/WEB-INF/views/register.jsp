<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UTEFF REGISTER</title>
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

.register-container {
	width: 100%;
	max-width: 500px; /* Tăng kích thước khung đăng ký */
	padding: 2rem;
	background-color: #fff;
	border: 1px solid #ccc; /* Thêm viền để khung đăng ký không bo góc */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.register-btn {
	width: 100%;
	background-color: #2E8B57; /* Màu nút giống chữ UTEFF REGISTER */
	border: none;
	border-radius: 0; /* Loại bỏ bo góc cho nút Register */
}

.text-dark-green {
	color: #2E8B57 !important;
	font-weight: bold; /* In đậm chữ UTEFF REGISTER */
}

.error-message {
	color: red;
	font-weight: bold;
}

/* Loại bỏ bo góc cho các textbox */
.form-control {
	border-radius: 0;
}
</style>
</head>
<body>
	<div class="register-container">
		<h3 class="text-center text-dark-green">UTEFF REGISTER</h3>
		<form action="/register" method="POST">
			<!-- Hiển thị thông báo lỗi nếu có -->
			<c:if test="${not empty error}">
				<div class="error-message mb-3">${error}</div>
			</c:if>
			<div class="mb-3">
				<label for="username" class="form-label">Username</label> <input
					type="text" class="form-control" id="username" name="username"
					required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					required>
			</div>
			<div class="mb-3">
				<label for="confirm-password" class="form-label">Confirm Password</label> <input
					type="password" class="form-control" id="confirm-password" name="confirm-password"
					required>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="email"
					required>
			</div>
			<div class="mb-3">
				<label for="fullname" class="form-label">Full Name</label> <input
					type="text" class="form-control" id="fullname" name="fullname"
					required>
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">Phone Number</label> <input
					type="text" class="form-control" id="phone" name="phone">
			</div>
			<button type="submit" class="btn btn-primary register-btn">Register</button>
		</form>
		<div class="mt-3 text-center">
			Already have an account? <a href="/login">Login</a>
		</div>
	</div>
</body>
</html>