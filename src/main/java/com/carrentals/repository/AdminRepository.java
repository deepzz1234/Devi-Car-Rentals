package com.carrentals.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.carrentals.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer> {

    Admin findByUsernameAndPassword(String username, String password);
}
