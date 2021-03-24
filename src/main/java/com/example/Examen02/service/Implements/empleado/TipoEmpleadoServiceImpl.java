package com.example.Examen02.service.Implements.empleado;


import com.example.Examen02.entity.empleado.TipoEmpleado;
import com.example.Examen02.repository.empleado.TipoEmpleadoRepository;
import com.example.Examen02.service.interfaces.empleado.TipoEmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TipoEmpleadoServiceImpl implements TipoEmpleadoService {

    @Autowired
    private TipoEmpleadoRepository tipoEmpleadoRepository;

    @Override
    public List<TipoEmpleado> listarTipoEmpleado() {
        return (List<TipoEmpleado>) tipoEmpleadoRepository.findAll();
    }

    @Override
    public void guardarTipoEmpleado(TipoEmpleado tipoEmpleado) {
        tipoEmpleadoRepository.save(tipoEmpleado);
    }

    @Override
    public TipoEmpleado buscarTipoEmpleado(int id) {
        return tipoEmpleadoRepository.findById(id).orElse(null);
    }

    @Override
    public void eliminarTipoEmpleado(int id) {
        tipoEmpleadoRepository.deleteById(id);
    }
}
