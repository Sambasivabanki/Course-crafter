<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
        body {
            background-image: url('/images/a.jpg'); /* ✅ Use your custom image here */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .form-title {
            font-weight: bold;
            text-align: center;
            margin-bottom: 25px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
        }

    </style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>

<div class="login-card">
        <h3 class="form-title text-primary">Admin Login</h3>

        <form action="/doLogin" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email ID</label>
                <input type="email" name="email" class="form-control" required placeholder="Enter admin email">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required placeholder="Enter password">
            </div>

            <div class="btn-group mt-4">
                <button type="submit" class="btn btn-success">Login</button>
                <button type="reset" class="btn btn-warning">Reset</button>
                <a href="/" class="btn btn-secondary">Return Home</a>
            </div>
        </form>

        <%-- <!-- Optional error message display -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger mt-3">${error}</div>
        </c:if> --%>
        <p>${error}</p>
    </div>
</body>
</html>