package com.catering.controller;

import com.catering.model.User;
import com.catering.service.UserService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        if (userService.usernameExists(user.getUsername())) {
            result.rejectValue("username", "error.user", "Username already taken");
        }
        if (userService.emailExists(user.getEmail())) {
            result.rejectValue("email", "error.user", "Email already registered");
        }
        if (result.hasErrors()) {
            return "register";
        }
        userService.registerCustomer(user);
        model.addAttribute("registered", true);
        return "login";
    }
}
