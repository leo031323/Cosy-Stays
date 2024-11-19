package com.unam.poo.services.City;

import com.unam.poo.models.City;
import com.unam.poo.repository.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityRepository cityRepository;

    @Override
    public List<City> findAll() {
        return cityRepository.findAll();
    }

    @Override
    public void deleteCityById(Long id) {

    }

    @Override
    public City getCityById(Long id) {
        return cityRepository.findById(id).get();
    }

    @Override
    public City saveCity(City city) {
        return cityRepository.save(city);
    }
}

