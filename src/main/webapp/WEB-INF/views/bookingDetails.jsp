<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Booking Details</h1>

        <!-- Thông tin sân -->
        <div class="mb-3">
            <label class="form-label"><strong>Field Name:</strong></label>
            <span>${field.fieldName}</span>
        </div>

        <div class="mb-3">
            <label class="form-label"><strong>Category:</strong></label>
            <span>${field.category.categoryName}</span>
        </div>

        <!-- Thời gian đặt -->
        <div class="mb-3">
            <label class="form-label"><strong>Booking Time:</strong></label>
            <span>${bookingTime}</span>
        </div>

        <!-- Giá tại thời điểm đặt -->
        <div class="mb-3">
            <label class="form-label"><strong>Price per Hour:</strong></label>
            <span>${price}</span>
        </div>

        <!-- Nút xác nhận -->
        <form action="/processBooking" method="POST">
            <input type="hidden" name="fieldId" value="${field.fieldId}">
            <input type="hidden" name="bookingTime" value="${bookingTime}">
            <button type="submit" class="btn btn-success">Xác nhận đặt sân</button>
        </form>
    </div>
</body>
</html>
