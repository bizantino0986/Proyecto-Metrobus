package com.example.Examen02.service.interfaces.empleado;



import com.example.Examen02.entity.empleado.TipoEmpleado;

import java.util.List;


public interface TipoEmpleadoService {
    public List<TipoEmpleado> listarTipoEmpleado();
    public void guardarTipoEmpleado(TipoEmpleado tipoEmpleado);
    public TipoEmpleado buscarTipoEmpleado(int id);
    public void eliminarTipoEmpleado(int id);
}
