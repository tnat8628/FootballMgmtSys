<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* CSS toàn bộ trang */
        html, body {
            height: 100%;  /* Đảm bảo body và html có chiều cao 100% */
            margin: 0;     /* Loại bỏ margin mặc định */
        }

        body {
            display: flex;
            flex-direction: column;  /* Đặt chiều dọc cho phần tử trong body */
        }

        /* Container chính */
        .container {
            flex: 1;  /* Nội dung của trang sẽ chiếm không gian còn lại */
        }

        /* Footer luôn ở dưới cùng */
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body> 
    <!-- Main Content -->
    <div class="container mt-4">
        <div class="row">
            <!-- Chào mừng Admin -->
            <div class="col-md-12">
                <div class="alert alert-success">
                    <h4>Welcome, <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Admin" %>!</h4>
                    <p>Here you can manage all the football fields, user bookings, and other admin functionalities.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Card thống kê số lượng sân -->
            <div class="col-md-3">
                <div class="card statistics-card">
                    <div class="card-body">
                        <h5 class="card-title">Total Football Fields</h5>
                        <p class="card-text">${totalField}</p>
                    </div>
                </div>
            </div>

            <!-- Card thống kê số lượng người dùng -->
            <div class="col-md-3">
                <div class="card statistics-card">
                    <div class="card-body">
                        <h5 class="card-title">Total Users</h5>
                        <p class="card-text">250</p>
                    </div>
                </div>
            </div>

            <!-- Card thống kê số lượng đặt sân -->
            <div class="col-md-3">
                <div class="card statistics-card">
                    <div class="card-body">
                        <h5 class="card-title">Bookings Today</h5>
                        <p class="card-text">35</p>
                    </div>
                </div>
            </div>

            <!-- Card chức năng quản lý -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Manage Football Fields</h5>
                        <a href="/admin/fields" class="btn btn-primary">Manage</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <!-- Quản lý người dùng -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Manage Users</h5>
                        <a href="<%= request.getContextPath() %>/manage-users" class="btn btn-primary">Manage</a>
                    </div>
                </div>
            </div>

            <!-- Quản lý đặt sân -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Manage Bookings</h5>
                        <a href="<%= request.getContextPath() %>/manage-bookings" class="btn btn-primary">Manage</a>
                    </div>
                </div>
            </div>

            <!-- Thêm sân mới -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add New Field</h5>
                        <a href="<%= request.getContextPath() %>/add-field" class="btn btn-primary">Add Field</a>
                    </div>
                </div>
            </div>

            <!-- Thống kê hệ thống -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">System Statistics</h5>
                        <a href="<%= request.getContextPath() %>/system-stats" class="btn btn-primary">View Stats</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
