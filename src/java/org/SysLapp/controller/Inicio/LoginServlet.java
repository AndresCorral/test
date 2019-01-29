
package org.SysLapp.controller.Inicio;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.SysLapp.bean.LoginBean;
import org.SysLapp.dao.Inicio.LoginDao;
import org.SysLapp.dao.Administracion.EmpresasDao;
/**
 *
 * @author Administrador 
 */

@Controller
public class LoginServlet extends HttpServlet{
     
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Usuario = request.getParameter("Usuario");
        String Password = request.getParameter("Password");
        String Context = request.getContextPath();
        HttpSession Sesion = (HttpSession)request.getSession(true);
        Sesion.setAttribute("Uss", Usuario);
        LoginBean loginBean = new LoginBean(); 
        loginBean.setUserName(Usuario);
        loginBean.setPassword(Password);
        LoginDao loginDao = new LoginDao();
        String userValidate = loginDao.authenticateUser(loginBean);
        String Privilegio = loginDao.Privilegio(0);
        String[][] Empresas = EmpresasDao.ConsultarEmpresas();
        if(userValidate.equals("SUCCESS")){
            request.setAttribute("Usuario", Usuario); 
            if(Privilegio.equals("SuperAdmin")){
                request.setAttribute("Empresas", Empresas); 
            }
            request.getRequestDispatcher("./WEB-INF/jsp/Index" + Privilegio + "/index2.jsp").forward(request, response);
        }
        else{
            request.setAttribute("errMessage", userValidate);
            request.getRequestDispatcher("./WEB-INF/jsp/Login.jsp").forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("./WEB-INF/jsp/Login.jsp");
        requestDispatcher.forward(request, response);
    }
    
   
}
