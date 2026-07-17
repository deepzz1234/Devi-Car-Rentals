package com.carrentals.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.carrentals.model.Rental;
@Repository
public interface RentalsRepository extends JpaRepository<Rental, Integer> {

}
