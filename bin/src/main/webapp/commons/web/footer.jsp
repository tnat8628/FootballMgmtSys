<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Example</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Màu nền xanh sân cỏ */
        .bg-grass {
            background-color: #28a745; /* Màu xanh sân cỏ */
            background-image: linear-gradient(135deg, #32cd32 25%, #228b22 75%);
            color: #ffffff; /* Màu chữ trắng */
        }

        /* Tiêu đề trong footer */
        .bg-grass h5 {
            color: #f8f9fa; /* Màu tiêu đề sáng hơn */
            margin-bottom: 15px;
        }

        /* Liên kết */
        .bg-grass a {
            color: #ffe400; /* Màu vàng nổi bật */
            text-decoration: underline;
        }

        .bg-grass a:hover {
            color: #ffd700; /* Màu vàng nhạt khi hover */
            text-decoration: none;
        }

        /* Bản quyền */
        .bg-grass .copyright {
            margin-top: 30px;
            font-size: 0.9rem;
            color: #dcdcdc; /* Màu chữ xám nhạt */
        }
    </style>
</head>
<body>
    <!-- Nội dung khác của trang -->

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
                    <p><strong>Phone:</strong> +123 456 7890</p>
                    <p><strong>Email:</strong> info@footballclub.com</p>
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
                    <p>We provide the best football fields and services for enthusiasts of all levels.</p>
                    <p><a href="<%= request.getContextPath() %>/about">Learn more</a></p>
                </div>
            </div>
            <!-- Bản quyền -->
            <div class="text-center copyright">
                &copy; 2024 Football Club. All Rights Reserved.
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
