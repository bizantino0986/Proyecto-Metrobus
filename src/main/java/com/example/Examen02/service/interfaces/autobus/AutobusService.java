package com.example.Examen02.service.interfaces.autobus;

import com.example.Examen02.entity.autobus.AutobusEntity;
import com.example.Examen02.entity.metrobus.EstacionEntity;

import java.util.List;

public interface AutobusService {
    public List<AutobusEntity> findAll();
    public void save(AutobusEntity autobus);
    public AutobusEntity findByID(Integer id);
    public void delete(Integer id);
}
