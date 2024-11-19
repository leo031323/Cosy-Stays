package com.unam.poo.services.Publication;


import com.unam.poo.models.Publication;
import com.unam.poo.repository.PublicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PublicationServiceImpl implements PublicationService {

    @Autowired
    private PublicationRepository publicationRepository;


    @Override
    public Publication getPublicationById(Long id) {
        return publicationRepository.findById(id).get();
    }

    @Override
    public Publication savePublication(Publication publication) {
        return publicationRepository.save(publication);
    }

    @Override
    public List<Publication> findAll() {
        return publicationRepository.findAll();
    }

    @Override
    public void updatePublication(Publication publication, Long id) {

        publicationRepository.save(publication);
    }

    @Override
    public List<Publication> findAllByState(String state) {
        return publicationRepository.findAllByState(state);
    }

    @Override
    public void deletePublicationById(Long id) {
        Publication publication = publicationRepository.findById(id).get();
        publication.setState("delete");
        publicationRepository.save(publication);
    }

    @Override
    public List<Publication> findByTitleContaining(String title) {
        return publicationRepository.findByTitleContaining(title);
    }




}
