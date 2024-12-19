<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UTEFF LOGIN</title>
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

.login-container {
	width: 100%;
	max-width: 500px; /* Tăng kích thước khung đăng nhập */
	padding: 2rem;
	background-color: #fff;
	border: 1px solid #ccc; /* Thêm viền để khung đăng nhập không bo góc */
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.login-btn {
	width: 100%;
	background-color: #2E8B57; /* Màu nút giống chữ UTEFF LOGIN */
	border: none;
	border-radius: 0; /* Loại bỏ bo góc cho nút Login */
}

.text-dark-green {
	color: #2E8B57 !important;
	font-weight: bold; /* In đậm chữ UTEFF LOGIN */
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
	<div class="login-container">
		<h3 class="text-center text-dark-green">UTEFF LOGIN</h3>
		<form action="/login" method="POST">
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
			<div class="form-check mb-3">
				<input type="checkbox" class="form-check-input" id="remember-me"
					name="remember-me"> <label class="form-check-label"
					for="remember-me">Remember me</label>
			</div>
			<button type="submit" class="btn btn-primary login-btn">Login</button>
			<!-- Thêm nút Quên mật khẩu -->
			<div class="mt-3 text-center"> <a href="/forgot-password">Forget Password</a>
		</div>
		</form>
		<div class="mt-3 text-center">
			Haven't got an account? <a href="/register">Register</a>
		</div>
	</div>
</body>
</html>