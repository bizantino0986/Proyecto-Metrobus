package com.example.Examen02.service.Implements.metrobus;

import com.example.Examen02.entity.metrobus.EstacionEntity;
import com.example.Examen02.repository.metrobus.EstacionRepository;
import com.example.Examen02.service.interfaces.metrobus.EstacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EstacionServiceImpl implements EstacionService {

    @Autowired
    private EstacionRepository repository;

    @Override
    public List<EstacionEntity> findAll() {
        return (List<EstacionEntity>) repository.findAll();
    }

    @Override
    public void save(EstacionEntity estacion) {
        repository.save(estacion);
    }

    @Override
    public EstacionEntity findByID(Integer id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void delete(Integer id) {
        repository.deleteById(id);
    }
}
