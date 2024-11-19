package com.unam.poo.repository;

import com.unam.poo.models.Publication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublicationRepository extends JpaRepository<Publication, Long> {

    List<Publication> findAllByState(String state);

    List<Publication> findByTitleContaining(String title);




}

