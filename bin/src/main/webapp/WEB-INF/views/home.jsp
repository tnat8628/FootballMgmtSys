<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Football Field Selection</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .field-image {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .choice-card img {
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
        }
        .news-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
    	<!-- Form Tìm kiếm -->
	    <!-- Form Tìm kiếm -->
	    <div class="my-4">
	        <input type="text" id="searchResults" class="form-control" placeholder="Nhập tên loại sân để tìm kiếm..."
	               value="${keyword != null ? keyword : ''}">
	    </div>
        <!-- Hình sân cỏ -->
        <div class="text-center">
            <img src="<%= request.getContextPath() %>/images/field.jpeg" alt="Football Field" class="field-image">
        </div>

        <!-- Lựa chọn loại sân -->
        <div class="container mt-4">
        <h2 class="text-center">Chọn Loại Sân</h2>
        <div class="row text-center mt-4">
            <c:forEach var="category" items="${categories}">
                <div class="col-md-4 mt-3">
                    <div class="card choice-card">
                        
                        <div class="card-body">
                            <h5 class="card-title">${category.categoryName}</h5>
                            <a href="<c:url value='/fields/${category.categoryId}'/>" class="btn btn-primary">Chọn</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

        <!-- Tin tức bóng đá -->
        <div class="mt-5">
            <h2>Football News</h2>
            <div class="news-list">
                <%
                    String[][] news = {
                        {"Breaking: Team A wins championship", "Team A has secured a victory in the finals with a dramatic penalty shootout.", "1"},
                        {"Player X signs with Team Y", "Star player X officially joins Team Y on a record-breaking transfer deal.", "2"},
                        {"Upcoming: National League fixtures", "The schedule for the upcoming National League has been released.", "3"}
                    };
                    for (String[] newsItem : news) {
                %>
                <div class="news-item">
                    <h5><a href="<%= request.getContextPath() %>/news/<%= newsItem[2] %>"><%= newsItem[0] %></a></h5>
                    <p><%= newsItem[1] %></p>
                </div>
                <% } %>
            </div>
        </div>
    </div>

    <!-- Link Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="<c:url value='/js/search.js'/>"></script>
    
</body>
</html>
