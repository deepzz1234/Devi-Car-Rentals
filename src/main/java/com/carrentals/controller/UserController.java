package com.carrentals.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.carrentals.model.Customer;
import com.carrentals.repository.CustomerRepository;

@Controller
public class UserController {

    private final CustomerRepository customerRepository;

    public UserController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @GetMapping("/user-login")
    public String showUserLogin() {
        return "user-login";
    }

    @GetMapping("/google-login-success")
    public String googleLoginSuccess(
            @AuthenticationPrincipal OAuth2User oauthUser) {

        if (oauthUser == null) {
            return "redirect:/user-login";
        }

        String name = oauthUser.getAttribute("name");
        String email = oauthUser.getAttribute("email");

        Customer customer = customerRepository.findByEmail(email);

        if (customer == null) {
            customer = new Customer();
            customer.setName(name);
            customer.setEmail(email);

            customerRepository.save(customer);
        }

        return "redirect:/user-dashboard";
    }

    @GetMapping("/user-dashboard")
    public String userDashboard(
            @AuthenticationPrincipal OAuth2User oauthUser,
            Model model) {

        if (oauthUser == null) {
            return "redirect:/user-login";
        }

        model.addAttribute(
                "userName",
                oauthUser.getAttribute("name")
        );

        model.addAttribute(
                "userEmail",
                oauthUser.getAttribute("email")
        );

        return "user-dashboard";
    }
}