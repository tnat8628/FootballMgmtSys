<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body class="bg-white text-dark">

    <!-- Header -->
    <header class="sticky-header bg-dark-green text-white d-flex align-items-center" style="height: 2cm;">
        <div class="container d-flex justify-content-between align-items-center">
            <!-- Tiêu đề -->
            <h1 class="m-0 fs-4">UTE Football</h1>

            <!-- Nút điều hướng -->
            <div>
                <a href="/login" class="text-white me-3 text-decoration-none btn-hover">Đăng nhập</a>
                <a href="/register" class="text-white text-decoration-none btn-hover">Đăng ký</a>
            </div>
        </div>
    </header>

    <!-- Carousel -->
    <div id="carouselExampleIndicators"
        class="carousel slide mt-4 container" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide-to="2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/images/slider1.jpg" class="d-block w-100" alt="Slider 1">
            </div>
            <div class="carousel-item">
                <img src="/images/slider2.jpg" class="d-block w-100" alt="Slider 2">
            </div>
            <div class="carousel-item">
                <img src="/images/slider3.jpg" class="d-block w-100" alt="Slider 3">
            </div>
        </div>
        <button class="carousel-control-prev" type="button"
            data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button"
            data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- Main Content -->
    <main class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <h2>News & Updates</h2>
                <p>Stay updated with the latest news and updates about the UTE Football Management System.</p>
            </div>
            <div class="col-md-6">
                <h2>Upcoming Events</h2>
                <p>Don't miss any upcoming matches, events, or activities. Stay tuned!</p>
            </div>
        </div>
    </main>

    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
