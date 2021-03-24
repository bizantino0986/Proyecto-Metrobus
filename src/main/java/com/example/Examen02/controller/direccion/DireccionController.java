package com.example.Examen02.controller.direccion;

import com.example.Examen02.entity.direccion.Direccion;
import com.example.Examen02.service.interfaces.direccion.DireccionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/vistas/direccion")
public class DireccionController {

    @Autowired
    private DireccionService direccionService;

    @GetMapping("/lista")
    public String listaDirecciones(Model model) {
        List<Direccion> listDirecciones = direccionService.listarDirecciones();

        model.addAttribute("titulo", "Direcciones");
        model.addAttribute("direcciones", listDirecciones);

        return "/vistas/direccion/listarDirecciones";
    }
}
