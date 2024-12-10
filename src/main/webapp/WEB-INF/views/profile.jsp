<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Fix khoảng cách do navbar cố định */
body {
	padding-top: 70px;
	/* Thêm khoảng cách để nội dung không bị navbar che */
	background-color: #f8f9fa; /* Nền sáng */
}

.avatar-container {
	width: 180px; /* Kích thước cố định khung ảnh */
	height: 180px;
	margin: 0 auto 20px auto;
	border: 4px solid #2E8B57; /* Viền ảnh */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Bóng đổ */
	background-color: #ffffff; /* Nền trắng */
	overflow: hidden;
}

.avatar-container img {
	width: 100%; /* Ảnh luôn đầy khung */
	height: 100%; /* Tỷ lệ đầy đủ */
	object-fit: cover; /* Đảm bảo hiển thị toàn bộ ảnh */
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border: none;
	border-radius: 10px;
	padding: 20px;
	background-color: #ffffff;
}

h2 {
	font-size: 28px;
	font-weight: bold;
	color: #2E8B57;
	margin-bottom: 30px;
	text-align: center; /* Căn giữa */
}
/* CSS cho nút Logout và Update Profile */
.btn-dark-green {
	border-radius: 0; /* Không bo góc */
	background-color: #064635; /* Màu dark green */
	border-color: #064635; /* Viền cùng màu */
	color: #ffffff; /* Chữ màu trắng */
	width: 100%; /* Chiều rộng 100% */
}

.btn-dark-green:hover {
	background-color: #042f26; /* Màu dark green đậm hơn khi hover */
	border-color: #042f26; /* Viền cùng màu khi hover */
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light fixed-top navbar-custom">
		<div class="container">
			<a class="navbar-brand" href="/"><strong>UTEFF</strong></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<!-- Chỉ giữ nút Logout -->
				<form action="/logout" method="post" class="d-inline">
					<button type="submit" class="btn btn-dark-green">Logout</button>
				</form>

			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container">
		<div class="card">
			<h2>User Profile</h2>
			<!-- Đảm bảo chữ không bị che -->
			<div class="row">
				<!-- Avatar -->
				<div class="col-md-4 text-center">
					<div class="avatar-container">
						<img src="<c:out value='${avatarUrl}' />" alt="Avatar"
							id="avatarImage" loading="lazy">
					</div>
				</div>
				<!-- Form cập nhật thông tin người dùng và mật khẩu -->
				<div class="col-md-8">
					<form action="/profile/update" method="post"
						enctype="multipart/form-data">
						<div class="mb-3">
							<label for="fullname" class="form-label">Full Name</label> <input
								type="text" class="form-control" id="fullname" name="fullname"
								value="<c:out value='${user.fullname}'/>" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								value="<c:out value='${user.email}'/>" required>
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">Phone Number</label> <input
								type="text" class="form-control" id="phone" name="phone"
								value="<c:out value='${user.phone}'/>" required>
						</div>
						<hr>
						<h4>Change Password</h4>
						<div class="mb-3">
							<label for="password" class="form-label">New Password</label> <input
								type="password" class="form-control" id="password"
								name="password">
						</div>
						<hr>
						<div class="mb-3">
							<label for="avatar" class="form-label">Update Avatar</label> <input
								type="file" class="form-control" id="avatar" name="avatar"
								accept="image/*">
						</div>
						<button type="submit" class="btn btn-dark-green">Update
							Profile</button>
					</form>
				</div>
			</div>
			<!-- Thông báo -->
			<c:if test="${not empty message}">
				<div class="alert alert-info mt-4 text-center">${message}</div>
			</c:if>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // Preview Avatar khi chọn file mới
        document.getElementById('avatar').addEventListener('change', function(event) {
            const [file] = event.target.files;
            if (file) {
                document.getElementById('avatarImage').src = URL.createObjectURL(file);
            }
        });
    </script>
</body>
</html>
