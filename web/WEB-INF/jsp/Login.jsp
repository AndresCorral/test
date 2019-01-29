<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<html lang="es">
<head>
    <title>SysLapp</title>
    <script> 
        function validate(){ 
            var username = document.LoginForm.Usuario.value; 
            var password = document.LoginForm.Password.value;
            if (username == null || username == ""){ 
                alert("El campo de usuario no puede quedar vacio!"); 
                return false; 
            }
            else if(password == null || password == ""){ 
                alert("El campo de la password no puede quedar vacio!"); 
                return false; 
            } 
        }
    </script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%
        String Context = request.getContextPath() + "";
        String Message = (String)request.getAttribute("errMessage");;
        out.println("<link rel='stylesheet'  type='text/css' href='" + Context + "/webapp/Default/css/estilos.css'>"
                   +"<script type='text/javascript' src='" + Context + "/webapp/Default/js/Index.js'></script>"
                   +"<script type='text/javascript' src='" + Context + "/webapp/Default/js/jquery-3.3.1.min.js'></script>");
    %>
</head>
<body class="body">
    <div class="contenedores">
        <div class="contenedor">
            <header>
                <% out.println("<img id='logo' src='" + Context + "/webapp/Default/images/logo1.png' alt='Geinem'>");%>
            </header>
            <article>
                SysLapp, es hora de llevar tu laboratorio a otro nivel, somos un app creada para solucionar diversos problemas que se presentan en los laboratorios bacteriologicos, manejo de analisis quimicos, automatizamos el preceso de resultados, manejo de inventarios, entre otros! 
            </article>
        </div>
    </div>
    
    <div class="contenedores azul">
        <div>
            <% out.println("<form method='post' action='" + Context + "/LoginServlet' name='LoginForm' onsubmit='return validate();'>"); %>
                <input id="Usuario" name="Usuario" type="text" placeholder="Usuario" required> <br>
                <input id="Password" name="Password" type="password" placeholder="Contraseña" required> <br>
                <input type="submit" id="Enviar" name="Enviar" value="Enviar" title="Acceder al sistema." onclick="ImprimirUsuario();">
            </form>
            <br>
            <br>
            <div style="text-align: center">
                <span style="color:red"><%=(Message == null) ? "": Message%>
                </span>
            </div>
        </div>
    </div>
</body>
</html>