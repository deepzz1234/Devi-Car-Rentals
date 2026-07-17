package com.carrentals.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.carrentals.model.Booking;

@Repository
public interface BookingRepository
        extends JpaRepository<Booking, Integer> {

    // User - all bookings
    List<Booking> findByCustomerEmail(
            String customerEmail
    );

    // User - bookings by status
    List<Booking> findByCustomerEmailAndStatus(
            String customerEmail,
            String status
    );

    // Admin - bookings by one status
    List<Booking> findByStatus(
            String status
    );

    // Admin - bookings by multiple statuses
    List<Booking> findByStatusIn(
            List<String> statuses
    );

    // Admin dashboard - count bookings by status
    long countByStatus(
            String status
    );
}