package com.example.Examen02.service.Implements.direccion;


import com.example.Examen02.entity.direccion.Direccion;
import com.example.Examen02.repository.direccion.DireccionRepository;
import com.example.Examen02.service.interfaces.direccion.DireccionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DireccionServiceImpl implements DireccionService {

    @Autowired
    private DireccionRepository direccionRepository;

    @Override
    public List<Direccion> listarDirecciones() {
        return (List<Direccion>) direccionRepository.findAll();
    }

    @Override
    public void guardarDireccion(Direccion direccion) {
        direccionRepository.save(direccion);
    }

    @Override
    public Direccion buscarDireccion(int id) {
        return direccionRepository.findById(id).orElse(null);
    }

    @Override
    public void eliminarDireccion(int id) {
        direccionRepository.deleteById(id);
    }
}
