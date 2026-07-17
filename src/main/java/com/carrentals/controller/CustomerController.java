package com.carrentals.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.carrentals.service.CustomerService;

@Controller
public class CustomerController {

    private final CustomerService customerService;

    public CustomerController(
            CustomerService customerService) {

        this.customerService = customerService;
    }

    // Display all customers
    @GetMapping("/admin/customers")
    public String manageCustomers(Model model) {

        model.addAttribute(
                "customers",
                customerService.getAllCustomers()
        );

        return "manage-customers";
    }

    // Delete customer
    @GetMapping("/admin/customers/delete/{id}")
    public String deleteCustomer(
            @PathVariable int id) {

        customerService.deleteCustomer(id);

        return "redirect:/admin/customers";
    }
}