package com.example.Examen02.service.Implements.direccion;


import com.example.Examen02.entity.direccion.Colonia;
import com.example.Examen02.repository.direccion.ColoniaRepository;
import com.example.Examen02.service.interfaces.direccion.ColoniaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ColoniaServiceImpl implements ColoniaService {

    @Autowired
    private ColoniaRepository coloniaRepository;

    @Override
    public List<Colonia> listaColonias() {
        return (List<Colonia>) coloniaRepository.findAll();
    }
}
