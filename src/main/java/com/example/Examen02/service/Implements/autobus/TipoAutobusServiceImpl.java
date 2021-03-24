package com.example.Examen02.service.Implements.autobus;

import com.example.Examen02.entity.autobus.TipoAutobusEntity;
import com.example.Examen02.repository.autobus.TipoAutobusRepository;
import com.example.Examen02.service.interfaces.autobus.TipoAutobusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TipoAutobusServiceImpl implements TipoAutobusService {

    @Autowired
    private TipoAutobusRepository repository;

    @Override
    public List<TipoAutobusEntity> findAll() {
        return (List<TipoAutobusEntity>) repository.findAll();
    }

    @Override
    public void save(TipoAutobusEntity autobus) {
        repository.save(autobus);
    }

    @Override
    public TipoAutobusEntity findByID(Integer id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void delete(Integer id) {
        repository.deleteById(id);
    }
}
