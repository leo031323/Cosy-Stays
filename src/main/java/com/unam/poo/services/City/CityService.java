package com.unam.poo.services.City;

import com.unam.poo.models.City;

import java.util.List;

public interface CityService {
    List<City> findAll();
    void deleteCityById(Long id);
    City getCityById(Long id);
    City saveCity(City city);

}
