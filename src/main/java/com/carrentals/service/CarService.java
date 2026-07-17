package com.carrentals.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.carrentals.model.Car;
import com.carrentals.repository.CarRepository;

@Service
public class CarService {

    private final CarRepository carRepository;

    public CarService(CarRepository carRepository) {
        this.carRepository = carRepository;
    }

    public List<Car> getAllCars() {
        return carRepository.findAll();
    }

    public Car saveCar(Car car) {
        return carRepository.save(car);
    }

    public Car getCarById(int id) {
        return carRepository.findById(id).orElse(null);
    }

    public void deleteCar(int id) {
        carRepository.deleteById(id);
    }
    
    public List<Car> getAvailableCars() {
        return carRepository.findByStatus("Available");
    }
    }