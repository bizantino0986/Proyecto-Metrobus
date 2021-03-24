package com.example.Examen02.controller.empleado;

import com.example.Examen02.entity.empleado.TipoEmpleado;
import com.example.Examen02.service.Implements.empleado.TipoEmpleadoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("vistas/tipo-empleado")
public class CuestionarioTipoEmpleadoController {

    @Autowired
    TipoEmpleadoServiceImpl tipoEmpleadoService;

    @RequestMapping("/cuestionario")
    public String cuestionarioTipoEmpleado (Model model) {
        TipoEmpleado tipoEmpleado =  new TipoEmpleado();

        model.addAttribute("titulo", "Nuevo tipo de empleado");
        model.addAttribute("tipoEmpleado", tipoEmpleado);

        return "/vistas/tipoEmpleado/cuestionario";
    }

    @PostMapping("/save")
    public String guardarTipoEmpleado (@ModelAttribute TipoEmpleado tipoEmpleado) {
        tipoEmpleadoService.guardarTipoEmpleado(tipoEmpleado);
        return "redirect:/vistas/tipo-empleado/lista";
    }

    @RequestMapping("/actualizar/{id}")
    public String actualizar(@PathVariable("id") int id, Model model) {

        TipoEmpleado tipoEmpleado = tipoEmpleadoService.buscarTipoEmpleado(id);

        model.addAttribute("titulo", "Actualizar tipo de empleado");
        model.addAttribute("tipoEmpleado", tipoEmpleado);

        return "/vistas/tipoEmpleado/cuestionario";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable("id") int id) {
        tipoEmpleadoService.eliminarTipoEmpleado(id);
        return "redirect:/vistas/tipo-empleado/lista";
    }
}

