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
<style>
#error-message {
    font-size: 0.875rem;
}
.search-bar-wrapper {
    background-color: #ffffff; /* Màu nền trắng */
    border-radius: 12px; /* Bo góc */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15); /* Đổ bóng */
    max-width: 800px; /* Độ rộng tối đa */
    margin: auto; /* Căn giữa khung */
    padding: 2rem; /* Khoảng cách bên trong */
}
</style>

</head>
<body class="bg-white text-dark">

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
	
	<!-- Search Bar -->
	<div class="container my-5">
    	<div class="search-bar-wrapper bg-white p-4 rounded shadow-lg col-md-10 mx-auto">
        	<h2 class="title text-center mb-3">Đặt sân bóng đá ngay</h2>
        	<p class="sub-title text-center mb-4">Tìm kiếm sân bóng đá ở UTE</p>
       	 	<div class="group-form-field-search-area">
            	<div class="input-group mb-3">
                	<label class="input-group-text" for="sports-bar">
                    	<img class="icon-selectbox" src="/images/icon_selectbox.png" alt="sports" width="25" height="18">
                	</label>
                	<select class="form-select" id="sports-bar" name="sports-name">
                    	<option selected disabled>Chọn thể loại sân</option>
                    	<option value="5-5">5-5</option>
                    	<option value="7-7">7-7</option>
                    	<option value="11-11">11-11</option>
                	</select>
                	 <input type="text" class="form-control" placeholder="Nhập tên sân" aria-label="Nhập tên sân">
                	<button class="btn btn-primary btn-lg" type="button">
                    	<span class="text-btn">Tìm kiếm ngay</span>
                	</button>
            	</div>
            	<span class="text-danger mt-2 d-none" id="error-message">Vui lòng chọn thể loại sân</span>
        	</div>
    	</div>
	</div>
	
	<!-- Main Content -->
	<main class="container">
    	<!-- Promotion -->
    	<div class="text-center my-5">
        	<h2 style="font-size: 2.5rem;">Chương Trình Khuyến Mãi</h2>
        	<p style="font-size:1.5rem">Nhận nhiều ưu đãi hấp dẫn từ UTEFF</p>
    	</div>

    	<!-- Bootstrap Multi-Item Carousel -->
    	<div id="promoCarousel" class="carousel slide" data-bs-ride="carousel">
        	<div class="carousel-inner">
            	<!-- Slide 1 -->
            	<div class="carousel-item active">
                	<div class="row">
                    	<div class="col-lg-4 d-flex justify-content-center">
                        	<a href="/promotion1" target="_blank">
                            	<img src="/images/promo1.jpg" class="img-fluid rounded" alt="Promotion 1" style="width: 600px; height: 300px;">
                        	</a>
                    	</div>
                   		<div class="col-lg-4 d-flex justify-content-center">
                        	<a href="/promotion2" target="_blank">
                            	<img src="/images/promo2.jpg" class="img-fluid rounded" alt="Promotion 2" style="width: 600px ; height: 300px;">
                       	 	</a>
                    	</div>
                    		<div class="col-lg-4 d-flex justify-content-center">
                        		<a href="/promotion3" target="_blank">
                            		<img src="/images/promo3.jpg" class="img-fluid rounded" alt="Promotion 3" style="width:550px; height: 300px;">
                        		</a>
                    	</div>
                	</div>
            	</div>
        	</div>

        	<!-- Nút điều hướng -->
        	<button class="carousel-control-prev" type="button" data-bs-target="#promoCarousel" data-bs-slide="prev">
            	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
            	<span class="visually-hidden">Previous</span>
        	</button>
        	<button class="carousel-control-next" type="button" data-bs-target="#promoCarousel" data-bs-slide="next">
            	<span class="carousel-control-next-icon" aria-hidden="true"></span>
            	<span class="visually-hidden">Next</span>
        	</button>
    	</div>

		<!-- Blog -->
            <div class="text-center my-5">
                <h2 style="font-size: 2.5rem;">UTEFF BLOG</h2>
                <p style="font-size: 1.5rem;">Tin tức được cập nhật liên tục cho người chơi</p>
                <!-- Row of blog posts -->
        			<div class="row g-3">
            			<!-- Post 1 -->
            			<div class="col-md-6 col-lg-4">
                			<div class="blog-card">
                			<a href="/blog1" target="_blank">
                    			<img src="/images/blog1.jpg" width = "400px" height = "300px" alt="Blog 1">
                    		</a>
                    		<div class="blog-title">Top 5 Sân bóng nhân tạo tốt ở Thủ Đức</div>
                			</div>
            			</div>		
           				<!-- Post 2 -->
            			<div class="col-md-6 col-lg-4">
                			<div class="blog-card">
                			<a href="/blog2" target="_blank">
                    			<img src="/images/blog2.jpg" width = "400px" height = "300px" alt="Blog 2">
                    		</a>
                    			<div class="blog-title">Các cầu thủ UTE ăn mừng chiến thắng tại UTEFF</div>
                			</div>
            			</div>
            			<!-- Post 3 -->
            			<div class="col-md-6 col-lg-4">
                			<div class="blog-card">
                			<a href="/blog1" target="_blank">
                    			<img src="/images/blog3.jpg" width = "400px" height = "300px" alt="Blog 3">
                    		</a>
                    			<div class="blog-title">Kết quả xếp hạng bang A khu vực phía Nam</div>
                			</div>
            			</div>
         			</div>
        	</div>
    </main>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>