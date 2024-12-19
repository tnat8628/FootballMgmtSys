<form action="/booking/save" method="post">
    <input type="hidden" name="fieldId" value="${newBooking.field.fieldId}" />
    <div class="form-group">
        <label for="fieldName">Tên Sân</label>
        <input type="text" id="fieldName" name="fieldName" value="${newBooking.field.fieldName}" readonly />
    </div>

    <div class="form-group">
        <label for="bookingDate">Ngày Đặt</label>
        <input type="text" id="bookingDate" name="bookingDate" value="${newBooking.bookingDate}" readonly />
    </div>

    <div class="form-group">
        <label for="startTime">Giờ bắt đầu</label>
        <input type="text" id="startTime" name="startTime" value="${newBooking.startTime}" readonly />
    </div>

    <div class="form-group">
        <label for="endTime">Giờ kết thúc</label>
        <input type="text" id="endTime" name="endTime" value="${newBooking.endTime}" readonly />
    </div>

    <div class="form-group">
        <label for="totalPrice">Tổng Giá Tiền</label>
        <input type="text" id="totalPrice" name="totalPrice" value="${newBooking.totalPrice}" readonly />
    </div>

    <a href="<c:url value='/field'></c:url>" class="btn btn-success mt-3">Add New Pricing Rule</a>
</form>
