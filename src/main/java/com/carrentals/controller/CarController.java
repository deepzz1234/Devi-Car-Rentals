package com.carrentals.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.carrentals.model.Car;
import com.carrentals.service.CarService;

@Controller
public class CarController {

    private final CarService carService;

    public CarController(CarService carService) {
        this.carService = carService;
    }


    // =========================
    // DISPLAY ALL CARS
    // =========================

    @GetMapping("/admin/cars")
    public String manageCars(Model model) {

        model.addAttribute(
                "cars",
                carService.getAllCars()
        );

        return "manage-cars";
    }


    // =========================
    // SHOW ADD CAR PAGE
    // =========================

    @GetMapping("/admin/cars/add")
    public String showAddCar() {

        return "addcar";
    }


    // =========================
    // SAVE NEW CAR
    // =========================

    @PostMapping("/admin/cars/add")
    public String addCar(
            @ModelAttribute Car car) {

        carService.saveCar(car);

        return "redirect:/admin/cars";
    }


    // =========================
    // SHOW EDIT CAR PAGE
    // =========================

    @GetMapping("/admin/cars/edit/{id}")
    public String showEditCar(
            @PathVariable int id,
            Model model) {

        Car car =
                carService.getCarById(id);

        model.addAttribute(
                "car",
                car
        );

        return "edit-car";
    }


    // =========================
    // UPDATE CAR
    // =========================

    @PostMapping("/admin/cars/update")
    public String updateCar(
            @ModelAttribute Car car) {

        carService.saveCar(car);

        return "redirect:/admin/cars";
    }


    // =========================
    // DELETE CAR
    // =========================

    @GetMapping("/admin/cars/delete/{id}")
    public String deleteCar(
            @PathVariable int id) {

        carService.deleteCar(id);

        return "redirect:/admin/cars";
    }
    
 // Display available cars for users
    @GetMapping("/cars")
    public String viewAvailableCars(Model model) {

        model.addAttribute("cars", carService.getAvailableCars());

        return "available-cars";
    }

}