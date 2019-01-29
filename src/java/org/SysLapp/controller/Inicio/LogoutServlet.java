/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SysLapp.controller.Inicio;

/**
 *
 * @author Administrador
 */
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class LogoutServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
        HttpSession session = request.getSession(false); //Fetch session object
        if(session != null){
            session.invalidate();
            request.setAttribute("errMessage", "Cierre de sesión exitoso!");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("./WEB-INF/jsp/Login.jsp");
            requestDispatcher.forward(request, response);
        }
    }
}
