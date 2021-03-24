package com.example.Examen02.controller.metrobus;

import com.example.Examen02.entity.empleado.EmpleadoEntity;
import com.example.Examen02.entity.metrobus.EstacionEntity;
import com.example.Examen02.entity.metrobus.LineaEntity;
import com.example.Examen02.service.interfaces.empleado.EmpleadoService;
import com.example.Examen02.service.interfaces.metrobus.EstacionService;
import com.example.Examen02.service.interfaces.metrobus.LineaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/vistas/estacion")
public class EstacionController {

    @Autowired
    private LineaService serviceL;
    @Autowired
    private EstacionService service;
    @Autowired
    private EmpleadoService serviceEmp;

    @GetMapping("/lista")
    public String listarEstacion(Model model){
        List<EstacionEntity> estaciones = service.findAll();

        model.addAttribute("titulo", "Estaciones");
        model.addAttribute("estaciones", estaciones);
        return "/vistas/metrobus/estacionVista";
    }

    @RequestMapping("/cuestionario")
    public String cuestinario (Model model) {

        EstacionEntity estacion = new EstacionEntity();
        List<LineaEntity> lineas = serviceL.finsAll();
        List<EmpleadoEntity> empleados = serviceEmp.findAll();

        empleados.removeIf(n -> (n.getTipoEmpleado().getId_tipo_empleado() != 10));

        model.addAttribute("titulo", "Nueva Estacion");
        model.addAttribute("estacion", estacion);
        model.addAttribute("lineas", lineas);
        model.addAttribute("empleados", empleados);

        return "/vistas/metrobus/cuestionario";
    }

    @PostMapping("/save")
    public String guardar (@ModelAttribute EstacionEntity estacion) {
        service.save(estacion);
        return "redirect:/vistas/estacion/lista";
    }

    @RequestMapping("/actualizar/{id}")
    public String actualizar (@PathVariable("id")Integer id, Model model) {

        EstacionEntity estacion = service.findByID(id);
        List<LineaEntity> lineas = serviceL.finsAll();
        List<EmpleadoEntity> empleados = serviceEmp.findAll();

        empleados.removeIf(n -> (n.getTipoEmpleado().getId_tipo_empleado() != 10));

        model.addAttribute("titulo", "Nueva Estacion");
        model.addAttribute("estacion", estacion);
        model.addAttribute("lineas", lineas);
        model.addAttribute("empleados", empleados);

        return "/vistas/metrobus/cuestionario";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar (@PathVariable("id")Integer id) {
        service.delete(id);
        return "redirect:/vistas/estacion/lista";
    }

}
