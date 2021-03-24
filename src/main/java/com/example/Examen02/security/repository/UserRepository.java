package com.example.Examen02.security.repository;


import com.example.Examen02.security.entity.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface UserRepository extends CrudRepository<User, Integer> {
    public Optional<User> findByUser(String user);
}
