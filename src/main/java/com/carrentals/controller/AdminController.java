package com.carrentals.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carrentals.model.Admin;
import com.carrentals.repository.AdminRepository;
import com.carrentals.repository.BookingRepository;
import com.carrentals.repository.CarRepository;
import com.carrentals.repository.CustomerRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    private final AdminRepository adminRepository;
    private final CarRepository carRepository;
    private final BookingRepository bookingRepository;
    private final CustomerRepository customerRepository;


    // ==========================================
    // CONSTRUCTOR
    // ==========================================

    public AdminController(
            AdminRepository adminRepository,
            CarRepository carRepository,
            BookingRepository bookingRepository,
            CustomerRepository customerRepository) {

        this.adminRepository = adminRepository;
        this.carRepository = carRepository;
        this.bookingRepository = bookingRepository;
        this.customerRepository = customerRepository;
    }


    // ==========================================
    // SHOW ADMIN LOGIN PAGE
    // ==========================================

    @GetMapping("/admin-login")
    public String showAdminLogin() {

        return "admin-login";
    }


    // ==========================================
    // PROCESS ADMIN LOGIN
    // ==========================================

    @PostMapping("/admin-login")
    public String adminLogin(
            @RequestParam String username,
            @RequestParam String password,
            Model model,
            HttpSession session) {

        // Check username and password
        Admin admin =
                adminRepository.findByUsernameAndPassword(
                        username,
                        password
                );


        // If admin exists
        if (admin != null) {

            // Store logged-in admin in session
            session.setAttribute(
                    "loggedInAdmin",
                    admin
            );

            // Go to admin dashboard
            return "redirect:/admin-dashboard";
        }


        // Invalid login
        model.addAttribute(
                "error",
                "Invalid username or password"
        );


        return "admin-login";
    }


    // ==========================================
    // SHOW ADMIN DASHBOARD
    // ==========================================

    @GetMapping("/admin-dashboard")
    public String showAdminDashboard(
            HttpSession session,
            Model model) {


        // Get logged-in admin from session
        Admin admin =
                (Admin) session.getAttribute(
                        "loggedInAdmin"
                );


        // If admin is not logged in
        if (admin == null) {

            return "redirect:/admin-login";
        }


        // ======================================
        // TOTAL CARS
        // ======================================

        long totalCars =
                carRepository.count();


        // ======================================
        // TOTAL BOOKINGS
        // ======================================

        long totalBookings =
                bookingRepository.count();


        // ======================================
        // TOTAL REGISTERED CUSTOMERS
        // ======================================

        long totalCustomers =
                customerRepository.count();


        // ======================================
        // ACTIVE RENTALS
        // Confirmed bookings are rentals
        // ======================================

        long activeRentals =
                bookingRepository.countByStatus(
                        "Confirmed"
                );


        // ======================================
        // SEND VALUES TO ADMIN DASHBOARD JSP
        // ======================================

        model.addAttribute(
                "totalCars",
                totalCars
        );


        model.addAttribute(
                "totalBookings",
                totalBookings
        );


        model.addAttribute(
                "totalCustomers",
                totalCustomers
        );


        model.addAttribute(
                "activeRentals",
                activeRentals
        );


        // Send admin information if needed in JSP
        model.addAttribute(
                "admin",
                admin
        );


        return "admin-dashboard";
    }


    // ==========================================
    // ADMIN LOGOUT
    // ==========================================

    @GetMapping("/admin-logout")
    public String adminLogout(
            HttpSession session) {


        // Clear admin session
        session.invalidate();


        // Return to admin login page
        return "redirect:/admin-login";
    }
}