package com.its152l.bm4.grp7.shopease.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("message", "Hello, ShopEase World!");
        return "hello"; // Freemarker will look for hello.ftlh
    }

    @GetMapping("/custom-login")
    public String customLogin(Model model) {
        return "login"; // This will use login.ftlh template
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

}
