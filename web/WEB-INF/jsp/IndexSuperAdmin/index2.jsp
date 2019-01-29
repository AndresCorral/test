
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%
            String Context = request.getContextPath() + "";
            String[][] Empresas = (String[][])request.getAttribute("Empresas");
            out.println("<meta charset='UTF-8'>"+
                        "<title>SysLapp</title>"+
                        "<link rel='stylesheet' href='" + Context + "/webapp/Default/css/estilos.css'>");
        %>
    </head>
    <body> 
        <nav class="nav">
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Empresas</a></li>
                <li><a href="#">Usuarios</a></li>
                <li><a href="#">Licencias</a></li>
                <li><a href="#">Formatos</a></li>
                <li><a href="#">Parámetros</a></li>
                <li><a href="#">Funciones</a></li>
                <li><a href="#">Actualizaciones</a></li>
                <li class="right">
                    <form action="">
                        <input type="text" placeholder="Buscar">
                        <input type="button" value="Enviar">
                    </form>
                </li>
                <%
                    out.println("<li class='right'><img src='" + Context + "/webapp/Default/images/noti.png' alt=''></li>"+
                                "<li class='right'><img src='" + Context + "/webapp/Default/images/conf.png' alt=''></li>");
                %>
                <div style="clear: both;"></div>
            </ul>
        </nav>
        <div style="clear: both;"></div>
        <section class="sadmin">
            <!-- Lado izquierdo de la pagina -->
            <div class="izquierdo">
                <%
                    for (int i = 0; i < Empresas.length; i++) {
                        out.println("<div class='personas'>"+
                                        "<a href='#'>"+
                                            "<img src='" + Context + Empresas[i][5] + "' alt='' height='100px'>"+
                                            "<div>"+
                                                 "<p>"+
                                                    "Nombre: " + Empresas[i][1] + "<br>"+
                                                    "Dirección: " + Empresas[i][3] + "<br>"+
                                                    "Teléfono: " + Empresas[i][2] + "<br>"+
                                                    "Email: " + Empresas[i][4] + "<br>"+
                                                    "NIT: " + Empresas[i][0] + "<br>"+
                                                 "</p>"+
                                            "</div>"+
                                        "</a>"+
                                    "</div>");
                    }
                %>
            </div>
            <!-- Lado derecho de la pagina -->
            <div class="derecho">
                <%
                    out.println("<img src='" + Context + "/webapp/Default/images/estadistica.jpg' alt=''>");
                %>
            </div>
        </section>
    </body>
</html>