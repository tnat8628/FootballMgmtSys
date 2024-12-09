<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fields by Category</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Fields in Category: <span class="text-primary">${category.categoryName}</span></h1>

        <c:if test="${not empty fields}">
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Field ID</th>
                            <th scope="col">Field Name</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="field" items="${fields}">
                            <tr>
                                <td>${field.fieldId}</td>
                                <td>${field.fieldName}</td>
                                <td>
                                    <span class="badge ${field.isActive ? 'bg-success' : 'bg-danger'}">
                                        ${field.isActive ? "Active" : "Inactive"}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${empty fields}">
            <div class="alert alert-warning text-center">
                <strong>No fields found</strong> for this category.
            </div>
        </c:if>

        <div class="text-center mt-4">
            <a href="/home" class="btn btn-secondary">Back to Categories</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
