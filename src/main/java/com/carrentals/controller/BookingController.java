package com.carrentals.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carrentals.model.Booking;
import com.carrentals.model.Car;
import com.carrentals.service.BookingService;
import com.carrentals.service.CarService;

@Controller
public class BookingController {

    private final BookingService bookingService;
    private final CarService carService;


    // ==========================================
    // CONSTRUCTOR
    // ==========================================

    public BookingController(
            BookingService bookingService,
            CarService carService) {

        this.bookingService = bookingService;
        this.carService = carService;
    }


    // ==========================================
    // USER - OPEN BOOKING PAGE
    // ==========================================

    @GetMapping("/book-car/{id}")
    public String showBookingPage(
            @PathVariable("id") int id,
            Model model) {

        Car car = carService.getCarById(id);

        if (car == null) {
            return "redirect:/cars";
        }

        model.addAttribute("car", car);

        return "book-car";
    }


    // ==========================================
    // USER - SAVE BOOKING
    // ==========================================

    @PostMapping("/book-car")
    public String saveBooking(
            @RequestParam int carId,
            @RequestParam String phoneNumber,
            @RequestParam String startDate,
            @RequestParam String endDate,
            @AuthenticationPrincipal OAuth2User oauthUser,
            Model model) {

        // Check user login
        if (oauthUser == null) {
            return "redirect:/user-login";
        }


        // Get selected car
        Car car = carService.getCarById(carId);

        if (car == null) {
            return "redirect:/cars";
        }


        // Check car availability
        if (!"Available".equalsIgnoreCase(car.getStatus())) {

            model.addAttribute("car", car);

            model.addAttribute(
                    "error",
                    "Sorry, this car is no longer available."
            );

            return "book-car";
        }


        // Convert dates
        LocalDate pickup =
                LocalDate.parse(startDate);

        LocalDate returnDay =
                LocalDate.parse(endDate);


        // Pickup date validation
        if (pickup.isBefore(LocalDate.now())) {

            model.addAttribute("car", car);

            model.addAttribute(
                    "error",
                    "Pickup date cannot be in the past."
            );

            return "book-car";
        }


        // Return date validation
        if (returnDay.isBefore(pickup)) {

            model.addAttribute("car", car);

            model.addAttribute(
                    "error",
                    "Return date cannot be before pickup date."
            );

            return "book-car";
        }


        // Calculate rental days
        long numberOfDays =
                ChronoUnit.DAYS.between(
                        pickup,
                        returnDay
                );


        // Same-day booking = 1 day
        if (numberOfDays == 0) {
            numberOfDays = 1;
        }


        // Calculate total amount
        double totalAmount =
                numberOfDays
                * car.getPricePerDay();


        // Get Google user information
        String customerName =
                oauthUser.getAttribute("name");

        String customerEmail =
                oauthUser.getAttribute("email");


        // Create booking
        Booking booking = new Booking();


        // Customer information
        booking.setCustomerName(
                customerName
        );

        booking.setCustomerEmail(
                customerEmail
        );

        booking.setPhoneNumber(
                phoneNumber
        );


        // Car information
        booking.setCarName(
                car.getBrand()
                + " "
                + car.getModel()
        );

        booking.setRegistrationNumber(
                car.getRegistrationNumber()
        );


        // Booking dates
        booking.setPickupDate(
                startDate
        );

        booking.setReturnDate(
                endDate
        );


        // Amount
        booking.setTotalAmount(
                totalAmount
        );


        // Initial booking status
        booking.setStatus(
                "Pending"
        );


        // Save booking
        bookingService.saveBooking(
                booking
        );


        // Change car status to Booked
        car.setStatus(
                "Booked"
        );

        carService.saveCar(
                car
        );


        return "redirect:/my-bookings";
    }


    // ==========================================
    // USER - MY BOOKINGS
    // ==========================================

