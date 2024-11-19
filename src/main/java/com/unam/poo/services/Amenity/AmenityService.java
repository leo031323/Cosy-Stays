package com.unam.poo.services.Amenity;

import com.unam.poo.models.Amenity;

import java.util.List;

public interface AmenityService {

    List<Amenity> findAll();
    void deleteAmenityById(Long id);
    Amenity getAmenityById(Long id);
    Amenity saveAmenity(Amenity amenity);

}
