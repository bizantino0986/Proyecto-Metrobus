package com.example.Examen02.service.Implements.autobus;

import com.example.Examen02.entity.autobus.AutobusEntity;
import com.example.Examen02.entity.metrobus.EstacionEntity;
import com.example.Examen02.repository.autobus.AutobusRepositoy;
import com.example.Examen02.service.interfaces.autobus.AutobusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AutobusServiceImpl implements AutobusService {

    @Autowired
    private AutobusRepositoy repositoy;


    @Override
    public List<AutobusEntity> findAll() {
        return (List<AutobusEntity>) repositoy.findAll();
    }

    @Override
    public void save(AutobusEntity autobus) {
        repositoy.save(autobus);
    }

    @Override
    public AutobusEntity findByID(Integer id) {
        return repositoy.findById(id).orElse(null);
    }

    @Override
    public void delete(Integer id) {
        repositoy.deleteById(id);
    }
}