    @GetMapping("/my-bookings")
    public String myBookings(
            @AuthenticationPrincipal OAuth2User oauthUser,
            Model model) {

        if (oauthUser == null) {
            return "redirect:/user-login";
        }


        String customerEmail =
                oauthUser.getAttribute("email");


        model.addAttribute(
                "bookings",
                bookingService
                        .getBookingsByCustomerEmail(
                                customerEmail
                        )
        );


        return "my-bookings";
    }


    // ==========================================
    // USER - MY RENTALS
    // ==========================================

    @GetMapping("/my-rentals")
    public String myRentals(
            @AuthenticationPrincipal OAuth2User oauthUser,
            Model model) {

        if (oauthUser == null) {
            return "redirect:/user-login";
        }


        String customerEmail =
                oauthUser.getAttribute("email");


        model.addAttribute(
                "rentals",
                bookingService
                        .getConfirmedRentals(
                                customerEmail
                        )
        );


        return "my-rentals";
    }


    // ==========================================
    // USER - MY PROFILE
    // ==========================================

    @GetMapping({
        "/my-profile",
        "/user-profile"
    })
    public String myProfile(
            @AuthenticationPrincipal OAuth2User oauthUser,
            Model model) {

        if (oauthUser == null) {
            return "redirect:/user-login";
        }


        model.addAttribute(
                "name",
                oauthUser.getAttribute("name")
        );

        model.addAttribute(
                "email",
                oauthUser.getAttribute("email")
        );

        model.addAttribute(
                "picture",
                oauthUser.getAttribute("picture")
        );


        return "my-profile";
    }


    // ==========================================
    // ADMIN - DISPLAY ALL BOOKINGS
    // ==========================================

    @GetMapping("/admin/bookings")
    public String manageBookings(
            Model model) {

        model.addAttribute(
                "bookings",
                bookingService.getAllBookings()
        );


        return "manage-bookings";
    }


    // ==========================================
    // ADMIN - CONFIRM BOOKING
    // ==========================================

    @GetMapping("/admin/bookings/confirm/{id}")
    public String confirmBooking(
            @PathVariable("id") int id) {

        Booking booking =
                bookingService.getBookingById(id);


        if (booking != null) {

            booking.setStatus(
                    "Confirmed"
            );

            bookingService.saveBooking(
                    booking
            );
        }


        return "redirect:/admin/bookings";
    }


    // ==========================================
    // ADMIN - CANCEL BOOKING
    // ==========================================

    @GetMapping("/admin/bookings/cancel/{id}")
    public String cancelBooking(
            @PathVariable("id") int id) {

        Booking booking =
                bookingService.getBookingById(id);


        if (booking != null) {

            booking.setStatus(
                    "Cancelled"
            );

            bookingService.saveBooking(
                    booking
            );
        }


        return "redirect:/admin/bookings";
    }


    // ==========================================
    // ADMIN - DELETE BOOKING
    // ==========================================

    @GetMapping("/admin/bookings/delete/{id}")
    public String deleteBooking(
            @PathVariable("id") int id) {

        bookingService.deleteBooking(
                id
        );


        return "redirect:/admin/bookings";
    }


    // ==========================================
    // ADMIN - MANAGE RENTALS
    // ==========================================

    @GetMapping("/admin/rentals")
    public String manageRentals(
            Model model) {

        model.addAttribute(
                "rentals",
                bookingService
                        .getAllConfirmedRentals()
        );


        return "manage-rentals";
    }


    // ==========================================
    // ADMIN - COMPLETE RENTAL
    // ==========================================

    @GetMapping("/admin/rentals/complete/{id}")
    public String completeRental(
            @PathVariable("id") int id) {

        Booking booking =
                bookingService.getBookingById(id);


        if (booking != null) {

            booking.setStatus(
                    "Completed"
            );

            bookingService.saveBooking(
                    booking
            );
        }


        return "redirect:/admin/rentals";
    }


    // ==========================================
    // ADMIN - DELETE RENTAL
    // ==========================================

    @GetMapping("/admin/rentals/delete/{id}")
    public String deleteRental(
            @PathVariable("id") int id) {

        bookingService.deleteBooking(
                id
        );


        return "redirect:/admin/rentals";
    }
}