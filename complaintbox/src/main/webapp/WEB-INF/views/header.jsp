<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark shadow-sm" style="background-color: #1a3a5c;">
    <div class="container">
        <a class="navbar-brand fw-bold fs-3" href="/" style="letter-spacing: 1px;">
            <i class="bi bi-envelope-exclamation-fill me-2"></i>Complaint Box
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto gap-1">
                <li class="nav-item">
                    <a class="nav-link px-3" href="/">
                        <i class="bi bi-house-door me-1"></i>Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3" href="/auth?tab=login">
                        <i class="bi bi-box-arrow-in-right me-1"></i>Login
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3" href="/auth?tab=admin">
                        <i class="bi bi-shield-lock me-1"></i>Admin Login
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-light btn-sm px-3 py-2 ms-2" href="/auth?tab=signup">
                        <i class="bi bi-person-plus me-1"></i>Sign Up
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
