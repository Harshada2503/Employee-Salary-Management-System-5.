
package org.techhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.Admin;
import org.techhub.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    // Display Admin Login Page
    @GetMapping("/admin/login")
    public String showLoginPage(HttpSession session) {

        // If admin is already logged in, open dashboard
        if (session.getAttribute("adminId") != null) {
            return "redirect:/dashboard";
        }

        return "admin/login";
    }

    // Process Admin Login
    @PostMapping("/admin/login")
    public String adminLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpServletRequest request,
            Model model) {

        Admin admin = adminService.validateAdminLogin(
                username, password);

        if (admin != null) {

            // Change session ID after successful authentication
            request.changeSessionId();

            HttpSession session = request.getSession();

            // Store admin information in session
            session.setAttribute("adminId", admin.getAdmin_id());
            session.setAttribute("adminName", admin.getFull_name());

            return "redirect:/dashboard";
        }

        model.addAttribute("error",
                "Invalid username or password!");

        return "admin/login";
    }

    // Admin Logout
    @PostMapping("/admin/logout")
    public String adminLogout(HttpSession session) {

        // Destroy admin session
        session.invalidate();

        return "redirect:/admin/login?logout=true";
    }
 // Display Admin Registration Page
    @GetMapping("/admin/setup")
    public String showAdminSetupPage(Model model) {

        int adminCount = adminService.getAdminCount();

        if (adminCount > 0) {
            return "redirect:/admin/login";
        }

        model.addAttribute("admin", new Admin());

        return "admin/setup";
    }
 // Register First Admin
    @PostMapping("/admin/setup")
    public String registerAdmin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("full_name") String full_name,
            Model model) {

        // Prevent registration if an admin already exists
        if (adminService.getAdminCount() > 0) {
            return "redirect:/admin/login";
        }

        // Basic input validation
        if (username.trim().isEmpty()
                || password.trim().isEmpty()
                || full_name.trim().isEmpty()
                || password.length() < 8) {

            model.addAttribute("error",
                    "All fields are required. Password must contain at least 8 characters.");

            return "admin/setup";
        }

        Admin admin = new Admin();

        admin.setUsername(username.trim());
        admin.setPassword(password);
        admin.setFull_name(full_name.trim());
        admin.setAdmin_status("Active");

        adminService.addAdmin(admin);

        return "redirect:/admin/login?registered=true";
    }
}
