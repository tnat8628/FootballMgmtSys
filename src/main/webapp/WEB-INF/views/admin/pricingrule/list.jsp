<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pricing Rule</title>
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">List of Pricing Rule</h1>
		<!-- Display the message if available -->
	        <c:if test="${not empty message}">
	            <div class="alert alert-info">
	                ${message}
	            </div>
	        </c:if>
        <!-- Table to display categories -->
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>STT</th>
                    <th>Field</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Price Per Hour</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dynamic list rendering -->
                <c:forEach var="rule" items="${list}" varStatus="stt">
                    <tr>
                    	<td>${stt.index+1 }</td>
                        <td>${rule.field.fieldName}</td>
                        <td>${rule.startTime}</td>
                        <td>${rule.endTime}</td>
                        <td>${rule.pricePerHour}</td>
                        <td>
                            <!-- Action buttons -->
                            <a href="/admin/pricingrule/edit/${rule.pricingruleId}" class="btn btn-primary btn-sm">Edit</a>
                            <a href="/admin/pricingrule/delete/${rule.pricingruleId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this rule?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Button to add new category -->
        <a href="<c:url value='/admin/pricingrule/add'></c:url>" class="btn btn-success mt-3">Add New Pricing Rule</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>