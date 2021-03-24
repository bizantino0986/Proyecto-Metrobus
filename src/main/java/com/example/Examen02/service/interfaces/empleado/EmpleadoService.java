package com.example.Examen02.service.interfaces.empleado;

import com.example.Examen02.entity.empleado.EmpleadoEntity;

import java.util.List;

public interface EmpleadoService {
    public List<EmpleadoEntity> findAll();
    public void save(EmpleadoEntity empleadoEntity);
    public EmpleadoEntity findByID(int id);
    public void delete(int id);
}
