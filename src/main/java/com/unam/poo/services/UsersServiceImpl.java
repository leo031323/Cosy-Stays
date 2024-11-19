package com.unam.poo.services;
import java.util.List;

import com.unam.poo.models.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unam.poo.repository.PublicationRepository;
import com.unam.poo.repository.UsersRepository;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private PublicationRepository publicationRepository;

    @Override
    public List<Users> findAll() {
        return usersRepository.findAll();
    }

    @Override
    public void deleteUserById(Long id) {
        usersRepository.deleteById(id);
    }

    @Override
    public Users getUserById(Long id) {
        return usersRepository.findById(id).get();
    }

    @Override
    public Users saveUser(Users users) {
        return usersRepository.save(users);
    }

    @Override
    public Users updateAndSaveUser(Users updatedUser, Long id) {
        // Fetch the existing user by ID
        Users existingUser = usersRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));

        // Update fields selectively to avoid overwriting data unintentionally
        if (updatedUser.getName() != null) {
            existingUser.setName(updatedUser.getName());
        }
        if (updatedUser.getLastname() != null) {
            existingUser.setLastname(updatedUser.getLastname());
        }
        if (updatedUser.getCorreo() != null) {
            existingUser.setCorreo(updatedUser.getCorreo());
        }
        if (updatedUser.getTelephone() != null) {
            existingUser.setTelephone(updatedUser.getTelephone());
        }
        if (updatedUser.getDescription() != null) {
            existingUser.setDescription(updatedUser.getDescription());
        }
        if (updatedUser.getCity() != null) {
            existingUser.setCity(updatedUser.getCity());
        }

        // Save the updated user
        return usersRepository.save(existingUser);
    }
    
    @Override
    public Users getUserByCorreo(String correo){
        List<Users> users = usersRepository.findAll();
        Users aux = new Users();
        aux.setId((long) -1);
        for (int i = 0; i < users.size(); i++) {
            if (correo.equals(users.get(i).getCorreo())){
                System.out.println("Find: " + users.get(i).getCorreo());
                aux = users.get(i);
            }
        }
        if (aux.getId() > 0){
            return aux;
        }
        return null;
        
    }

    @Override
    public void addFavorites(Long publicationId, Long id) {
        Users users = usersRepository.findById(id).get();
        users.getFavorites().add(publicationRepository.findById(publicationId).get());
        usersRepository.save(users);
    }

    @Override
    public void removeFavorites(Long publicationId, Long id) {
        Users users = usersRepository.findById(id).get();
        users.getFavorites().remove(publicationRepository.findById(publicationId).get());
        usersRepository.save(users);
    }

}

