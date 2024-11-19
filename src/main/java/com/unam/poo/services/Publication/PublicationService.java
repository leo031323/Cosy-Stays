package com.unam.poo.services.Publication;

import com.unam.poo.models.Publication;

import java.util.List;

public interface PublicationService {

    List<Publication> findAll();
    void deletePublicationById(Long id);
    Publication getPublicationById(Long id);
    Publication savePublication(Publication publication);

    void updatePublication(Publication publication, Long id);

    List<Publication> findAllByState(String state);

    List<Publication> findByTitleContaining(String title);

}
