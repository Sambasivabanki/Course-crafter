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
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-6">
			<img alt="no-img" src="images/student2.jpg" class="img-thumbnail">
		</div>
		<div class="col-sm-6">
			<h1>Register Page</h1>
			<form action="register" method="post">
				<div class="mb-3">
					<input type="email" value="${updateUser.getEmail()}" name="email" placeholder="Email" class="form-control" required>
				</div>
				<div class="mb-3">
					<input type="password" value="${updateUser.getPassword()}" name="password" placeholder="Password" class="form-control" required>
				</div>
				<div class="mb-3">
					<input type="tel" value="${updateUser.getPhone()}" name="phone" placeholder="Phone" class="form-control" required>
				</div>
				<div class="mb-3">
					<input type="text" value="${updateUser.getFullname()}" name="fullname" placeholder="Fullname" class="form-control" required>
				</div>
				<div class="mb-3">
    				<input type="radio" name="gender" value="male"
        			<c:if test="${updateUser.gender == 'male'}">checked</c:if>> Male
    				<input type="radio" name="gender" value="female"
        			<c:if test="${updateUser.gender == 'female'}">checked</c:if>> Female
				</div>

				<div class="mb-3">
					<button type="submit" class="btn btn-outline-primary">SignUp</button>
					<button type="reset" class="btn btn-outline-danger">Reset</button>
				</div>
				<div>
				<h3>${msg}</h3>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>