package com.carrentals.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.carrentals.model.Booking;
import com.carrentals.repository.BookingRepository;

@Service
public class BookingService {

    private final BookingRepository bookingRepository;

    public BookingService(
            BookingRepository bookingRepository) {

        this.bookingRepository = bookingRepository;
    }


    // ADMIN - GET ALL BOOKINGS
    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }


    // GET ONE BOOKING BY ID
    public Booking getBookingById(int id) {
        return bookingRepository
                .findById(id)
                .orElse(null);
    }


    // SAVE OR UPDATE BOOKING
    public Booking saveBooking(Booking booking) {
        return bookingRepository.save(booking);
    }


    // DELETE BOOKING
    public void deleteBooking(int id) {
        bookingRepository.deleteById(id);
    }


    // USER - GET MY BOOKINGS
    public List<Booking> getBookingsByCustomerEmail(
            String email) {

        return bookingRepository
                .findByCustomerEmail(email);
    }


    // USER - GET MY ACTIVE RENTALS
    public List<Booking> getConfirmedRentals(
            String email) {

        return bookingRepository
                .findByCustomerEmailAndStatus(
                        email,
                        "Confirmed"
                );
    }


    // ADMIN - GET CONFIRMED + COMPLETED RENTALS
    public List<Booking> getAllConfirmedRentals() {

        return bookingRepository
                .findByStatusIn(
                        List.of(
                                "Confirmed",
                                "Completed"
                        )
                );
    }
}