package com.example.Examen02.repository.autobus;

import com.example.Examen02.entity.autobus.AutobusEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AutobusRepositoy extends CrudRepository<AutobusEntity, Integer> {
}
