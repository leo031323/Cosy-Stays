package com.unam.poo.services.Type;

import com.unam.poo.models.Type;
import com.unam.poo.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeRepository typeRepository;

    @Override
    public List<Type> findAll() {
        return typeRepository.findAll();
    }

    @Override
    public void deleteTypeById(Long id) {

    }

    @Override
    public Type getTypeById(Long id) {
        return typeRepository.findById(id).get();
    }

    @Override
    public Type saveType(Type type) {
        return typeRepository.save(type);
    }
}

