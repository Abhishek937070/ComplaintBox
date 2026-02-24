package com.abhishek.complaintbox.controller;

import com.abhishek.complaintbox.model.Complaint;
import com.abhishek.complaintbox.model.User;
import com.abhishek.complaintbox.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;
import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private UserService userService;

    // ================= DASHBOARD =================
    @GetMapping("/dashboard")
    public String dashboard(
            @RequestParam(value = "section", defaultValue = "dashboard") String section,
            HttpSession session,
            Model model) {

        User user = getLoggedInUser(session);
        if (user == null)
            return "redirect:/auth?tab=login";

        user = userService.getUserById(user.getId());
        session.setAttribute("loggedInUser", user);

        model.addAttribute("user", user);
        model.addAttribute("section", section);
        model.addAttribute("totalComplaints",
                userService.getTotalComplaints(user));
        model.addAttribute("pendingComplaints",
                userService.getPendingComplaints(user));
        model.addAttribute("resolvedComplaints",
                userService.getResolvedComplaints(user));

        if ("complaints".equals(section)) {
            List<Complaint> complaints =
                    userService.getUserComplaints(user);
            model.addAttribute("complaints", complaints);
        }

        return "dashboard";
    }

    // ================= FILE COMPLAINT WITH IMAGE =================
    @PostMapping("/addComplaint")
    public String addComplaint(
            @RequestParam String category,
            @RequestParam String subject,
            @RequestParam String description,
            @RequestParam("file") MultipartFile file,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        User user = getLoggedInUser(session);

        if (user == null) {
            return "redirect:/auth?tab=login";
        }

        String fileName = null;

        try {

            // ========= FILE UPLOAD =========
            if (!file.isEmpty()) {

                fileName = System.currentTimeMillis()
                        + "_" + file.getOriginalFilename();

                String uploadDir = "uploads/complaints/";

                Path uploadPath = Paths.get(uploadDir);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                Path filePath = uploadPath.resolve(fileName);
                Files.write(filePath, file.getBytes());
            }

            // ========= SAVE COMPLAINT =========
            Complaint complaint =
                    userService.fileComplaint(
                            category,
                            subject,
                            description,
                            user.getId());

            // ========= SAVE ATTACHMENT =========
            if (complaint != null && fileName != null) {
                complaint.setAttachment(fileName);
                userService.updateComplaint(complaint);
            }

            redirectAttributes.addFlashAttribute(
                    "successMsg",
                    "Complaint Added Successfully!");

        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute(
                    "errorMsg",
                    "File upload failed!");
        }

        // ✅ CORRECT REDIRECT
        return "redirect:/dashboard?section=complaints";
    }

    // ================= UPDATE PROFILE =================
    @PostMapping("/dashboard/update-profile")
    public String updateProfile(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String mobileNumber,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        User user = getLoggedInUser(session);
        if (user == null)
            return "redirect:/auth?tab=login";

        String result =
                userService.updateProfile(
                        user.getId(),
                        name,
                        email,
                        mobileNumber);

        if ("SUCCESS".equals(result))
            redirectAttributes.addFlashAttribute(
                    "successMsg",
                    "Profile updated successfully!");
        else
            redirectAttributes.addFlashAttribute(
                    "errorMsg",
                    result);

        return "redirect:/dashboard?section=profile";
    }

    // ================= CHANGE PASSWORD =================
    @PostMapping("/dashboard/change-password")
    public String changePassword(
            @RequestParam String currentPassword,
            @RequestParam String newPassword,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        User user = getLoggedInUser(session);
        if (user == null)
            return "redirect:/auth?tab=login";

        String result =
                userService.changePassword(
                        user.getId(),
                        currentPassword,
                        newPassword);

        if ("SUCCESS".equals(result))
            redirectAttributes.addFlashAttribute(
                    "successMsg",
                    "Password changed successfully!");
        else
            redirectAttributes.addFlashAttribute(
                    "errorMsg",
                    result);

        return "redirect:/dashboard?section=profile";
    }

    // ================= SESSION USER =================
    private User getLoggedInUser(HttpSession session) {
        return (User) session.getAttribute("loggedInUser");
    }
}