package com.carrentals.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Rental {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String customerName;

    private String carName;

    private String registrationNumber;

    private String pickupDate;

    private String returnDate;

    private double totalAmount;

    private String status;


    public Rental() {
    }


    public Rental(
            int id,
            String customerName,
            String carName,
            String registrationNumber,
            String pickupDate,
            String returnDate,
            double totalAmount,
            String status) {

        this.id = id;
        this.customerName = customerName;
        this.carName = carName;
        this.registrationNumber = registrationNumber;
        this.pickupDate = pickupDate;
        this.returnDate = returnDate;
        this.totalAmount = totalAmount;
        this.status = status;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public String getCustomerName() {
        return customerName;
    }


    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }


    public String getCarName() {
        return carName;
    }


    public void setCarName(String carName) {
        this.carName = carName;
    }


    public String getRegistrationNumber() {
        return registrationNumber;
    }


    public void setRegistrationNumber(
            String registrationNumber) {

        this.registrationNumber =
                registrationNumber;
    }


    public String getPickupDate() {
        return pickupDate;
    }


    public void setPickupDate(
            String pickupDate) {

        this.pickupDate = pickupDate;
    }


    public String getReturnDate() {
        return returnDate;
    }


    public void setReturnDate(
            String returnDate) {

        this.returnDate = returnDate;
    }


    public double getTotalAmount() {
        return totalAmount;
    }


    public void setTotalAmount(
            double totalAmount) {

        this.totalAmount = totalAmount;
    }


    public String getStatus() {
        return status;
    }


    public void setStatus(
            String status) {

        this.status = status;
    }
}