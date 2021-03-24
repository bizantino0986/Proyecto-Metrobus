package com.example.Examen02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class IndexController {

    @RequestMapping({"/home", "/index", "/index/"})
    public String listarTipoEmpleado (Model model) {
        model.addAttribute("usuario", "juan");
        return "/vistas/index/index";
    }

}
