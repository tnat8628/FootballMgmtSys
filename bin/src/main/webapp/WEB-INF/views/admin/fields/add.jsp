<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${field.isEdit ? "Edit Field" : "Add Field"}</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">${field.isEdit ? "Edit Field" : "Add New Field"}</h4>
            </div>
            <div class="card-body">
                <form action="<c:url value='/admin/fields/save'/>" method="POST">
                    <!-- Hidden fields -->
                    <input type="hidden" value="${field.isEdit}" name="isEdit">
                    <input type="hidden" value="${field.fieldId}" name="fieldId">

                    <!-- Field Name -->
                    <div class="mb-3">
                        <label for="fieldName" class="form-label">Field Name</label>
                        <input type="text" id="fieldName" name="fieldName" class="form-control" 
                               value="${field.fieldName}" placeholder="Enter field name" required>
                    </div>
                    
                    <!-- Field Category -->
					<div class="mb-3">
					    <label for="category" class="form-label">Field Category</label>
					    <select id="category" name="category" class="form-select" required>
					        <option value="">Select a category</option>
					        <c:forEach var="category" items="${category}">
					            <option value="${category.categoryId}" 
					                    <c:if test="${field.category != null and category.categoryId == field.category.categoryId}">selected</c:if>>
					                ${category.categoryName}
					            </option>
					        </c:forEach>
					    </select>
					</div>
                    
                    <!-- Status -->
                    <div class="mb-3">
                    	<label for="isActive">Status:</label><br>
						<input type="checkbox" id="isActive" name="isActive" value="1">
						<label for="isActive">Hoạt động</label><br><br>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-${field.isEdit ? 'warning' : 'success'} me-2">
                            ${field.isEdit ? "Update" : "Save"}
                        </button>
                        <a href="/admin/fields" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
