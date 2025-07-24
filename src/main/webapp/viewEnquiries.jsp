<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Enquiries</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="adminNavbar.jsp" />

<div class="container mt-5">
    <h3 class="mb-4 text-center">📨 User Enquiries</h3>

    <c:if test="${empty enquiries}">
        <div class="alert alert-info text-center">No enquiries found.</div>
    </c:if>

    <c:if test="${not empty enquiries}">
        <table class="table table-bordered table-striped shadow">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Message</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="enquiry" items="${enquiries}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${enquiry.name}</td>
                        <td>${enquiry.email}</td>
                        <td>${enquiry.phone}</td>
                        <td>${enquiry.message}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>
