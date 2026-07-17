package com.carrentals.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.carrentals.model.Customer;
import com.carrentals.repository.CustomerRepository;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerService(
            CustomerRepository customerRepository) {

        this.customerRepository = customerRepository;
    }

    public List<Customer> getAllCustomers() {

        return customerRepository.findAll();
    }

    public Customer getCustomerById(int id) {

        return customerRepository
                .findById(id)
                .orElse(null);
    }

    public Customer saveCustomer(Customer customer) {

        return customerRepository.save(customer);
    }

    public void deleteCustomer(int id) {

        customerRepository.deleteById(id);
    }
}