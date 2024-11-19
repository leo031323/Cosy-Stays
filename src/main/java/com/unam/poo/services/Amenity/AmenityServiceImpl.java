package com.unam.poo.services.Amenity;

import com.unam.poo.models.Amenity;
import com.unam.poo.repository.AmenityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AmenityServiceImpl implements AmenityService {

    @Autowired
    private AmenityRepository amenityRepository;

    @Override
    public List<Amenity> findAll() {
        return amenityRepository.findAll();
    }

    @Override
    public void deleteAmenityById(Long id) {

    }

    @Override
    public Amenity getAmenityById(Long id) {
        return amenityRepository.findById(id).get();
    }

    @Override
    public Amenity saveAmenity(Amenity amenity) {
        return null;
    }
}

