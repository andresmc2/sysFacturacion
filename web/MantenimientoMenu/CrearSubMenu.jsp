<%-- 
    Document   : CrearUsuario
    Created on : 09-27-2018, 07:36:50 PM
    Author     : Andres
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.csRol"%>
<%@page import="Modelo.csUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Actualizar Usuario</title>

        <style>
            .login{
                width: 700px;
                border: 1px solid #E1E1E1;
                border-radius: 4px;
                padding: 15px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            body
            {
                background: #E1DBDA;
            }
            #cont{
                background: #e9e9e9;
            }
        </style>

    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <%@include file="../WEB-INF/jspf/header.jspf" %>
        </nav>


        <form action="${pageContext.request.contextPath}/servletsubmenu.do" method="POST" class="usuario form-horizontal" id="FormCrearUs">
            <input type="hidden" value="InsertarSubMenu" name="opcionSubMenu">
            <div class="login" id="cont">
                <div class="form-header" >
                    <h3 class="text-center">Crear nuevo subMenú</h3>
                </div>  <hr>
                <% String Mensaje = request.getParameter("Mensaje");
                   request.setAttribute("Mensaje", Mensaje);
                %>
                
                <center><p  class="alert alert-info" style="color:#0066ff;  <c:if var="prueba" test="${Mensaje == null}" > display: none; </c:if>">${Mensaje}</p></center> 
                
                

                <!--Nombre del subMenú-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Nombre del subMenú</label>
                    <div class="col-md-6  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" class="form-control"  placeholder="Ingrese el nombre del subMenú" name="txtCrearSubMenu" data-minLength="5" data-error="some error" required>
                        </div>
                    </div>
                </div>

                <!--URL-->
                <div class="form-group">
                    <label class="col-md-4 control-label" >URL del subMenú</label>
                    <div class="col-md-6  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" class="form-control" placeholder="Ingrese la dirección del subMenú" name="txtCrearLinkSub" data-minLength="5" data-error="some error" required>
                        </div>
                    </div>
                </div>

                <!--ROL-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Menú asociado</label>
                    <div class="col-md-6 selectContainer">

                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                            <select  name="menuAsociado" class="form-control selectpicker" data-minLength="5" data-error="some error" required>
                                <option value="">--Seleccione un Menu Asociado--</option>
                                <%
                                    csMenu menulista = new csMenu();
                                    ResultSet rs = menulista.menu();
                                    rs.beforeFirst();
                                    while (rs.next()) {
                                %> 
                                <option value="<%= rs.getString(1)%>" ><%= rs.getString(2)%></option>
                                <%}
                                %>   
                            </select>
                        </div>
                    </div>

                </div>

                <!--Password-->
                <div class="form-group has-feedback">
                    <label for="password"  class="col-md-4 control-label">Por favor confirme contraseña</label>
                    <div class="col-md-6  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <input type="text" class="form-control"  placeholder="Ingrese Contraseña" name="txtPass" data-minLength="5" data-error="some error" required>
                            <span class="glyphicon form-control-feedback"></span>
                            <span class="help-block with-errors"></span>
                        </div>
                    </div>
                </div>
                
                
                
                <center><span>
                        <a href="#modalGuardar" data-toggle="modal"> <input type="button" class="btn btn-primary btn-md" value="Guardar" ></a>
                        <button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#modalCancelar">Cancelar</button>
                        <br><a href="../MantenimientoMenu/RolesPermisos.jsp" class="btn btn-link">Ver roles y permisos</a>
                    </span></center>    
            </div>
            <div class="modal fade" id="modalGuardar" role="dialog" tabindex="-1">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h3>¿Guardar cambios?</h3></center>   
                        </div>
                        <div class="modal-body">
                            <p class="text-center">
                                Si actualiza los datos, no será posible cambiarlos al estado anterior
                            </p>
                        </div>
                        <div class="modal-footer">
                            <p class="text-center" >
                                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                                <button type="submit" class="btn btn-warning btn-md">Sí</button>
                            </p>
                        </div>

                    </div>
                </div>
            </div>

        </form>

        <div class="modal fade" id="modalCancelar" role="dialog" tabindex="-1">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <center><h3>¿Desea abandonar la página actual?</h3></center>   
                    </div>
                    <div class="modal-body">
                        <p class="text-center">
                            Presione Cancelar para salir del proceso o Anterior para Continuar 
                        </p>
                    </div>
                    <div class="modal-footer">
                        <p class="text-center" >
                            <button type="submit" class="btn btn-warning btn-md" data-dismiss="modal" aria-hidden="true">Permanecer aquí</button>
                            <a href="../PaginaPrincipal.jsp"><button type="submit" class="btn btn-default">Volver al inicio</button></a>
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
