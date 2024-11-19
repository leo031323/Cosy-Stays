package com.unam.poo.services.Type;

import com.unam.poo.models.Type;

import java.util.List;

public interface TypeService {

    List<Type> findAll();
    void deleteTypeById(Long id);
    Type getTypeById(Long id);
    Type saveType(Type type);

}
