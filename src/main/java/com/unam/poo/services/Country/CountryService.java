package com.unam.poo.services.Country;

import java.util.List;

import com.unam.poo.models.Country;

public interface CountryService {
    List<Country> findAll();
    void deleteCountryById(Long id);
    Country getCountryById(Long id);
    Country saveCountry(Country country);
}
