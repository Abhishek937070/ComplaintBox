package com.abhishek.complaintbox.controller;

import com.abhishek.complaintbox.model.User;
import com.abhishek.complaintbox.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/auth")
    public String authPage(@RequestParam(value = "tab", defaultValue = "login") String tab, Model model) {
        model.addAttribute("activeTab", tab);
        return "auth";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam String name,
                         @RequestParam String email,
                         @RequestParam String mobileNumber,
                         @RequestParam String password,
                         RedirectAttributes redirectAttributes) {
        String result = userService.registerUser(name, email, mobileNumber, password);
        if ("SUCCESS".equals(result)) {
            redirectAttributes.addFlashAttribute("successMsg", "Account created successfully! Please login.");
            return "redirect:/auth?tab=login";
        } else {
            redirectAttributes.addFlashAttribute("errorMsg", result);
            return "redirect:/auth?tab=signup";
        }
    }

    @PostMapping("/login")
    public String login(@RequestParam String emailOrMobile,
                        @RequestParam String password,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {
        User user = userService.loginUser(emailOrMobile, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            session.setAttribute("userId", user.getId());
            return "redirect:/dashboard";
        } else {
            redirectAttributes.addFlashAttribute("errorMsg", "Invalid email/mobile or password!");
            return "redirect:/auth?tab=login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
