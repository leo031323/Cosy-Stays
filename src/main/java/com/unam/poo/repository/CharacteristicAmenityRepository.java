package com.unam.poo.repository;

import com.unam.poo.models.CharacteristicAmenity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CharacteristicAmenityRepository extends JpaRepository<CharacteristicAmenity, Long> {

}
