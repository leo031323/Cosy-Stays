package com.unam.poo.repository;

import com.unam.poo.models.Users;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import java.lang.Long;

@Repository
public interface UsersRepository extends JpaRepository<Users, Long> {
}