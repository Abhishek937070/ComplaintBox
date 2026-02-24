<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Complaint Box</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>

    <div class="d-flex min-vh-100">

        <!-- ====== LEFT SIDEBAR ====== -->
        <nav class="d-flex flex-column text-white p-0" style="width: 260px; min-height: 100vh; background-color: #2c1810;">
            <!-- Brand -->
            <div class="p-4 border-bottom" style="border-color: rgba(255,255,255,0.1) !important;">
                <a href="/admin/dashboard" class="text-white text-decoration-none">
                    <h4 class="fw-bold mb-0">
                        <i class="bi bi-shield-lock-fill me-2"></i>Admin Panel
                    </h4>
                </a>
                <small class="text-white-50">Complaint Box</small>
            </div>

            <!-- Nav Links -->
            <div class="p-3 flex-grow-1">
                <ul class="nav flex-column gap-1">
                    <li class="nav-item">
                        <a href="/admin/dashboard?section=dashboard"
                           class="nav-link admin-sidebar-link rounded-3 px-3 py-3 ${section == 'dashboard' ? 'active' : ''}">
                            <i class="bi bi-grid-1x2-fill me-2"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/dashboard?section=complaints"
                           class="nav-link admin-sidebar-link rounded-3 px-3 py-3 ${section == 'complaints' ? 'active' : ''}">
                            <i class="bi bi-chat-left-text-fill me-2"></i>All Complaints
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Logout -->
            <div class="p-3 border-top" style="border-color: rgba(255,255,255,0.1) !important;">
                <a href="/admin/logout" class="nav-link admin-sidebar-link rounded-3 px-3 py-3 text-white">
                    <i class="bi bi-box-arrow-left me-2"></i>Logout
                </a>
            </div>
        </nav>

        <!-- ====== MAIN CONTENT ====== -->
        <div class="flex-grow-1 d-flex flex-column" style="background-color: #f0f2f5;">

            <!-- Top Header Bar -->
            <header class="bg-white shadow-sm py-3 px-4 d-flex align-items-center justify-content-between">
                <h5 class="fw-bold mb-0 text-capitalize">
                    <c:choose>
                        <c:when test="${section == 'resolve'}">Resolve Complaint</c:when>
                        <c:otherwise>${section}</c:otherwise>
                    </c:choose>
                </h5>
                <div class="d-flex align-items-center gap-3">
                    <span class="badge rounded-pill text-white px-3 py-2" style="background-color: #c0392b;">
                        <i class="bi bi-shield-fill me-1"></i>Administrator
                    </span>
                    <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold"
                         style="width: 40px; height: 40px; background-color: #c0392b; font-size: 16px;">
                        A
                    </div>
                </div>
            </header>

            <!-- Content Area -->
            <main class="flex-grow-1 p-4">

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

                <!-- ===== ADMIN DASHBOARD HOME ===== -->
                <c:if test="${section == 'dashboard'}">
                    <div class="mb-4">
                        <h3 class="fw-bold">Admin Dashboard</h3>
                        <p class="text-muted">Overview of all complaint activity across the system.</p>
                    </div>

                    <!-- Stats Cards -->
                    <div class="row g-4 mb-4">
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm rounded-4 p-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center"
                                         style="width: 55px; height: 55px; background-color: #e8f0fe;">
                                        <i class="bi bi-chat-left-text-fill fs-3" style="color: #2d6a9f;"></i>
                                    </div>
                                    <div>
                                        <p class="text-muted mb-0 small">Total Complaints</p>
                                        <h2 class="fw-bold mb-0">${totalComplaints}</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm rounded-4 p-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center"
                                         style="width: 55px; height: 55px; background-color: #fff3e0;">
                                        <i class="bi bi-hourglass-split fs-3" style="color: #e67e22;"></i>
                                    </div>
                                    <div>
                                        <p class="text-muted mb-0 small">Pending Complaints</p>
                                        <h2 class="fw-bold mb-0">${pendingComplaints}</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm rounded-4 p-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center"
                                         style="width: 55px; height: 55px; background-color: #e8f5e9;">
                                        <i class="bi bi-check-circle-fill fs-3" style="color: #27ae60;"></i>
                                    </div>
                                    <div>
                                        <p class="text-muted mb-0 small">Resolved Complaints</p>
                                        <h2 class="fw-bold mb-0">${resolvedComplaints}</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="card border-0 shadow-sm rounded-4 p-4">
                        <h5 class="fw-bold mb-3">Quick Actions</h5>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="/admin/dashboard?section=complaints" class="btn text-white fw-semibold px-4"
                               style="background-color: #c0392b;">
                                <i class="bi bi-list-ul me-2"></i>View All Complaints
                            </a>
                        </div>
                    </div>
                </c:if>

                <!-- ===== ALL COMPLAINTS WITH SEARCH ===== -->
                <c:if test="${section == 'complaints'}">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="fw-bold mb-0">All Complaints</h3>
                    </div>

                    <!-- Search Bar -->
                    <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                        <h6 class="fw-bold mb-3"><i class="bi bi-search me-2"></i>Search Complaints</h6>
                        <form action="/admin/dashboard" method="get" class="row g-3 align-items-end">
                            <input type="hidden" name="section" value="complaints">
                            <div class="col-md-3">
                                <label for="searchName" class="form-label fw-semibold small">By User Name</label>
                                <input type="text" class="form-control" id="searchName" name="searchName"
                                       placeholder="Enter name..." value="${searchName}">
                            </div>
                            <div class="col-md-3">
                                <label for="searchSubject" class="form-label fw-semibold small">By Subject</label>
                                <input type="text" class="form-control" id="searchSubject" name="searchSubject"
                                       placeholder="Enter subject..." value="${searchSubject}">
                            </div>
                            <div class="col-md-3">
                                <label for="searchCategory" class="form-label fw-semibold small">By Category</label>
                                <select class="form-select" id="searchCategory" name="searchCategory">
                                    <option value="">All Categories</option>
                                    <option value="Service Issue" ${searchCategory == 'Service Issue' ? 'selected' : ''}>Service Issue</option>
                                    <option value="Product Defect" ${searchCategory == 'Product Defect' ? 'selected' : ''}>Product Defect</option>
                                    <option value="Billing Problem" ${searchCategory == 'Billing Problem' ? 'selected' : ''}>Billing Problem</option>
                                    <option value="Staff Behavior" ${searchCategory == 'Staff Behavior' ? 'selected' : ''}>Staff Behavior</option>
                                    <option value="Infrastructure" ${searchCategory == 'Infrastructure' ? 'selected' : ''}>Infrastructure</option>
                                    <option value="Cleanliness" ${searchCategory == 'Cleanliness' ? 'selected' : ''}>Cleanliness</option>
                                    <option value="Safety Concern" ${searchCategory == 'Safety Concern' ? 'selected' : ''}>Safety Concern</option>
                                    <option value="Other" ${searchCategory == 'Other' ? 'selected' : ''}>Other</option>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex gap-2">
                                <button type="submit" class="btn text-white fw-semibold px-4"
                                        style="background-color: #c0392b;">
                                    <i class="bi bi-search me-1"></i>Search
                                </button>
                                <a href="/admin/dashboard?section=complaints" class="btn btn-outline-secondary fw-semibold px-3">
                                    <i class="bi bi-x-lg me-1"></i>Clear
                                </a>
                            </div>
                        </form>
                    </div>

                    <!-- Complaints Table -->
                    <c:choose>
                        <c:when test="${empty complaints}">
                            <div class="card border-0 shadow-sm rounded-4 p-5 text-center">
                                <i class="bi bi-inbox fs-1 text-muted"></i>
                                <h5 class="fw-bold mt-3">No Complaints Found</h5>
                                <p class="text-muted">No complaints match your search criteria.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0 align-middle">
                                        <thead style="background-color: #2c1810; color: white;">
                                            <tr>
                                                <th class="py-3 px-4">#</th>
                                                <th class="py-3">User Name</th>
                                                <th class="py-3">Category</th>
                                                <th class="py-3">Subject</th>
                                                <th class="py-3">Description</th>
                                                <th class="py-3">Status</th>
                                                <th class="py-3">Date</th>
                                                <th class="py-3 text-center">Media</th>
                                                <th class="py-3 text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="complaint" items="${complaints}" varStatus="loop">
                                                <tr>
                                                    <td class="px-4 fw-semibold">${loop.index + 1}</td>
                                                    <td class="fw-semibold">${complaint.user.name}</td>
                                                    <td>
                                                        <span class="badge rounded-pill" style="background-color: #e8f0fe; color: #2d6a9f;">
                                                            ${complaint.category}
                                                        </span>
                                                    </td>
                                                    <td class="fw-semibold">${complaint.subject}</td>
                                                    <td class="text-muted" style="max-width: 200px;">
                                                        <span class="d-inline-block text-truncate" style="max-width: 180px;">
                                                            ${complaint.description}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${complaint.status == 'Pending'}">
                                                                <span class="badge bg-warning text-dark rounded-pill px-3">Pending</span>
                                                            </c:when>
                                                            <c:when test="${complaint.status == 'In Progress'}">
                                                                <span class="badge bg-info text-dark rounded-pill px-3">In Progress</span>
                                                            </c:when>
                                                            <c:when test="${complaint.status == 'Resolved'}">
                                                                <span class="badge bg-success rounded-pill px-3">Resolved</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-secondary rounded-pill px-3">${complaint.status}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-muted small">
                                                        <fmt:parseDate value="${complaint.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate"/>
                                                        <fmt:formatDate value="${parsedDate}" pattern="dd MMM yyyy"/>
                                                    </td>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    <tr>

