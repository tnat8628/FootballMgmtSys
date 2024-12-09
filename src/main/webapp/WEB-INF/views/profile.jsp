<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Avatar Styles */
        .avatar-container {
            width: 180px; /* Tăng kích thước avatar */
            height: 180px;
            /* border-radius: 50%; */ /* Bỏ bo góc */
            overflow: hidden;
            margin: 0 auto 20px auto;
            border: 4px solid #2E8B57; /* Tăng độ dày viền */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Thêm bóng đổ */
            background-color: #ffffff; /* Nền trắng để nổi bật hơn */
        }

        .avatar-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Form Styles */
        .form-control {
            border-radius: 0;
        }

        .btn-primary, .btn-secondary {
            border-radius: 0;
            width: 3cm; /* Chiều dài 3cm */
        }

        .btn-primary {
            background-color: #2E8B57;
            border-color: #2E8B57;
        }

        .btn-primary:hover {
            background-color: #206040;
            border-color: #206040;
        }

        .btn-secondary {
            background-color: #2E8B57;
            border-color: #2E8B57;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        /* Header Styles */
        h2 {
            font-size: 28px;
            font-weight: bold;
            color: #2E8B57;
            margin-bottom: 30px;
        }

        /* Container Styles */
        .container {
            margin-top: 70px; /* Điều chỉnh để không bị che bởi navbar cố định */
            margin-bottom: 50px;
        }

        .mb-3 {
            margin-bottom: 20px;
        }

        .form-label {
            margin-bottom: 5px;
            font-weight: 600;
        }

        body {
            background-color: #f8f9fa;
        }

        /* Card Styles */
        .card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border: none;
            border-radius: 10px; /* Bo góc card */
            padding: 20px;
            background-color: #ffffff; /* Nền trắng cho card */
        }

        /* Alert Styles */
        .alert-info {
            background-color: #d1e7dd;
            color: #0f5132;
            border-color: #badbcc;
        }

        /* Navbar Custom Styles */
        .navbar-custom {
            height: 2cm;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* Thêm bóng đổ cho navbar */
        }

        .navbar-custom .navbar-brand {
            font-weight: bold;
            color: #2E8B57;
            font-size: 1.5rem; /* Tăng kích thước font cho thương hiệu */
        }

        .navbar-custom .navbar-brand:hover {
            color: #206040;
            text-decoration: none;
        }

        /* Adjust button height to fit navbar */
        .navbar-custom .btn {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 1rem;
            margin-left: 10px; /* Khoảng cách giữa các nút */
        }

        /* Prevent overflow in navbar */
        .navbar-custom .navbar-nav {
            flex-direction: row;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .navbar-custom .btn {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="/"><strong>UTEFF</strong></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <!-- Chỉ giữ nút Logout -->
                <form action="/logout" method="post" class="d-inline">
                    <button type="submit" class="btn btn-secondary">Logout</button>
                </form>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <div class="card">
            <h2 class="text-center">User Profile</h2>
            <div class="row">
                <!-- Avatar -->
                <div class="col-md-4 text-center">
                    <div class="avatar-container">
                        <img src="<c:out value='${user.avatar != null && !user.avatar.isEmpty() ? user.avatar : "images/default-avatar.jpg"}'/>" alt="Avatar" id="avatarImage" loading="lazy">
                    </div>
                </div>
                <!-- Form cập nhật thông tin người dùng và mật khẩu -->
                <div class="col-md-8">
                    <form action="/profile/update" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="fullname" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" value="<c:out value='${user.fullname}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="<c:out value='${user.email}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="<c:out value='${user.phone}'/>" required>
                        </div>
                        <hr>
                        <h4>Change Password</h4>
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">New Password</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword">
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm New Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                        </div>
                        <hr>
                        <div class="mb-3">
                            <label for="avatar" class="form-label">Update Avatar</label>
                            <input type="file" class="form-control" id="avatar" name="avatar" accept="image/*">
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Update Profile</button>
                    </form>
                </div>
            </div>
            <!-- Thông báo -->
            <c:if test="${not empty message}">
                <div class="alert alert-info mt-4 text-center">${message}</div>
            </c:if>
        </div>
    </div>

    <!-- Footer (Bạn có thể thêm footer nếu muốn) -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- JavaScript để kiểm tra mật khẩu mới trùng khớp trước khi gửi form và preview avatar -->
    <script>
        document.querySelector('form').addEventListener('submit', function(event) {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (newPassword !== confirmPassword) {
                alert('New password and confirm password do not match.');
                event.preventDefault();
            }
        });

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