<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Enrolled Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="adminNavbar.jsp" />

<div class="container mt-4">
    <h3>Enrolled Students</h3>
    <table class="table table-bordered table-striped mt-3">
        <thead class="table-dark">
            <tr>
            	 <th>ID</th>
                <th>Student Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Course Name</th>
                <th>Fee Paid</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                	<td>${student.id}</td>
                    <td>${student.studentName}</td>
                    <td>${student.email}</td>
                    <td>${student.phone}</td>
                    <td>${student.courses.courseName}</td>
                    <td>₹${student.feepaid}</td>
                    <td>
                    	<a href="/admin/editStudent/${student.id}" class="btn btn-sm btn-warning">Edit</a>
                    	<a href="/admin/deleteStudent/${student.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
