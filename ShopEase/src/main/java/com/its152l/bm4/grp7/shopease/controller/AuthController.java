package com.its152l.bm4.grp7.shopease.controller;

import com.its152l.bm4.grp7.shopease.entity.Staff;
import com.its152l.bm4.grp7.shopease.repository.StaffRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class AuthController {

    @Autowired
    private StaffRepository staffRepository; // This is the instance

    @GetMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout,
                        Model model) {
        if (error != null) model.addAttribute("error", true);
        if (logout != null) model.addAttribute("logout", true);
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "signup";
    }

    @PostMapping("/register")
    public String registerUser(Staff staff) {
        // Set role to "user" automatically
        staff.setRole("user");

        // Save to MySQL database - call save() on the instance, not the class
        staffRepository.save(staff);

        // Redirect to login page after successful registration
        return "redirect:/login";
    }
}