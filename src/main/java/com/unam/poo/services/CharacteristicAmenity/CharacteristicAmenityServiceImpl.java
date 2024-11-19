package com.unam.poo.services.CharacteristicAmenity;

import com.unam.poo.models.CharacteristicAmenity;
import com.unam.poo.repository.CharacteristicAmenityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CharacteristicAmenityServiceImpl implements CharacteristicAmenityService {

    @Autowired
    private CharacteristicAmenityRepository characteristicAmenityRepository;

    @Override
    public List<CharacteristicAmenity> findAll() {
        return characteristicAmenityRepository.findAll();
    }

    @Override
    public void deleteCharacteristicCAmenityById(Long id) {

    }

    @Override
    public CharacteristicAmenity getCharacteristicAmenityById(Long id) {
        return characteristicAmenityRepository.findById(id).get();
    }

    @Override
    public CharacteristicAmenity saveCharacteristicAmenity(CharacteristicAmenity characteristicAmenity) {
        return null;
    }
}
