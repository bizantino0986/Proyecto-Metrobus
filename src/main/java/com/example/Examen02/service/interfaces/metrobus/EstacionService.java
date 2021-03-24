package com.example.Examen02.service.interfaces.metrobus;

import com.example.Examen02.entity.metrobus.EstacionEntity;

import java.util.List;

public interface EstacionService {
    public List<EstacionEntity> findAll();
    public void save(EstacionEntity estacion);
    public EstacionEntity findByID(Integer id);
    public void delete(Integer id);
}