<td class="px-4 fw-semibold">${loop.index + 1}</td>

<td class="fw-semibold">${complaint.user.name}</td>

<td>
    <span class="badge rounded-pill"
          style="background-color:#e8f0fe;color:#2d6a9f;">
        ${complaint.category}
    </span>
</td>

<td class="fw-semibold">${complaint.subject}</td>

<td class="text-muted" style="max-width:200px;">
    <span class="d-inline-block text-truncate"
          style="max-width:180px;">
        ${complaint.description}
    </span>
</td>

<td>
<c:choose>
    <c:when test="${complaint.status=='Pending'}">
        <span class="badge bg-warning text-dark">Pending</span>
    </c:when>
    <c:when test="${complaint.status=='In Progress'}">
        <span class="badge bg-info text-dark">In Progress</span>
    </c:when>
    <c:when test="${complaint.status=='Resolved'}">
        <span class="badge bg-success">Resolved</span>
    </c:when>
</c:choose>
</td>

<td class="text-muted small">
    <fmt:parseDate value="${complaint.createdAt}"
                   pattern="yyyy-MM-dd'T'HH:mm"
                   var="parsedDate"/>
    <fmt:formatDate value="${parsedDate}"
                    pattern="dd MMM yyyy"/>
</td>

<!-- ✅ MEDIA COLUMN -->
<td class="text-center">

