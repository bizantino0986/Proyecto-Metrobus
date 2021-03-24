package com.example.Examen02.service.Implements.metrobus;

import com.example.Examen02.entity.metrobus.LineaEntity;
import com.example.Examen02.repository.metrobus.LineaRepository;
import com.example.Examen02.service.interfaces.metrobus.LineaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LineaServiceImpl implements LineaService {
    @Autowired
    private LineaRepository repository;

    @Override
    public List<LineaEntity> finsAll() {
        return (List<LineaEntity>) repository.findAll();
    }
}
