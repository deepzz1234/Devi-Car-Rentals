package com.carrentals.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.carrentals.model.Rental;
import com.carrentals.repository.RentalsRepository;

@Service
public class RentalsService {

    private final RentalsRepository rentalsRepository;

    public RentalsService(RentalsRepository rentalsRepository) {
        this.rentalsRepository = rentalsRepository;
    }


    // Get all rental records
    public List<Rental> getAllRentals() {

        return rentalsRepository.findAll();
    }


    // Get one rental using ID
    public Rental getRentalById(int id) {

        return rentalsRepository
                .findById(id)
                .orElse(null);
    }


    // Save or update rental
    public Rental saveRental(Rental rental) {

        return rentalsRepository.save(rental);
    }


    // Delete rental
    public void deleteRental(int id) {

        rentalsRepository.deleteById(id);
    }
}