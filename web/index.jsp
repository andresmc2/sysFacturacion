<%-- 
    Document   : index
    Created on : 09-16-2018, 10:51:48 PM
    Author     : Andres
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Modelo.csMenu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.csUsuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Franel SA DE CV</title>
        <meta charset="utf-8">

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>

        <%
            csUsuario datos = new csUsuario();
            csMenu menu = new csMenu();
            int i = 1;
        %>
        <!--Style -->


    </head>
    <body>

        <%@include file="WEB-INF/jspf/newjsp_1.jspf" %>

        <div class="container well" id="ContainerLogin">
            <center><img src="imagen/ic_login.jpg" alt="" class="img-circle"/></center>

            <form action="login.do"  method="POST" class="login">
                <div class="form-group">

                    <p  class="alert alert-danger" style="color:#ff0000;<c:if var="prueba" test="${Mensaje == null}" > display: none; </c:if>">${Mensaje}</p> 
                    <label for="exampleInputEmail1">Nombre de usuario</label>
                    <input type="text" class="form-control" id="txtUser" placeholder="Usuario" name="txtCodigo" data-error="some error" required>
                </div>

                <div class="form-group">
                    <label for="exampleInputPassword1">Contraseña</label>
                    <input type="password" class="form-control" id="Pass" placeholder="Contraseña" name="txtPass" data-error="some error" required>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="iniciado" name="iniciado"> Mantener iniciada la sesión
                    </label>
                </div>
                <p class="text-center">
                    <button class="btn btn-primary btn-block">Login</button>
                </p>     
            </form>
        </div>
    </body>
</html>
