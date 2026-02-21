<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Box - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    <%@ include file="header.jsp" %>

    <!-- Hero Section -->
    <section class="hero-section text-white text-center d-flex align-items-center" style="background: linear-gradient(135deg, #1a3a5c 0%, #2d6a9f 100%); min-height: 520px;">
        <div class="container py-5">
            <h1 class="display-3 fw-bold mb-3">Your Voice Matters</h1>
            <p class="lead fs-4 mb-4 mx-auto" style="max-width: 650px; opacity: 0.9;">
                A transparent and efficient platform to register, track, and resolve your complaints quickly.
            </p>
            <div class="d-flex justify-content-center gap-3 flex-wrap">
                <a href="/auth?tab=signup" class="btn btn-light btn-lg px-5 fw-semibold shadow">
                    <i class="bi bi-person-plus me-2"></i>Get Started
                </a>
                <a href="/auth?tab=login" class="btn btn-outline-light btn-lg px-5 fw-semibold">
                    <i class="bi bi-box-arrow-in-right me-2"></i>Login
                </a>
            </div>
        </div>
    </section>

    <!-- How It Works -->
    <section class="py-5" style="background-color: #f8f9fa;">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-6 fw-bold text-dark">How It Works</h2>
                <p class="text-muted fs-5">Simple steps to register and track your complaints</p>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="card h-100 border-0 shadow-sm text-center p-4 feature-card">
                        <div class="feature-icon mx-auto mb-3">
                            <i class="bi bi-person-plus fs-1" style="color: #2d6a9f;"></i>
                        </div>
                        <h5 class="fw-bold">1. Create Account</h5>
                        <p class="text-muted">Sign up with your name, email, and mobile number to get started.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card h-100 border-0 shadow-sm text-center p-4 feature-card">
                        <div class="feature-icon mx-auto mb-3">
                            <i class="bi bi-pencil-square fs-1" style="color: #2d6a9f;"></i>
                        </div>
                        <h5 class="fw-bold">2. File Complaint</h5>
                        <p class="text-muted">Select a category and describe your issue in detail.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card h-100 border-0 shadow-sm text-center p-4 feature-card">
                        <div class="feature-icon mx-auto mb-3">
                            <i class="bi bi-graph-up fs-1" style="color: #2d6a9f;"></i>
                        </div>
                        <h5 class="fw-bold">3. Track Status</h5>
                        <p class="text-muted">Monitor the progress of your complaints in real-time.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card h-100 border-0 shadow-sm text-center p-4 feature-card">
                        <div class="feature-icon mx-auto mb-3">
                            <i class="bi bi-check-circle fs-1" style="color: #2d6a9f;"></i>
                        </div>
                        <h5 class="fw-bold">4. Get Resolved</h5>
                        <p class="text-muted">Receive timely resolution and notifications on your complaints.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="py-5 text-white" style="background-color: #1a3a5c;">
        <div class="container">
            <div class="row text-center g-4">
                <div class="col-md-4">
                    <h2 class="display-4 fw-bold">500+</h2>
                    <p class="fs-5 opacity-75">Complaints Resolved</p>
                </div>
                <div class="col-md-4">
                    <h2 class="display-4 fw-bold">200+</h2>
                    <p class="fs-5 opacity-75">Registered Users</p>
                </div>
                <div class="col-md-4">
                    <h2 class="display-4 fw-bold">95%</h2>
                    <p class="fs-5 opacity-75">Satisfaction Rate</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="py-5" style="background-color: #f8f9fa;">
        <div class="container text-center">
            <h2 class="display-6 fw-bold text-dark mb-3">Ready to File a Complaint?</h2>
            <p class="text-muted fs-5 mb-4">Create your account and start tracking your issues today.</p>
            <a href="/auth?tab=signup" class="btn btn-lg px-5 fw-semibold text-white shadow" style="background-color: #2d6a9f;">
                <i class="bi bi-arrow-right me-2"></i>Register Now
            </a>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
