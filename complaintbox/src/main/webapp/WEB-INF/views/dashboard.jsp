<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Complaint Box</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>

    <div class="d-flex min-vh-100">

        <!-- ====== LEFT SIDEBAR ====== -->
        <nav class="d-flex flex-column text-white p-0" style="width: 260px; min-height: 100vh; background-color: #1a2332;">
            <!-- Brand -->
            <div class="p-4 border-bottom" style="border-color: rgba(255,255,255,0.1) !important;">
                <a href="/" class="text-white text-decoration-none">
                    <h4 class="fw-bold mb-0">
                        <i class="bi bi-envelope-exclamation-fill me-2"></i>Complaint Box
                    </h4>
                </a>
            </div>

            <!-- Nav Links -->
            <div class="p-3 flex-grow-1">
                <ul class="nav flex-column gap-1">
                    <li class="nav-item">
                        <a href="/dashboard?section=dashboard"
                           class="nav-link sidebar-link rounded-3 px-3 py-3 ${section == 'dashboard' ? 'active' : ''}">
                            <i class="bi bi-grid-1x2-fill me-2"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/dashboard?section=complaints"
                           class="nav-link sidebar-link rounded-3 px-3 py-3 ${section == 'complaints' ? 'active' : ''}">
                            <i class="bi bi-chat-left-text-fill me-2"></i>My Complaints
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/dashboard?section=new-complaint"
                           class="nav-link sidebar-link rounded-3 px-3 py-3 ${section == 'new-complaint' ? 'active' : ''}">
                            <i class="bi bi-plus-circle-fill me-2"></i>File New Complaint
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/dashboard?section=profile"
                           class="nav-link sidebar-link rounded-3 px-3 py-3 ${section == 'profile' ? 'active' : ''}">
                            <i class="bi bi-gear-fill me-2"></i>Profile Settings
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Logout -->
            <div class="p-3 border-top" style="border-color: rgba(255,255,255,0.1) !important;">
                <a href="/logout" class="nav-link sidebar-link rounded-3 px-3 py-3 text-white">
                    <i class="bi bi-box-arrow-left me-2"></i>Logout
                </a>
            </div>
        </nav>

        <!-- ====== MAIN CONTENT ====== -->
        <div class="flex-grow-1 d-flex flex-column" style="background-color: #f0f2f5;">

            <!-- Top Header Bar -->
            <header class="bg-white shadow-sm py-3 px-4 d-flex align-items-center justify-content-between">
                <h5 class="fw-bold mb-0 text-capitalize">${section}</h5>
                <div class="d-flex align-items-center gap-3">
                    <span class="fw-semibold text-dark">${user.name}</span>
                    <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold"
                         style="width: 40px; height: 40px; background-color: #1a3a5c; font-size: 16px;">
                        ${user.name.substring(0, 1).toUpperCase()}
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

                <!-- ===== DASHBOARD HOME ===== -->
                <c:if test="${section == 'dashboard'}">
                    <div class="mb-4">
                        <h3 class="fw-bold">Welcome back, ${user.name}!</h3>
                        <p class="text-muted">Here is an overview of your complaint activity.</p>
                    </div>

                    <!-- Stats Cards -->
                    <div class="row g-4 mb-4">
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm rounded-4 p-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center"
                                         style="width: 50px; height: 50px; background-color: #e8f0fe;">
                                        <i class="bi bi-chat-left-text-fill fs-4" style="color: #2d6a9f;"></i>
                                    </div>
                                    <div>
                                        <p class="text-muted mb-0 small">Total Complaints</p>
                                        <h3 class="fw-bold mb-0">${totalComplaints}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm rounded-4 p-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center"
                                         style="width: 50px; height: 50px; background-color: #fff3e0;">
                                        <i class="bi bi-hourglass-split fs-4" style="color: #e67e22;"></i>
                                    </div>
                                    <div>
                                        <p class="text-muted mb-0 small">Pending</p>
                                        <h3 class="fw-bold mb-0">${pendingComplaints}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm rounded-4 p-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-circle d-flex align-items-center justify-content-center"
                                         style="width: 50px; height: 50px; background-color: #e8f5e9;">
                                        <i class="bi bi-check-circle-fill fs-4" style="color: #27ae60;"></i>
                                    </div>
                                    <div>
                                        <p class="text-muted mb-0 small">Resolved</p>
                                        <h3 class="fw-bold mb-0">${resolvedComplaints}</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Action -->
                    <div class="card border-0 shadow-sm rounded-4 p-4">
                        <h5 class="fw-bold mb-3">Quick Actions</h5>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="/dashboard?section=new-complaint" class="btn text-white fw-semibold px-4"
                               style="background-color: #2d6a9f;">
                                <i class="bi bi-plus-circle me-2"></i>File New Complaint
                            </a>
                            <a href="/dashboard?section=complaints" class="btn btn-outline-secondary fw-semibold px-4">
                                <i class="bi bi-eye me-2"></i>View All Complaints
                            </a>
                        </div>
                    </div>
                </c:if>

                <!-- ===== MY COMPLAINTS ===== -->
                <c:if test="${section == 'complaints'}">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="fw-bold mb-0">My Complaints</h3>
                        <a href="/dashboard?section=new-complaint" class="btn text-white fw-semibold"
                           style="background-color: #2d6a9f;">
                            <i class="bi bi-plus-circle me-2"></i>New Complaint
                        </a>
                    </div>

                    <c:choose>
                        <c:when test="${empty complaints}">
                            <div class="card border-0 shadow-sm rounded-4 p-5 text-center">
                                <i class="bi bi-inbox fs-1 text-muted"></i>
                                <h5 class="fw-bold mt-3">No Complaints Yet</h5>
                                <p class="text-muted">You have not filed any complaints. Click the button above to file one.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0 align-middle">
                                        <thead style="background-color: #1a3a5c; color: white;">
                                            <tr>
                                                <th class="py-3 px-4">#</th>
                                                <th class="py-3">Category</th>
                                                <th class="py-3">Subject</th>
                                                <th class="py-3">Description</th>
                                                <th class="py-3">Status</th>
                                                <th class="py-3">Admin Reply</th>
                                                <th class="py-3">Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="complaint" items="${complaints}" varStatus="loop">
                                                <tr>
                                                    <td class="px-4 fw-semibold">${loop.index + 1}</td>
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
                                                    <td style="max-width: 220px;">
                                                        <c:choose>
                                                            <c:when test="${not empty complaint.adminReply}">
                                                                <div class="p-2 rounded-3" style="background-color: #e8f5e9; font-size: 0.85rem;">
                                                                    <i class="bi bi-reply-fill me-1" style="color: #27ae60;"></i>
                                                                    <span class="d-inline-block text-truncate" style="max-width: 180px;">
                                                                        ${complaint.adminReply}
                                                                    </span>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="text-muted small fst-italic">No reply yet</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-muted small">
                                                        <fmt:parseDate value="${complaint.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate"/>
                                                        <fmt:formatDate value="${parsedDate}" pattern="dd MMM yyyy"/>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>

                <!-- ===== FILE NEW COMPLAINT ===== -->
                <c:if test="${section == 'new-complaint'}">
                    <h3 class="fw-bold mb-4">File New Complaint</h3>
                    <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5" style="max-width: 700px;">
                       
                        <form action="${pageContext.request.contextPath}/dashboard/file-complaint"
      method="post"
      enctype="multipart/form-data">
     							 
                            <div class="mb-3">
                                <label for="category" class="form-label fw-semibold">
                                    <i class="bi bi-tag me-1"></i>Category
                                </label>
                                <select class="form-select form-select-lg" id="category" name="category" required>
                                    <option value="" disabled selected>Select a category</option>
                                    <option value="Service Issue">Service Issue</option>
                                    <option value="Product Defect">Product Defect</option>
                                    <option value="Billing Problem">Billing Problem</option>
                                    <option value="Staff Behavior">Staff Behavior</option>
                                    <option value="Infrastructure">Infrastructure</option>
                                    <option value="Cleanliness">Cleanliness</option>
                                    <option value="Safety Concern">Safety Concern</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="subject" class="form-label fw-semibold">
                                    <i class="bi bi-pencil me-1"></i>Subject
                                </label>
                                <input type="text" class="form-control form-control-lg" id="subject"
                                       name="subject" placeholder="Brief subject of your complaint" required>
                            </div>
                            <div class="mb-4">
                                <label for="description" class="form-label fw-semibold">
                                    <i class="bi bi-card-text me-1"></i>Description
                                </label>
                                <textarea class="form-control" id="description" name="description"
                                          rows="6" placeholder="Describe your complaint in detail..." required></textarea>
                               
                               <div class="mb-4">
    								<label class="form-label fw-semibold">
      								  <i class="bi bi-paperclip me-1"></i>
      								  Attach Image / Video
   									 </label>

   									 <input type="file"
      									     class="form-control"
       									    name="file"
         									  accept="image/*,video/*">
								</div>	
                               
                            </div>
                            <button type="submit" class="btn btn-lg fw-semibold text-white px-5"
                                    style="background-color: #1a3a5c;">
                                <i class="bi bi-send me-2"></i>Submit Complaint
                            </button>
                        </form>
                    </div>
                </c:if>

                <!-- ===== PROFILE SETTINGS ===== -->
                <c:if test="${section == 'profile'}">
                    <h3 class="fw-bold mb-4">Profile Settings</h3>
                    <div class="row g-4">
                        <!-- Update Profile Card -->
                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm rounded-4 p-4 h-100">
                                <h5 class="fw-bold mb-3"><i class="bi bi-person-circle me-2"></i>Update Profile</h5>
                               <form action="${pageContext.request.contextPath}/dashboard/update-profile" method="post">
                                    <div class="mb-3">
                                        <label for="profileName" class="form-label fw-semibold">Full Name</label>
                                        <input type="text" class="form-control form-control-lg" id="profileName"
                                               name="name" value="${user.name}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="profileEmail" class="form-label fw-semibold">Email Address</label>
                                        <input type="email" class="form-control form-control-lg" id="profileEmail"
                                               name="email" value="${user.email}" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="profileMobile" class="form-label fw-semibold">Mobile Number</label>
                                        <input type="tel" class="form-control form-control-lg" id="profileMobile"
                                               name="mobileNumber" value="${user.mobileNumber}" required pattern="[0-9]{10}">
                                    </div>
                                    <button type="submit" class="btn fw-semibold text-white px-4"
                                            style="background-color: #2d6a9f;">
                                        <i class="bi bi-check2 me-2"></i>Save Changes
                                    </button>
                                </form>
                            </div>
                        </div>

                        <!-- Change Password Card -->
                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm rounded-4 p-4 h-100">
                                <h5 class="fw-bold mb-3"><i class="bi bi-shield-lock me-2"></i>Change Password</h5>
                               <form action="${pageContext.request.contextPath}/dashboard/change-password" method="post">
                                    <div class="mb-3">
                                        <label for="currentPassword" class="form-label fw-semibold">Current Password</label>
                                        <input type="password" class="form-control form-control-lg" id="currentPassword"
                                               name="currentPassword" placeholder="Enter current password" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="newPassword" class="form-label fw-semibold">New Password</label>
                                        <input type="password" class="form-control form-control-lg" id="newPassword"
                                               name="newPassword" placeholder="Enter new password" required minlength="6">
                                    </div>
                                    <div class="mb-4">
                                        <label for="confirmPassword" class="form-label fw-semibold">Confirm New Password</label>
                                        <input type="password" class="form-control form-control-lg" id="confirmPassword"
                                               placeholder="Confirm new password" required minlength="6">
                                    </div>
                                    <button type="submit" class="btn fw-semibold text-white px-4"
                                            style="background-color: #2d6a9f;"
                                            onclick="return validatePasswordMatch()">
                                        <i class="bi bi-key me-2"></i>Update Password
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
    <script>
        function validatePasswordMatch() {
            var newPass = document.getElementById('newPassword').value;
            var confirmPass = document.getElementById('confirmPassword').value;
            if (newPass !== confirmPass) {
                alert('New password and confirm password do not match!');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
