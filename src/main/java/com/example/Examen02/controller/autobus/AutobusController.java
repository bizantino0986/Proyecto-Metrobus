package com.example.Examen02.controller.autobus;

import com.example.Examen02.entity.autobus.AutobusEntity;
import com.example.Examen02.entity.autobus.TipoAutobusEntity;
import com.example.Examen02.entity.empleado.EmpleadoEntity;
import com.example.Examen02.entity.empleado.TipoEmpleado;
import com.example.Examen02.service.Implements.empleado.EmpleadoServiceImpl;
import com.example.Examen02.service.interfaces.autobus.AutobusService;
import com.example.Examen02.service.interfaces.autobus.TipoAutobusService;
import com.example.Examen02.service.interfaces.empleado.EmpleadoService;
import com.example.Examen02.service.interfaces.empleado.TipoEmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/vistas/autobus")
public class AutobusController {


    @Autowired
    private AutobusService service;
    @Autowired
    private TipoAutobusService serviceTA;
    @Autowired
    private EmpleadoServiceImpl serviceEM;

    @GetMapping({"/lista", "/"})
    public String listarEmpleado (Model model) {
        List<AutobusEntity> autobusList = service.findAll();

        model.addAttribute("titulo", "Autobusces");
        model.addAttribute("autobuces", autobusList);

        return "/vistas/autobus/autobusVista";
    }

    @RequestMapping("/cuestionario")
    public String cuestionario (Model model) {
        AutobusEntity autobus = new AutobusEntity();
        List<TipoAutobusEntity> tipos = serviceTA.findAll();
        List<EmpleadoEntity> empleados = serviceEM.findAll();

        empleados.removeIf(n -> (n.getTipoEmpleado().getId_tipo_empleado() != 1));

        model.addAttribute("titulo", "Nuevo Autobus");
        model.addAttribute("autobus", autobus);
        model.addAttribute("tiposAutobuces", tipos);
        model.addAttribute("empleados", empleados);

        return "/vistas/autobus/cuestionario";
    }

    @PostMapping({"/save", "/save/"})
    public String guardar(@ModelAttribute AutobusEntity autobus) {
        service.save(autobus);
        return "redirect:/vistas/autobus/lista";
    }

    @RequestMapping("/actualizar/{id}")
    public String actualizar (@PathVariable("id")Integer id, Model model) {
        AutobusEntity autobus = service.findByID(id);
        List<TipoAutobusEntity> tipos = serviceTA.findAll();
        List<EmpleadoEntity> empleados = serviceEM.findAll();

        empleados.removeIf(n -> (n.getTipoEmpleado().getId_tipo_empleado() != 1));

        model.addAttribute("titulo", "Nuevo Autobus");
        model.addAttribute("autobus", autobus);
        model.addAttribute("tiposAutobuces", tipos);
        model.addAttribute("empleados", empleados);

        return "/vistas/autobus/cuestionario";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar (@PathVariable("id")Integer id) {
        service.delete(id);
        return "redirect:/vistas/autobus/lista";
    }

}
