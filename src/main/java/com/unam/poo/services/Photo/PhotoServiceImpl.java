package com.unam.poo.services.Photo;

import java.util.List;

import com.unam.poo.models.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unam.poo.repository.PhotoRepository;

@Service
public class PhotoServiceImpl implements PhotoService {

    @Autowired
    PhotoRepository photoRepository;

    @Override
    public List<Photo> findAll() {
        return photoRepository.findAll();
    }

    @Override
    public void deletePhotoById(Long id) {
        photoRepository.deleteById(id);
    }

    @Override
    public Photo getPhotoById(Long id) {
        return photoRepository.findById(id).orElse(null);
    }
 
    @Override
    public Photo savePhoto(Photo photo) {
        return photoRepository.save(photo);
    }

    @Override
    public String transformToDataURI(Photo photo) {
        String str = "";
        str += "data:image/png;base64,";
        return str;
    }
    
}
