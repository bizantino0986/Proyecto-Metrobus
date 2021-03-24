package com.example.Examen02.service.Implements.empleado;

import com.example.Examen02.entity.empleado.EmpleadoEntity;
import com.example.Examen02.repository.empleado.EmpleadoRepository;
import com.example.Examen02.service.interfaces.empleado.EmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpleadoServiceImpl implements EmpleadoService {
    @Autowired
    private EmpleadoRepository repository;

    @Override
    public List<EmpleadoEntity> findAll() {
        return (List<EmpleadoEntity>) repository.findAll();
    }

    @Override
    public void save(EmpleadoEntity empleadoEntity) {
        repository.save(empleadoEntity);
    }

    @Override
    public EmpleadoEntity findByID(int id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void delete(int id) {
        repository.deleteById(id);
    }
}
