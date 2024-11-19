package com.unam.poo.services.CharacteristicAmenity;

import com.unam.poo.models.CharacteristicAmenity;

import java.util.List;

public interface CharacteristicAmenityService {

    List<CharacteristicAmenity> findAll();
    void deleteCharacteristicCAmenityById(Long id);
    CharacteristicAmenity getCharacteristicAmenityById(Long id);
    CharacteristicAmenity saveCharacteristicAmenity(CharacteristicAmenity characteristicAmenity);

}
