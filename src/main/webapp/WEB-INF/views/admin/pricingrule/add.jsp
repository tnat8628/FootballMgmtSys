<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pricingrule.isEdit ? "Edit Pricing Rule" : "Add New Pricing Rule"}</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">${pricingrule.isEdit ? "Edit Pricing Rule" : "Add New Pricing Rule"}</h4>
            </div>
            <div class="card-body">
                <form action="<c:url value='/admin/pricingrule/save'/>" method="POST">
                    <!-- Display the message if available -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-info">
                            ${message}
                        </div>
                    </c:if>
                    <!-- Hidden Pricing Rule -->
                    <input type="hidden" value="${pricingRule.isEdit}" name="isEdit">
                    <input type="hidden" value="${pricingRule.pricingruleId}" name="pricingruleId">
                    
                    <!-- Field -->
                    <div class="mb-3">
                        <label for="field" class="form-label">Field</label>
                        <select id="field" name="field" class="form-select" required>
                            <option value="">Select a field</option>
                            <c:forEach var="field" items="${field}">
                                <option value="${field.fieldId}" 
                                        <c:if test="${pricingRule.field != null && field.fieldId == pricingRule.field.fieldId}">selected</c:if>>
                                    ${field.fieldName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Start Time -->
                    <div class="mb-3">
                        <label for="startTime" class="form-label">Start Time</label>
                        <input type="text" id="startTime" name="startTime" class="form-control" 
                            value="${pricingRule.startTime != null ? pricingRule.startTime.toString().substring(0, 5) : ''}" required placeholder="hh:mm:ss">
                    </div>

                    <!-- End Time -->
                    <div class="mb-3">
                        <label for="endTime" class="form-label">End Time</label>
                        <input type="text" id="endTime" name="endTime" class="form-control" 
                            value="${pricingRule.endTime != null ? pricingRule.endTime.toString().substring(0, 5) : ''}" required placeholder="hh:mm:ss">
                    </div>

                    <!-- Price Per Hour -->
                    <div class="mb-3">
                        <label for="pricePerHour" class="form-label">Price Per Hour</label>
                        <input type="number" id="pricePerHour" name="pricePerHour" class="form-control" 
                               value="${pricingRule.pricePerHour}" step="0.01" required>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-${pricingRule.isEdit ? 'warning' : 'success'} me-2">
                            ${pricingRule.isEdit ? "Update" : "Save"}
                        </button>
                        <a href="/admin/pricingrule" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
