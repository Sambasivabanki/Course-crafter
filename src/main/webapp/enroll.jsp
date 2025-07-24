<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Enroll in Course</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container mt-4">
    <h3 class="mb-4">Enroll in <strong>${course.courseName}</strong></h3>

    <!-- Enrollment Form -->
    <form action="/enroll" method="post" class="border p-4 rounded bg-light">
        <input type="hidden" name="courseId" value="${course.courseId}" />
        <input type="hidden" name="feepaid" value="${course.price}" />

        <!-- Course Fee Display -->
        <div class="mb-3">
            <input type="hidden" class="form-control" value="₹${course.price}" disabled />
        </div>

        <div class="mb-3">
            <label class="form-label">Your Name</label>
            <input type="text" name="studentName" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Your Email</label>
            <input type="email" name="email" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Your Phone</label>
            <input type="text" name="phone" class="form-control" required />
        </div>

        <!-- Action Buttons -->
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-success">Submit Enrollment</button>
            
        </div>
    </form>
</div>

</body>
</html>
