package com.carrentals.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.carrentals.model.Admin;
import com.carrentals.repository.AdminRepository;

@Component
public class DataInitializer implements CommandLineRunner {

    private final AdminRepository adminRepository;

    public DataInitializer(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public void run(String... args) {

        if (adminRepository.count() == 0) {

            Admin admin = new Admin();

            admin.setUsername("admin");
            admin.setPassword("admin8755");

            adminRepository.save(admin);

            System.out.println("Default admin account created.");
        }
    }
}
