<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Fixed Top Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
  <div class="container-fluid">
    <!-- Brand Logo -->
    <a class="navbar-brand fw-bold" href="/">CourseCrafter</a>

    <!-- Hamburger Button -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar Links -->
    <div class="collapse navbar-collapse" id="navbarMenu">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="#homeSection">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#aboutSection">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#coursesSection">Courses</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#announcementSection">Announcements</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#contact">Contact</a>
        </li>
      </ul>

      <!-- Login Button or User Info -->
      <div class="d-flex align-items-center">
        <c:choose>
          <c:when test="${not empty sessionScope.email}">
            <span class="text-white me-3">Welcome, <strong>${sessionScope.email}</strong></span>
            <a href="/logout" class="btn btn-outline-light btn-sm">Logout</a>
          </c:when>
          <c:otherwise>
            <a href="/loginpage" class="btn btn-primary btn-sm">Login</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</nav>
