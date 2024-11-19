package com.unam.poo.services.Photo;

import java.util.List;

import com.unam.poo.models.Photo;

public interface PhotoService {
    List<Photo> findAll();
    void deletePhotoById(Long id);
    Photo getPhotoById(Long id);
    Photo savePhoto(Photo photo);
    String transformToDataURI(Photo photo);
}
