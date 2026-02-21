package com.abhishek.complaintbox.controller;

import com.abhishek.complaintbox.model.Complaint;
import com.abhishek.complaintbox.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @PostMapping("/admin-login")
    public String adminLogin(@RequestParam String adminEmail,
                             @RequestParam String adminPassword,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        if (userService.adminLogin(adminEmail, adminPassword)) {
            session.setAttribute("isAdmin", true);
            session.setAttribute("adminEmail", adminEmail);
            return "redirect:/admin/dashboard";
        } else {
            redirectAttributes.addFlashAttribute("errorMsg", "Invalid Admin credentials!");
            return "redirect:/auth?tab=admin";
        }
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard(@RequestParam(value = "section", defaultValue = "dashboard") String section,
                                 @RequestParam(value = "searchName", required = false) String searchName,
                                 @RequestParam(value = "searchSubject", required = false) String searchSubject,
                                 @RequestParam(value = "searchCategory", required = false) String searchCategory,
                                 HttpSession session, Model model) {
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        if (isAdmin == null || !isAdmin) {
            return "redirect:/auth?tab=admin";
        }

        model.addAttribute("section", section);
        model.addAttribute("totalComplaints", userService.getTotalComplaintsAll());
        model.addAttribute("pendingComplaints", userService.getPendingComplaintsAll());
        model.addAttribute("resolvedComplaints", userService.getResolvedComplaintsAll());

        if ("complaints".equals(section)) {
            List<Complaint> complaints;
            // Check if any search parameter is provided
            boolean hasSearch = (searchName != null && !searchName.trim().isEmpty()) ||
                                (searchSubject != null && !searchSubject.trim().isEmpty()) ||
                                (searchCategory != null && !searchCategory.trim().isEmpty());

            if (hasSearch) {
                complaints = userService.searchComplaints(searchName, searchSubject, searchCategory);
                model.addAttribute("searchName", searchName);
                model.addAttribute("searchSubject", searchSubject);
                model.addAttribute("searchCategory", searchCategory);
            } else {
                complaints = userService.getAllComplaints();
            }
            model.addAttribute("complaints", complaints);
        }

        return "admin-dashboard";
    }

    @GetMapping("/admin/resolve/{id}")
    public String resolveComplaintForm(@PathVariable Long id,
                                       HttpSession session, Model model) {
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        if (isAdmin == null || !isAdmin) {
            return "redirect:/auth?tab=admin";
        }

        Complaint complaint = userService.getComplaintById(id);
        if (complaint == null) {
            return "redirect:/admin/dashboard?section=complaints";
        }

        model.addAttribute("complaint", complaint);
        model.addAttribute("section", "resolve");
        model.addAttribute("totalComplaints", userService.getTotalComplaintsAll());
        model.addAttribute("pendingComplaints", userService.getPendingComplaintsAll());
        model.addAttribute("resolvedComplaints", userService.getResolvedComplaintsAll());
        return "admin-dashboard";
    }

    @PostMapping("/admin/resolve")
    public String resolveComplaint(@RequestParam Long complaintId,
                                   @RequestParam String adminReply,
                                   @RequestParam String status,
                                   HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        if (isAdmin == null || !isAdmin) {
            return "redirect:/auth?tab=admin";
        }

        String result = userService.resolveComplaint(complaintId, adminReply, status);
        if ("SUCCESS".equals(result)) {
            redirectAttributes.addFlashAttribute("successMsg", "Complaint updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("errorMsg", result);
        }
        return "redirect:/admin/dashboard?section=complaints";
    }

    @GetMapping("/admin/logout")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("isAdmin");
        session.removeAttribute("adminEmail");
        return "redirect:/";
    }
}
