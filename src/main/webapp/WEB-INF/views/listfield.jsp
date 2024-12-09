<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách loại sân</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">List of Categories</h1>

        <!-- Hiển thị thông báo nếu có -->
        <c:if test="${not empty message}">
            <div class="alert alert-info">
                ${message}
            </div>
        </c:if>

        <!-- Bảng danh sách -->
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>STT</th>
                    <th>Field Name</th>
                    <th>Field Category</th>
                    <th>Field Status</th>
                    <c:if test="${not empty sessionScope.user}">
                        <th>Action</th>
                    </c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="field" items="${list}" varStatus="stt">
                    <tr>
                        <td>${stt.index + 1}</td>
                        <td>${field.fieldName}</td>
                        <td>${field.category.categoryName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${field.isActive == true}">Hoạt động</c:when>
                                <c:otherwise>Ngưng hoạt động</c:otherwise>
                            </c:choose>
                        </td>
                        <c:if test="${not empty sessionScope.user}">
							<td>
								<c:choose>
									<c:when test="${field.isActive}">
										<a class="btn btn-primary" href="/booking/${field.fieldId}">Đặt sân</a>
									</c:when>
									<c:otherwise>
										<a class="btn btn-secondary" href="javascript:void(0);" style="pointer-events: none;">Không thể đặt</a>
									</c:otherwise>
								</c:choose>
							</td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
