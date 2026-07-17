package com.carrentals.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.carrentals.model.Customer;

public interface CustomerRepository
        extends JpaRepository<Customer, Integer> {

    Customer findByEmail(String email);
}