<c:choose>

<c:when test="${not empty complaint.attachment}">

<!-- IMAGE PREVIEW -->
<c:if test="${complaint.attachment.endsWith('.jpg')
          || complaint.attachment.endsWith('.png')
          || complaint.attachment.endsWith('.jpeg')
          || complaint.attachment.endsWith('.gif')}">

<img src="/uploads/${complaint.attachment}"
     width="70"
     height="60"
     style="object-fit:cover;
            border-radius:8px;
            cursor:pointer;"
     onclick="window.open(this.src)">
</c:if>

<!-- VIDEO PREVIEW -->
<c:if test="${complaint.attachment.endsWith('.mp4')
          || complaint.attachment.endsWith('.webm')
          || complaint.attachment.endsWith('.mov')}">

<video width="90" height="60" controls>
    <source src="/uploads/${complaint.attachment}">
</video>

</c:if>

</c:when>

<c:otherwise>
    <span class="text-muted">No Media</span>
</c:otherwise>

</c:choose>

</td>

<!-- ✅ ACTION COLUMN -->
<td class="text-center">
    <a href="/admin/resolve/${complaint.id}"
       class="btn btn-sm fw-semibold text-white"
       style="background-color:#c0392b;">
        <i class="bi bi-reply-fill me-1"></i>Resolve
    </a>
</td>

</tr>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>

                <!-- ===== RESOLVE COMPLAINT ===== -->
                <c:if test="${section == 'resolve'}">
                    <a href="/admin/dashboard?section=complaints" class="btn btn-outline-secondary fw-semibold mb-4">
                        <i class="bi bi-arrow-left me-2"></i>Back to All Complaints
                    </a>

                    <div class="row g-4">
                        <!-- Complaint Details Card -->
                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm rounded-4 p-4 h-100">
                                <h5 class="fw-bold mb-4"><i class="bi bi-info-circle me-2"></i>Complaint Details</h5>
                                <div class="mb-3">
                                    <label class="form-label text-muted small fw-semibold">Complaint ID</label>
                                    <p class="fw-bold fs-5">#${complaint.id}</p>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted small fw-semibold">Filed By</label>
                                    <p class="fw-semibold">${complaint.user.name}
                                        <span class="text-muted small">(${complaint.user.email})</span>
                                    </p>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted small fw-semibold">Category</label>
                                    <p>
                                        <span class="badge rounded-pill fs-6" style="background-color: #e8f0fe; color: #2d6a9f;">
                                            ${complaint.category}
                                        </span>
                                    </p>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted small fw-semibold">Subject</label>
                                    <p class="fw-semibold">${complaint.subject}</p>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted small fw-semibold">Description</label>
                                    <p class="bg-light rounded-3 p-3">${complaint.description}</p>
                                </div>
                                
                                
                                <div class="mb-3">
