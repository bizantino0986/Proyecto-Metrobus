package com.example.Examen02.service.interfaces.direccion;



import com.example.Examen02.entity.direccion.Direccion;

import java.util.List;

public interface DireccionService {
    public List<Direccion> listarDirecciones();
    public void guardarDireccion(Direccion direccion);
    public Direccion buscarDireccion(int id);
    public void eliminarDireccion(int id);

}

