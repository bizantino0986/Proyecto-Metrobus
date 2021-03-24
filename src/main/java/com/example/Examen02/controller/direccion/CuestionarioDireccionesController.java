package com.example.Examen02.controller.direccion;

import com.example.Examen02.entity.direccion.Ciudad;
import com.example.Examen02.entity.direccion.Colonia;
import com.example.Examen02.entity.direccion.Direccion;
import com.example.Examen02.service.interfaces.direccion.ColoniaService;
import com.example.Examen02.service.Implements.direccion.CiudadServiceImpl;
import com.example.Examen02.service.Implements.direccion.DireccionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/vistas/direccion")
public class CuestionarioDireccionesController {

    @Autowired
    private DireccionServiceImpl direccionService;
    @Autowired
    private CiudadServiceImpl ciudadService;
    @Autowired
    private ColoniaService coloniaService;

    @RequestMapping("/cuestionario")
    public String cuestionarioDirecciones (Model model) {

        Direccion direccion = new Direccion();
        List<Ciudad> ciudades = ciudadService.listaCiudades();
        List<Colonia> colonias = coloniaService.listaColonias();

        model.addAttribute("titulo", "Nueva direccion");
        model.addAttribute("direccion", direccion);
        model.addAttribute("ciudades", ciudades);
        model.addAttribute("colonias", colonias);


        return "/vistas/direccion/cuestionario";
    }

    @PostMapping("/save")
    public String guardar(@ModelAttribute Direccion direccion) {
        direccionService.guardarDireccion(direccion);
        return "redirect:/vistas/direccion/lista";
    }

    @RequestMapping("/actualizar/{id}")
    public String actualizar(@PathVariable("id") int id, Model model) {

        Direccion direccion = direccionService.buscarDireccion(id);
        List<Ciudad> ciudades = ciudadService.listaCiudades();
        List<Colonia> colonias = coloniaService.listaColonias();

        model.addAttribute("titulo", "Actualizar direccion");
        model.addAttribute("direccion", direccion);
        model.addAttribute("ciudades", ciudades);
        model.addAttribute("colonias", colonias);


        return "/vistas/direccion/cuestionario";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable("id")int id) {
        direccionService.eliminarDireccion(id);
        return "redirect:/vistas/direccion/lista";
    }
}