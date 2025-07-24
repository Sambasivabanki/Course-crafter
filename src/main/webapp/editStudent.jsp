<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="adminNavbar.jsp" />

<div class="container mt-5">
    <h3 class="mb-4 text-center">✏️ Edit Student Enrollment</h3>

    <form action="/admin/updateStudent" method="post" class="border p-4 rounded bg-light">
        <input type="hidden" name="id" value="${student.id}" />

        <!-- Name -->
        <div class="mb-3">
            <label class="form-label">Student Name</label>
            <input type="text" name="studentName" class="form-control" value="${student.studentName}" required />
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="${student.email}" required />
        </div>

        <!-- Phone -->
        <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" name="phone" class="form-control" value="${student.phone}" required />
        </div>

        <!-- Course Dropdown -->
        <div class="mb-3">
            <label class="form-label">Course</label>
            <select name="courses.courseId" class="form-select" required>
                <c:forEach var="course" items="${courses}">
                    <option value="${course.courseId}" ${course.courseId == student.courses.courseId ? 'selected' : ''}>
                        ${course.courseName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <!-- Fee Paid -->
        <div class="mb-3">
            <label class="form-label">Fee Paid (₹)</label>
            <input type="number" name="feepaid" class="form-control" value="${student.feepaid}" step="0.01" required />
        </div>

        <!-- Buttons -->
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-success">Update</button>
            <a href="/admin/enrolledStudents" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
