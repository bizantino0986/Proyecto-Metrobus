package com.example.Examen02.service.interfaces.autobus;

import com.example.Examen02.entity.autobus.TipoAutobusEntity;

import java.util.List;

public interface TipoAutobusService {
    public List<TipoAutobusEntity> findAll();
    public void save(TipoAutobusEntity autobus);
    public TipoAutobusEntity findByID(Integer id);
    public void delete(Integer id);
}
