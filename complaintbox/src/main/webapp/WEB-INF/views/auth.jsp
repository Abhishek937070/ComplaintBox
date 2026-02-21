	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Box - Login / Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100" style="background-color: #f0f2f5;">

    <!-- Header -->
    <%@ include file="header.jsp" %>

    <!-- Auth Section -->
    <main class="flex-grow-1 d-flex align-items-center justify-content-center py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow-lg border-0 rounded-4 overflow-hidden">

                        <!-- Tab Buttons -->
                        <div class="d-flex border-bottom">
                            <a href="/auth?tab=login"
                               class="flex-fill text-center py-3 fw-semibold text-decoration-none auth-tab ${activeTab == 'login' ? 'active' : ''}">
                                <i class="bi bi-box-arrow-in-right me-1"></i>Login
                            </a>
                            <a href="/auth?tab=signup"
                               class="flex-fill text-center py-3 fw-semibold text-decoration-none auth-tab ${activeTab == 'signup' ? 'active' : ''}">
                                <i class="bi bi-person-plus me-1"></i>Sign Up
                            </a>
                            <a href="/auth?tab=admin"
                               class="flex-fill text-center py-3 fw-semibold text-decoration-none auth-tab ${activeTab == 'admin' ? 'active' : ''}">
                                <i class="bi bi-shield-lock me-1"></i>Admin
                            </a>
                        </div>

                        <div class="card-body p-4 p-md-5">

                            <!-- Success / Error Messages -->
                            <c:if test="${not empty successMsg}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <i class="bi bi-check-circle me-2"></i>${successMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                            </c:if>
                            <c:if test="${not empty errorMsg}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <i class="bi bi-exclamation-triangle me-2"></i>${errorMsg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                            </c:if>

                            <!-- ===== LOGIN FORM ===== -->
                            <c:if test="${activeTab == 'login'}">
                                <h4 class="fw-bold mb-1">Welcome Back</h4>
                                <p class="text-muted mb-4">Enter your credentials to access your account</p>
                                <form action="/login" method="post">
                                    <div class="mb-3">
                                        <label for="emailOrMobile" class="form-label fw-semibold">
                                            <i class="bi bi-person me-1"></i>Email or Mobile Number
                                        </label>
                                        <input type="text" class="form-control form-control-lg" id="emailOrMobile"
                                               name="emailOrMobile" placeholder="Enter email or mobile" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="loginPassword" class="form-label fw-semibold">
                                            <i class="bi bi-lock me-1"></i>Password
                                        </label>
                                        <input type="password" class="form-control form-control-lg" id="loginPassword"
                                               name="password" placeholder="Enter your password" required>
                                    </div>
                                    <button type="submit" class="btn btn-lg w-100 fw-semibold text-white"
                                            style="background-color: #1a3a5c;">
                                        <i class="bi bi-box-arrow-in-right me-2"></i>Login
                                    </button>
                                    <p class="text-center mt-3 text-muted">
                                        Don't have an account?
                                        <a href="/auth?tab=signup" class="fw-semibold" style="color: #2d6a9f;">Sign Up</a>
                                    </p>
                                </form>
                            </c:if>

                            <!-- ===== SIGNUP FORM ===== -->
                            <c:if test="${activeTab == 'signup'}">
                                <h4 class="fw-bold mb-1">Create Account</h4>
                                <p class="text-muted mb-4">Fill in your details to register</p>
                                <form action="/signup" method="post">
                                    <div class="mb-3">
                                        <label for="name" class="form-label fw-semibold">
                                            <i class="bi bi-person me-1"></i>Full Name
                                        </label>
                                        <input type="text" class="form-control form-control-lg" id="name"
                                               name="name" placeholder="Enter your full name" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label fw-semibold">
                                            <i class="bi bi-envelope me-1"></i>Email Address
                                        </label>
                                        <input type="email" class="form-control form-control-lg" id="email"
                                               name="email" placeholder="Enter your email" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="mobileNumber" class="form-label fw-semibold">
                                            <i class="bi bi-phone me-1"></i>Mobile Number
                                        </label>
                                        <input type="tel" class="form-control form-control-lg" id="mobileNumber"
                                               name="mobileNumber" placeholder="Enter your mobile number" required
                                               pattern="[0-9]{10}" title="Enter a valid 10-digit mobile number">
                                    </div>
                                    <div class="mb-4">
                                        <label for="signupPassword" class="form-label fw-semibold">
                                            <i class="bi bi-lock me-1"></i>Password
                                        </label>
                                        <input type="password" class="form-control form-control-lg" id="signupPassword"
                                               name="password" placeholder="Create a password" required minlength="6">
                                    </div>
                                    <button type="submit" class="btn btn-lg w-100 fw-semibold text-white"
                                            style="background-color: #1a3a5c;">
                                        <i class="bi bi-person-plus me-2"></i>Create Account
                                    </button>
                                    <p class="text-center mt-3 text-muted">
                                        Already have an account?
                                        <a href="/auth?tab=login" class="fw-semibold" style="color: #2d6a9f;">Login</a>
                                    </p>
                                </form>
                            </c:if>

                            <!-- ===== ADMIN LOGIN FORM ===== -->
                            <c:if test="${activeTab == 'admin'}">
                                <div class="text-center mb-4">
                                    <div class="d-inline-flex align-items-center justify-content-center rounded-circle mb-3"
                                         style="width: 70px; height: 70px; background-color: #e8f0fe;">
                                        <i class="bi bi-shield-lock-fill fs-1" style="color: #1a3a5c;"></i>
                                    </div>
                                    <h4 class="fw-bold mb-1">Admin Login</h4>
                                    <p class="text-muted">Enter your admin credentials to access the admin panel</p>
                                </div>
                                <form action="/admin-login" method="post">
                                    <div class="mb-3">
                                        <label for="adminEmail" class="form-label fw-semibold">
                                            <i class="bi bi-envelope-at me-1"></i>Admin Login ID
                                        </label>
                                        <input type="text" class="form-control form-control-lg" id="adminEmail"
                                               name="adminEmail" placeholder="Enter Admin Login ID" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="adminPassword" class="form-label fw-semibold">
                                            <i class="bi bi-key me-1"></i>Admin Password
                                        </label>
                                        <input type="password" class="form-control form-control-lg" id="adminPassword"
                                               name="adminPassword" placeholder="Enter Admin Password" required>
                                    </div>
                                    <button type="submit" class="btn btn-lg w-100 fw-semibold text-white"
                                            style="background-color: #c0392b;">
                                        <i class="bi bi-shield-check me-2"></i>Admin Login
                                    </button>
                                    <p class="text-center mt-3 text-muted">
                                        Are you a user?
                                        <a href="/auth?tab=login" class="fw-semibold" style="color: #2d6a9f;">User Login</a>
                                    </p>
                                </form>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
