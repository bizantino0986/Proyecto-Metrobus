package com.example.Examen02.controller.empleado;

import com.example.Examen02.entity.empleado.EmpleadoEntity;
import com.example.Examen02.entity.empleado.TipoEmpleado;
import com.example.Examen02.service.interfaces.empleado.EmpleadoService;
import com.example.Examen02.service.interfaces.empleado.TipoEmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/vistas/empleado")
public class EmpleadoController {

    @Autowired
    private EmpleadoService service;
    @Autowired
    private TipoEmpleadoService serviceTE;

    @GetMapping({"/lista", "/"})
    public String listarEmpleado (Model model) {
        List<EmpleadoEntity> empleadoList = service.findAll();
        model.addAttribute("titulo", "Empleados");
        model.addAttribute("empleados", empleadoList);
        return "/vistas/Empleado/empleadoVista";
    }

    @RequestMapping("/cuestionario")
    public String cuestionario (Model model) {
        EmpleadoEntity empleado = new EmpleadoEntity();
        List<TipoEmpleado> tipoEmpleadoList = serviceTE.listarTipoEmpleado();

        model.addAttribute("titulo", "Nuevo Empleado");
        model.addAttribute("empleado", empleado);
        model.addAttribute("tiposEmpleado", tipoEmpleadoList);
        return "/vistas/Empleado/cuestionario";
    }

    @PostMapping({"/save", "/save/"})
    public String guardar(@ModelAttribute EmpleadoEntity empleado) {
        if (empleado.getDireccion().getId_direccion() == 0) {
            empleado.getDireccion().setId_direccion(18);
        }
        service.save(empleado);
        return "redirect:/vistas/empleado/lista";
    }

    @RequestMapping("/actualizar/{id}")
    public String actualizar (@PathVariable("id") Integer id, Model model) {
        EmpleadoEntity empleado = service.findByID(id);
        List<TipoEmpleado> tipoEmpleadoList = serviceTE.listarTipoEmpleado();

        model.addAttribute("titulo", "Actualizacion de Empleado");
        model.addAttribute("empleado", empleado);
        model.addAttribute("tiposEmpleado", tipoEmpleadoList);

        return "/vistas/Empleado/cuestionario";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar (@PathVariable("id")Integer id) {
        service.delete(id);
        return "redirect:/vistas/empleado/lista";
    }
}
