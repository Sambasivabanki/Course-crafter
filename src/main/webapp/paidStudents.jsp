<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Paid Students</title>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="adminNavbar.jsp" />
<h2>All Paid Students</h2>
<table border="1">
    <tr>
        <th>Student Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Course</th>
        <th>Amount</th>
        <th>Payment ID</th>
        <th>Order ID</th>
        <th>Status</th>
        <th>Date</th>
    </tr>
    <c:forEach var="payment" items="${payments}">
        <tr>
            <td>${payment.student.studentName}</td>
            <td>${payment.student.email}</td>
            <td>${payment.student.phone}</td>
            <td>${payment.student.courses.courseName}</td>
            <td>₹${payment.amount}</td>
            <td>${payment.razorpayPaymentId}</td>
            <td>${payment.razorpayOrderId}</td>
            <td>${payment.status}</td>
            <td>${payment.paymentDate}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
