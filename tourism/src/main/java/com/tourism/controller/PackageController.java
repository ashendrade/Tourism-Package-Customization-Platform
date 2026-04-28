package com.tourism.controller;

import com.tourism.model.TravelPackage;
import com.tourism.service.PackageService;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RequestMapping("/packages")
public class PackageController {

    private final PackageService service;

    public PackageController(PackageService service) {
        this.service = service;
    }

    @PostMapping
    public String create(@RequestBody TravelPackage pkg) {
        return service.createPackage(pkg);
    }

    @GetMapping
    public List<TravelPackage> getAll() {
        return service.getAllPackages();
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable String id) {
        return service.deletePackage(id);
    }
}