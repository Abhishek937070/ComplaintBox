package com.abhishek.complaintbox.service;

import com.abhishek.complaintbox.model.User;
import com.abhishek.complaintbox.model.Complaint;
import com.abhishek.complaintbox.repository.UserRepository;
import com.abhishek.complaintbox.repository.ComplaintRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ComplaintRepository complaintRepository;

    // Fixed admin credentials
    private static final String ADMIN_EMAIL = "adminlogin@1234";
    private static final String ADMIN_PASSWORD = "pass@1234";

    // ===== ADMIN METHODS =====

    public boolean adminLogin(String email, String password) {
        return ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password);
    }

    public List<Complaint> getAllComplaints() {
        return complaintRepository.findAllByOrderByCreatedAtDesc();
    }

    public long getTotalComplaintsAll() {
        return complaintRepository.count();
    }

    public long getPendingComplaintsAll() {
        return complaintRepository.countByStatus("Pending");
    }

    public long getResolvedComplaintsAll() {
        return complaintRepository.countByStatus("Resolved");
    }

    public Complaint getComplaintById(Long id) {
        return complaintRepository.findById(id).orElse(null);
    }

    public String resolveComplaint(Long complaintId, String adminReply, String status) {
        Complaint complaint = getComplaintById(complaintId);
        if (complaint == null) return "Complaint not found!";
        complaint.setAdminReply(adminReply);
        complaint.setStatus(status);
        if ("Resolved".equals(status)) {
            complaint.setResolvedAt(LocalDateTime.now());
        }
        complaintRepository.save(complaint);
        return "SUCCESS";
    }

    public List<Complaint> searchComplaints(String name, String subject, String category) {
        // Convert empty strings to null for the query
        String nameParam = (name != null && !name.trim().isEmpty()) ? name.trim() : null;
        String subjectParam = (subject != null && !subject.trim().isEmpty()) ? subject.trim() : null;
        String categoryParam = (category != null && !category.trim().isEmpty()) ? category.trim() : null;
        return complaintRepository.searchComplaints(nameParam, subjectParam, categoryParam);
    }

    // ===== USER METHODS =====

    public String registerUser(String name, String email, String mobileNumber, String password) {
        if (userRepository.existsByEmail(email)) {
            return "Email already registered!";
        }
        if (userRepository.existsByMobileNumber(mobileNumber)) {
            return "Mobile number already registered!";
        }
        User user = new User(name, email, mobileNumber, password);
        userRepository.save(user);
        return "SUCCESS";
    }

    public User loginUser(String emailOrMobile, String password) {
        Optional<User> user = userRepository.findByEmailOrMobileNumber(emailOrMobile, emailOrMobile);
        if (user.isPresent() && user.get().getPassword().equals(password)) {
            return user.get();
        }
        return null;
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public String updateProfile(Long userId, String name, String email, String mobileNumber) {
        User user = getUserById(userId);
        if (user == null) return "User not found!";

        Optional<User> existingEmail = userRepository.findByEmail(email);
        if (existingEmail.isPresent() && !existingEmail.get().getId().equals(userId)) {
            return "Email already taken by another user!";
        }

        Optional<User> existingMobile = userRepository.findByMobileNumber(mobileNumber);
        if (existingMobile.isPresent() && !existingMobile.get().getId().equals(userId)) {
            return "Mobile number already taken by another user!";
        }

        user.setName(name);
        user.setEmail(email);
        user.setMobileNumber(mobileNumber);
        userRepository.save(user);
        return "SUCCESS";
    }

    public String changePassword(Long userId, String currentPassword, String newPassword) {
        User user = getUserById(userId);
        if (user == null) return "User not found!";
        if (!user.getPassword().equals(currentPassword)) {
            return "Current password is incorrect!";
        }
        user.setPassword(newPassword);
        userRepository.save(user);
        return "SUCCESS";
    }

    // ===== COMPLAINT METHODS =====

    public Complaint fileComplaint(String category, String subject, String description, Long userId) {
        User user = getUserById(userId);
        if (user == null) return null;
        Complaint complaint = new Complaint(category, subject, description, user);
        return complaintRepository.save(complaint);
    }

    public List<Complaint> getUserComplaints(User user) {
        return complaintRepository.findByUserOrderByCreatedAtDesc(user);
    }

    public long getTotalComplaints(User user) {
        return complaintRepository.countByUser(user);
    }

    public long getPendingComplaints(User user) {
        return complaintRepository.countByUserAndStatus(user, "Pending");
    }

    public long getResolvedComplaints(User user) {
        return complaintRepository.countByUserAndStatus(user, "Resolved");
    }
}
