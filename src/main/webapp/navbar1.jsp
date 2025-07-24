<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-sm bg-success">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="#">Logo</a>

        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#mymenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mymenu">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link text-white" href="/alluser">All Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="logout">Logout</a>
                </li>
            </ul>

            <!-- Display admin email on right -->
            <c:if test="${not empty sessionScope.user}">
                <span class="navbar-text text-white me-3">
                    Admin: <strong>${sessionScope.user.email}</strong>
                </span>
            </c:if>
        </div>
    </div>
</nav>
