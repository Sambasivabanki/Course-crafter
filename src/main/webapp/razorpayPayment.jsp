<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Payment Page</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <h2>Proceed to Payment</h2>

    <button id="rzp-button">Pay ₹${student.courses.price}</button>

    <script>
        var options = {
            "key": "${razorpayKey}", // Razorpay key
            "amount": "${student.courses.price * 100}", // in paise
            "currency": "INR",
            "name": "CourseCrafter",
            "description": "Course Payment",
            "handler": function (response){
            	window.location.href = "/payment-success/${student.id}";
            },
            "prefill": {
                "name": "${student.studentName}",
                "email": "${student.email}",
                "contact": "${student.phone}"
            },
            "theme": {
                "color": "#3399cc"
            }
        };
        var rzp1 = new Razorpay(options);
        document.getElementById('rzp-button').onclick = function(e){
            rzp1.open();
            e.preventDefault();
        }
    </script>
</body>
</html>
