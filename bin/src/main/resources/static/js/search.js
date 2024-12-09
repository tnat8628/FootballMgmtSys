$(document).ready(function () {
    $("#searchInput").on("input", function () {
        const keyword = $(this).val().trim();

        // Gửi yêu cầu AJAX nếu từ khóa không rỗng
        if (keyword.length > 0) {
            $.ajax({
                url: '/', // Gửi về trang home
                method: 'GET',
                data: { keyword: keyword }, // Gửi từ khóa tới server
                success: function (response) {
                    // Trích phần HTML của #searchResults từ response
                    const newContent = $(response).find("#searchResults").html();
                    $("#searchResults").html(newContent); // Cập nhật giao diện
                },
                error: function () {
                    $("#searchResults").html('<p class="text-danger">Không thể tải kết quả tìm kiếm.</p>');
                }
            });
        } else {
            // Xóa kết quả nếu từ khóa rỗng
            $.ajax({
                url: '/', // Tải lại danh sách đầy đủ
                method: 'GET',
                success: function (response) {
                    const newContent = $(response).find("#searchResults").html();
                    $("#searchResults").html(newContent);
                }
            });
        }
    });
});
