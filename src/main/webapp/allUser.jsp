<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="navbar1.jsp"></jsp:include>
<h1>All UsersList</h1>
<table class="table table-striped">
	<thead>
		<th>Email</th>
		<th>Fullname</th>
		<th>Desig</th>
		<th>Phone</th>
		<th>Gender</th>
	</thead>
	<c:forEach var="student" items="${users}">
		<tr>
			<td>${student.email}</td>
			<td>${student.fullname}</td>
			<td>${student.desig}</td>
			<td>${student.phone}</td>
			<td>${student.gender}</td>
			<td><a href="delete?email=${student.getEmail()}">Delete</a></td>
			<td><a href="update?email=${student.getEmail()}">Update</a></td>
		</tr>
	</c:forEach>
</table>
 <!-- Update Form Appears Only If updateUser is Present -->
    <c:if test="${not empty updateUser}">
        <h3 class="mt-5">Update User</h3>
        <form action="updateSuccess" method="post" class="row g-3 mt-3 border p-3 rounded bg-light">
          <div class="col-md-6">
   			 <label>Email</label>
    			<input type="hidden" name="email" value="${updateUser.email}">
    			<input type="text" value="${updateUser.email}" class="form-control" disabled>
		</div>
            <div class="col-md-6">
                <label>Full Name</label>
                <input type="text" name="fullname" value="${updateUser.fullname}" class="form-control">
            </div>
            <div class="col-md-6">
                <label>Designation</label>
                <input type="text" name="desig" value="${updateUser.desig}" class="form-control">
            </div>
            <div class="col-md-6">
                <label>Phone</label>
                <input type="text" name="phone" value="${updateUser.phone}" class="form-control">
            </div>
            <div class="col-md-6">
                <label>Gender</label>
                <input type="text" name="gender" value="${updateUser.gender}" class="form-control">
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-success">Update User</button>
            </div>
        </form>
    </c:if>
</body>
</html>