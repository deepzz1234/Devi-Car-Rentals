package com.carrentals.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RentalsController {

    // =========================
    // HOME PAGE
    // =========================

    @GetMapping({"/", "/home"})
    public String home() {

        return "home";
    }
}