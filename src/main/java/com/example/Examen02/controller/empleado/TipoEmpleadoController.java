package com.example.Examen02.controller.empleado;

import com.example.Examen02.entity.empleado.TipoEmpleado;
import com.example.Examen02.service.interfaces.empleado.TipoEmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/vistas/tipo-empleado")
public class TipoEmpleadoController {

    @Autowired
    private TipoEmpleadoService tipoEmpleadoService;

    @GetMapping("/lista")
    public String listarTipoEmpleado (Model model) {
        List<TipoEmpleado> tipoEmpleadoList = tipoEmpleadoService.listarTipoEmpleado();
        model.addAttribute("titulo", "Tipos de empleado");
        model.addAttribute("tiposEmpleados",tipoEmpleadoList);
        return "/vistas/tipoEmpleado/listaTipoEmpleado";
    }
}
