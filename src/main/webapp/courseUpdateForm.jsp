<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Course</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container mt-4">
    <h3 class="mb-4">Update Course Details</h3>
    <form action="/admin/saveUpdatedCourse" method="post" enctype="multipart/form-data">

        <input type="hidden" name="courseId" value="${course.courseId}" />
        <input type="hidden" name="oldImageName" value="${course.imageName}" />

        <div class="mb-3">
            <label>Course Name</label>
            <input type="text" name="courseName" class="form-control" value="${course.courseName}" required />
        </div>

        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control" required>${course.description}</textarea>
        </div>

        <div class="mb-3">
            <label>Start Date</label>
            <input type="date" name="startDate" class="form-control" value="${course.startDate}" required />
        </div>

        <div class="mb-3">
            <label>Price</label>
            <input type="number" name="price" class="form-control" value="${course.price}" required />
        </div>

        <div class="mb-3">
            <label>Change Image (optional)</label>
            <input type="file" name="courseImage" class="form-control" />
        </div>

        <button type="submit" class="btn btn-primary">Save Changes</button>
        <a href="/adminHome" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
