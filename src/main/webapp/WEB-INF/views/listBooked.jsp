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
		             <th>Field</th>
                     <th>Start Time</th>
                     <th>End Time</th>
                     <th>Total Price</th>
                     <th>Bookind Date</th>
                     <th>Status</th>
		         </tr>
		     </thead>
		     <tbody>
		     	<c:forEach var="booking" items="${list}" varStatus="stt">
		     		<tr>
		     			<td>${stt.index+1}</td>
		     			<td>${booking.field.fieldName}</td>	 
                        <td>${booking.startTime}</td>
                        <td>${booking.endTime}</td> 
                        <td>${booking.totalPrice}</td>   
                        <td>${booking.bookingDate}</td>	
                        <td>${booking.status}</td>		
		     		</tr>
		     	</c:forEach>
		     </tbody>
	     </table>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>