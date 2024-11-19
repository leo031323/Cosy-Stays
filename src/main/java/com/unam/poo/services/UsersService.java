package com.unam.poo.services;
import com.unam.poo.models.Users;

import java.util.List;


public interface UsersService {
    List<Users> findAll();
    void deleteUserById(Long id);
    Users getUserById(Long id);
    Users saveUser(Users users);

    Users updateAndSaveUser(Users users, Long id);

    Users getUserByCorreo(String correo);

    void addFavorites(Long publicationId, Long id);
    void removeFavorites(Long publicationId, Long id);
}
