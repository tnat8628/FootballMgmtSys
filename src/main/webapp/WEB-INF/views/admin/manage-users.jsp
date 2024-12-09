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
		             <th>User Name</th>
		             <th>Fullname</th>
		             <th>Email</th>
		             <th>Phone</th>
		             <th>Avatar</th>
		         </tr>
		     </thead>
		     <tbody>
		     	<c:forEach var="user" items="${list}" varStatus="stt">
		     		<tr>
		     			<td>${stt.index+1}</td>
		     			<td>${user.username}</td>
		     			<td>${user.fullname}</td>
		     			<td>${user.email}</td>
		     			<td>${user.phone}</td>
		     			<td>${user.avatar}</td>		     			
		     		</tr>
		     	</c:forEach>
		     </tbody>
	     </table>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>