/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SysLapp.controller.Inicio;

import javax.servlet.http.HttpServlet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Administrador
 */
@Controller
public class InicioServlet extends HttpServlet{
    
    @RequestMapping(value = "/")
    public String welcome(Model model){
        return "Home";
    }
}
