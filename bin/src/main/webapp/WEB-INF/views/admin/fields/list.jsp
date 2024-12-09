<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-4">
        <h1 class="mb-4">List of Categories</h1>
        <!-- Display the message if available -->
        <c:if test="${not empty message}">
            <div class="alert alert-info">
                ${message}
            </div>
        </c:if>
		<table class="table table-striped table-bordered">
		     <thead class="table-dark">
		         <tr>
		             <th>STT</th>
		             <th>Field Name</th>
		             <th>Field Category</th>
		             <th>Field Status</th>
		             <th>Action</th>
		         </tr>
		     </thead>
		     <tbody>
		     	<c:forEach var="field" items="${list}" varStatus="stt">
		     		<tr>
		     			<td>${stt.index+1}</td>
		     			<td>${field.fieldName}</td>
		     			<td>${field.category.categoryName}</td>
		     			<td>
		                    <c:choose>
							    <c:when test="${field.isActive == true}">Hoạt động</c:when>
							    <c:otherwise>Khóa</c:otherwise>
							</c:choose>
		                </td>
		                <td>
                            <!-- Action buttons -->
                            <a href="/admin/fields/edit/${field.fieldId}" class="btn btn-primary btn-sm">Edit</a>
                            <a href="/admin/fields/delete/${field.fieldId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this field?');">Delete</a>
                        </td>
		     		</tr>
		     	</c:forEach>
		     </tbody>
	     </table>
	     <!-- Button to add new category -->
        <a href="<c:url value='/admin/fields/add'></c:url>" class="btn btn-success mt-3">Add New Field</a>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>