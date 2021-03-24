package com.example.Examen02.service.Implements.metrobus;

import com.example.Examen02.entity.metrobus.MetrobusEntity;
import com.example.Examen02.repository.metrobus.MetrobusRepository;
import com.example.Examen02.service.interfaces.metrobus.MetrobusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MetrobusServiceImpl implements MetrobusService {

    @Autowired
    private MetrobusRepository repository;

    @Override
    public List<MetrobusEntity> findAll() {
        return (List<MetrobusEntity>) repository.findAll();
    }
}
