<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - ${title}</title>
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
            flex: 1;  /* Nội dung chính sẽ chiếm không gian còn lại */
        }

        /* Footer */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
	<%@ include file="/commons/admin/header.jsp" %>
	
	<sitemesh:write property="body"/>
	
	<%@ include file="/commons/admin/footer.jsp" %>
	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>