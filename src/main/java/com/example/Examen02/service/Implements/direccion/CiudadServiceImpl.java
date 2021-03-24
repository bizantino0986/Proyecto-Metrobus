package com.example.Examen02.service.Implements.direccion;



import com.example.Examen02.entity.direccion.Ciudad;
import com.example.Examen02.repository.direccion.CiudadRepository;
import com.example.Examen02.service.interfaces.direccion.CiudadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CiudadServiceImpl implements CiudadService {

    @Autowired
    private CiudadRepository ciudadRepository;

    @Override
    public List<Ciudad> listaCiudades() {
        return (List<Ciudad>) ciudadRepository.findAll();
    }
}
