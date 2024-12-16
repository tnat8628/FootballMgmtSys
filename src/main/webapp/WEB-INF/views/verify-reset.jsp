<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Đảm bảo toàn bộ trang không bị dính vào lề */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	background-color: #f0f2f5;
}

/* Căn giữa nội dung theo chiều dọc */
.container {
	max-width: 600px;
	margin: 5% auto; /* Thêm margin để tạo khoảng cách từ trên xuống */
	padding: 2rem;
	background-color: #fff;
	border: 1px solid #ddd;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 50px;
}

/* Tiêu đề màu xanh đậm */
.text-dark-green {
	color: #2E8B57;
	font-weight: bold;
	margin-bottom: 1.5rem;
}

/* Tạo nút vuông vức */
.btn-success {
	width: 100%;
	background-color: #2E8B57;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 0; /* Vuông góc */
	margin-top: 1rem;
	margin-bottom: 2rem; /* Thêm khoảng cách dưới cùng */
}

/* Chỉnh các input vuông vức */
.form-control {
	border: 1px solid #ccc;
	border-radius: 0; /* Vuông góc */
	padding: 10px;
}

/* Căn giữa thông báo */
.alert {
	text-align: center;
	margin-bottom: 1.5rem;
}

/* Khoảng cách dưới cùng */
.mb-3 {
	margin-bottom: 1.5rem;
}
</style>
</head>
<body>
	<div class="container">
		<h3 class="text-center text-dark-green">RESET PASSWORD</h3>

		<!-- Hiển thị thông báo lỗi hoặc thành công -->
		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
		</c:if>
		<c:if test="${not empty success}">
			<div class="alert alert-success">${success}</div>
		</c:if>

		<form action="/process-otp-reset-password" method="POST">
			<input type="hidden" name="email" value="${email}" />

			<!-- Nhập mã OTP -->
			<div class="mb-3">
				<label for="otp" class="form-label">OTP Code</label> <input
					type="text" class="form-control" id="otp" name="otp"
					placeholder="Nhập mã OTP" required>
			</div>

			<!-- Nhập mật khẩu mới -->
			<div class="mb-3">
				<label for="newPassword" class="form-label">New Password</label> <input
					type="password" class="form-control" id="newPassword"
					name="newPassword" placeholder="Nhập mật khẩu mới" required>
			</div>

			<!-- Xác nhận mật khẩu -->
			<div class="mb-3">
				<label for="confirmPassword" class="form-label">Confirm Password</label> <input type="password" class="form-control"
					id="confirmPassword" name="confirmPassword"
					placeholder="Xác nhận mật khẩu mới" required>
			</div>

			<!-- Nút đặt lại mật khẩu -->
			<button type="submit" class="btn btn-success">RESET PASSWORD</button>
		</form>
	</div>
</body>
</html>
