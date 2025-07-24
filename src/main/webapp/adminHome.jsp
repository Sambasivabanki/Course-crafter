<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<jsp:include page="adminNavbar.jsp"></jsp:include>

<div class="container mt-4">
    <h1 class="mb-4">Welcome Admin</h1>
	<h3>Available Courses</h3>
<div class="row">
  <c:forEach var="course" items="${courses}">
    <div class="col-md-4 mb-4">
      <div class="card h-100 shadow-sm">
        <img src="/images/courses/${course.imageName}" class="card-img-top" alt="Course Image" style="height: 200px; object-fit: cover;">
        <div class="card-body">
          <h5 class="card-title">${course.courseName}</h5>
          <p class="card-text">${course.description}</p>
        </div>
        <div class="card-footer d-flex justify-content-between align-items-center">
          <div>
            <small class="text-muted d-block">Start Date: ${course.startDate}</small>
            <small class="text-muted d-block">Price: ₹${course.price}</small>
          </div>
          
          <form action="/admin/updateCourse" method="post" class="d-inline">
		    <input type="hidden" name="courseId" value="${course.courseId}" />
		    <input type="hidden" name="courseName" value="${course.courseName}" />
		    <input type="hidden" name="description" value="${course.description}" />
		    <input type="hidden" name="startDate" value="${course.startDate}" />
		    <input type="hidden" name="price" value="${course.price}" />
		    <input type="hidden" name="imageName" value="${course.imageName}" />
		    <button type="submit" class="btn btn-warning btn-sm">Update</button>
		</form>
          
          
          <form action="/deleteCourse" method="post" onsubmit="return confirm('Are you sure you want to delete this course?');">
            <input type="hidden" name="courseId" value="${course.courseId}" />
            <button type="submit" class="btn btn-danger btn-sm mt-2">Delete Course</button>
          </form>
        </div>
      </div>
    </div>
  </c:forEach>
</div>
    
</body>
</html>
