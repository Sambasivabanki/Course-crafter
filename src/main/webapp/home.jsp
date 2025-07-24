<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home - CourseCrafter</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  

  <style>
    body {
      padding-top: 70px; /* space for fixed navbar */
    }

    section {
      padding: 60px 0;
    }

    #homeSection {
      background: linear-gradient(to right, #e3f2fd, #fff);
    }

    #coursesSection {
      background-color: #f9f9f9;
    }

    #aboutSection {
      background-color: #fffef0;
    }

    #announcementSection {
      background-color: #f1f8e9;
    }

    .card {
      border: none;
      transition: transform 0.3s;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
    }

    .card-img-top {
      height: 200px;
      object-fit: cover;
    }

    .card-footer {
      background-color: #fff;
    }

    .btn-outline-primary {
      border-radius: 20px;
    }
    html {
    scroll-behavior: smooth;
  }
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<!-- 🏠 Home Section -->
<section id="homeSection">
  <div class="container text-center">
    <h1 class="mb-3">Welcome to CourseCrafter</h1>
    <p class="lead">Craft your future with curated online courses.</p>
    <a href="#coursesSection" class="btn btn-primary mt-3">Explore Courses</a>
  </div>
</section>

<!-- ℹ️ About Section -->
<section id="aboutSection">
  <div class="container">
    <h3 class="text-center mb-4">About Us</h3>
    <p class="text-center">We are committed to delivering high-quality educational content to help students achieve their learning goals.</p>
  </div>
</section>


<!-- 📚 Courses Section -->
<section id="coursesSection">
  <div class="container">
    <h3 class="text-center mb-4">✨ Available Courses ✨</h3>
    <div class="row">
      <c:forEach var="course" items="${courses}">
        <div class="col-md-4 mb-4 d-flex">
          <div class="card shadow-sm rounded h-100 d-flex flex-column w-100">
            <img src="/images/courses/${course.imageName}" class="card-img-top" alt="Course Image">
            <div class="card-body">
              <h5 class="card-title text-primary">${course.courseName}</h5>
              <p class="card-text text-muted">${course.description}</p>
            </div>
            <div class="card-footer mt-auto d-flex justify-content-between align-items-center">
              <div>
                <small class="text-muted">Start: ${course.startDate}</small><br>
                <small class="text-muted">Price: ₹${course.price}</small>
              </div>
              <a href="/enroll/${course.courseId}" class="btn btn-outline-primary btn-sm">Enroll</a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>


<!-- 📢 Announcements Section -->
<section id="announcementSection">
  <div class="container">
    <h3 class="text-center mb-4">Latest Announcements</h3>
    <ul>
      <li>🚀 New course on Java Spring Boot launching next week!</li>
      <li>🎓 Scholarship opportunity available for top performers.</li>
      <li>🚀 New batches for Python Full Stack Development starting soon – Enroll now!</li>
      <li>💻 Java Full Stack Development – Fresh batch launching next week! Don’t miss out!</li>
    </ul>
  </div>
</section>

<section class="mt-5 p-4 bg-white shadow rounded" id="contact">
  <h4 class="mb-4 text-center">📞 Contact Us</h4>
  <form action="/submitEnquiry" method="post" class="row g-3">
    <div class="col-md-6">
      <input type="text" name="name" class="form-control" placeholder="Your Name" required />
    </div>
    <div class="col-md-6">
      <input type="email" name="email" class="form-control" placeholder="Your Email" required />
    </div>
    <div class="col-md-6">
      <input type="text" name="phone" class="form-control" placeholder="Phone" />
    </div>
    <div class="col-12">
      <textarea name="message" class="form-control" rows="4" placeholder="Your Message..." required></textarea>
    </div>
    <div class="col-12 text-center">
      <button class="btn btn-success" type="submit">Submit Enquiry</button>
    </div>
  </form>
</section>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="footer.jsp" />

</body>
</html>