<label class="form-label text-muted small fw-semibold">
Attached Media
</label>

<c:choose>

<c:when test="${not empty complaint.attachment}">

<!-- IMAGE -->
<c:if test="${complaint.attachment.endsWith('.jpg')
          || complaint.attachment.endsWith('.png')
          || complaint.attachment.endsWith('.jpeg')
          || complaint.attachment.endsWith('.gif')}">

<img src="/uploads/${complaint.attachment}"
     class="img-fluid rounded"
     style="max-height:300px;">
</c:if>

<!-- VIDEO -->
<c:if test="${complaint.attachment.endsWith('.mp4')
          || complaint.attachment.endsWith('.webm')
          || complaint.attachment.endsWith('.mov')}">

<video width="100%" controls>
<source src="/uploads/${complaint.attachment}">
</video>

</c:if>

</c:when>

<c:otherwise>
<p class="text-muted">No media attached</p>
</c:otherwise>

</c:choose>

</div>
                                
                                
                                
                                
                                <div class="mb-3">
                                    <label class="form-label text-muted small fw-semibold">Current Status</label>
                                    <p>
                                        <c:choose>
                                            <c:when test="${complaint.status == 'Pending'}">
                                                <span class="badge bg-warning text-dark rounded-pill px-3 py-2">Pending</span>
                                            </c:when>
                                            <c:when test="${complaint.status == 'In Progress'}">
                                                <span class="badge bg-info text-dark rounded-pill px-3 py-2">In Progress</span>
                                            </c:when>
                                            <c:when test="${complaint.status == 'Resolved'}">
                                                <span class="badge bg-success rounded-pill px-3 py-2">Resolved</span>
                                            </c:when>
                                        </c:choose>
                                    </p>
                                </div>
                                <div>
                                    <label class="form-label text-muted small fw-semibold">Filed On</label>
                                    <p class="text-muted">
                                        <fmt:parseDate value="${complaint.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate"/>
                                        <fmt:formatDate value="${parsedDate}" pattern="dd MMM yyyy, hh:mm a"/>
                                    </p>
                                </div>
                                <c:if test="${not empty complaint.adminReply}">
                                    <div class="mt-3 p-3 rounded-3" style="background-color: #e8f5e9;">
                                        <label class="form-label fw-semibold small" style="color: #27ae60;">
                                            <i class="bi bi-reply-fill me-1"></i>Previous Admin Reply
                                        </label>
                                        <p class="mb-0">${complaint.adminReply}</p>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Reply / Resolve Form -->
                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm rounded-4 p-4 h-100">
                                <h5 class="fw-bold mb-4"><i class="bi bi-reply me-2"></i>Resolve / Reply</h5>
                                <form action="/admin/resolve" method="post">
                                    <input type="hidden" name="complaintId" value="${complaint.id}">
                                    <div class="mb-3">
                                        <label for="status" class="form-label fw-semibold">
                                            <i class="bi bi-flag me-1"></i>Update Status
                                        </label>
                                        <select class="form-select form-select-lg" id="status" name="status" required>
                                            <option value="Pending" ${complaint.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                            <option value="In Progress" ${complaint.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                            <option value="Resolved" ${complaint.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                                        </select>
                                    </div>
                                    <div class="mb-4">
                                        <label for="adminReply" class="form-label fw-semibold">
                                            <i class="bi bi-chat-dots me-1"></i>Admin Reply
                                        </label>
                                        <textarea class="form-control" id="adminReply" name="adminReply"
                                                  rows="8" placeholder="Write your reply or resolution details here..."
                                                  required>${complaint.adminReply}</textarea>
                                        <div class="form-text">This reply will be visible to the user.</div>
                                    </div>
                                    <button type="submit" class="btn btn-lg fw-semibold text-white px-5"
                                            style="background-color: #c0392b;">
                                        <i class="bi bi-send me-2"></i>Submit Reply
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:if>

            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
