<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<body>
    <div class="container mt-4">
        <h1 class="text-center mb-4">Đặt Sân Bóng</h1>
        <!-- Form đặt sân -->
        <form action="/booking/save" method="post" class="p-4 border rounded bg-light">
            <input type="hidden" name="fieldId" value="${field.fieldId}" />

            <!-- Tên sân -->
            <div class="form-group mb-4">
                <label for="fieldName" class="form-label fw-bold">Tên Sân</label>
                <input type="text" class="form-control" id="fieldName" name="fieldName" value="${field.fieldName}" readonly>
            </div>

            <!-- Lịch thời gian đặt sân -->
            <h2 class="mb-4">Booked Schedule</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Booking Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td>${booking.bookingDate}</td>
                            <td>${booking.startTime}</td>
                            <td>${booking.endTime}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            

            <!-- Ngày đặt -->
            <div class="mb-3">
                <label for="bookingDate" class="form-label"><b>Chọn Ngày:</b></label>
                <input type="date" id="bookingDate" name="bookingDate" class="form-control"
                value="${newBooking.bookingDate}" required>
            </div>

            <!-- Chọn giờ bắt đầu -->
            <div class="mb-3">
                <label for="startTime" class="form-label"><b>Chọn giờ bắt đầu:</b></label>
                <input type="text" id="startTime" name="startTime" class="form-control"
                value="${newBooking.startTime}" placeholder="Nhập giờ bắt đầu" required>
            </div>

            <!-- Chọn giờ kết thúc -->
            <div class="mb-3">
                <label for="endTime" class="form-label"><b>Chọn giờ kết thúc:</b></label>
                <input type="text" id="endTime" name="endTime" class="form-control"
                value="${newBooking.endTime}" placeholder="Nhập giờ kết thúc" required>
            </div>

            <button type="submit" class="btn btn-success">Xác Nhận Đặt Sân</button>
        </form>
    </div>
</body>
</html>
