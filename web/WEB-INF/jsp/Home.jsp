<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>HOME PAGE</h1>
        <% String Context = (String)request.getContextPath();
            out.println("<a href='" + Context + "/LoginServlet'>LOGIN</a>"); 
        %>
    </body>
</html>
