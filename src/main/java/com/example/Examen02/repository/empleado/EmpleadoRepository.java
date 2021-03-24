package com.example.Examen02.repository.empleado;

import com.example.Examen02.entity.empleado.EmpleadoEntity;
import org.springframework.data.repository.CrudRepository;

public interface EmpleadoRepository extends CrudRepository<EmpleadoEntity, Integer> {
}
