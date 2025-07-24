<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/adminHome">Admin Panel</a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="adminNavbar">
      <ul class="navbar-nav me-auto mb-2 mb-sm-0">
        <li class="nav-item">
          <a class="nav-link" href="/addcourse">Add Courses</a>
        </li>
        
        <li class="nav-item">
    		<a class="nav-link" href="/enrolledStudents">Enrolled Students</a>
		</li>
		<li class="nav-item">
    		<a class="nav-link" href="/admin/enquiries">View Enquiries</a>
		</li>
		
		<li class="nav-item">
    		<a  class="nav-link" href="/admin/paidStudents">View Paid Students</a>
		</li>
		
      </ul>

      <ul class="navbar-nav ms-auto">
        <c:if test="${not empty sessionScope.email}">
          <li class="nav-item">
            <span class="navbar-text text-white me-3">
              Logged in as: <strong>${sessionScope.email}</strong>
            </span>
          </li>
          <li class="nav-item">
            <a class="btn btn-outline-light btn-sm" href="/logout">Logout</a>
          </li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>
