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
                
            }
            body
            {
                background: #443F3E;
                padding-top: 125px;
            }
            #cont{
                background: #e9e9e9;
            }

        </style>

    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <%@include file="../WEB-INF/jspf/header.jspf" %>
        </nav>


        <form action="../usuario.do" method="POST" class="usuario form-horizontal" id="FormCrearUs">

            <div class="col-xs-6 col-xs-offset-3 " id="cont">

                <%
                    csUsuario user = new csUsuario();
                    try {
                        String Codigo = request.getParameter("id");
                        ResultSet resultado = user.obtenerUsuario(Integer.valueOf(Codigo));
                        if (resultado.next()) {
                            
                            user.setCodUsuario(resultado.getInt(1));
                            user.setNombreUsuario(resultado.getString(2));
                            user.setApellidoUsuario(resultado.getString(3));
                            user.setPassword(resultado.getString(4));
                            user.setIdRol(resultado.getInt(5));
                            user.setEstadoUsu(resultado.getInt(6));
                        }
                        request.setAttribute("user", user);
                    } catch (Exception e) {
                        out.print("error " + e);
                    }
                %>


                <div class="form-header" >
                    <h3 class="text-center">Actualizar usuario ${Mensaje}</h3>
                </div>  <hr>

                <input type="hidden" name="opcionUsuario" value="ActualizarUs">
                <div>
                    <!--CÓDIGO-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Cod</label>
                        <div class="col-md-6  inputGroupContainer">
                            <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" class="form-control" value="${user.codUsuario}" placeholder="Código de usuario" name="txtCod" readonly="">
                            </div>
                        </div>
                    </div>

                    <!--Nombre-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Nombre</label>
                        <div class="col-md-6  inputGroupContainer">
                            <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" class="form-control" value="${user.nombreUsuario}" placeholder="Nombre de Usuario" name="txtNombre" data-minLength="5" data-error="some error" required>
                            </div>
                        </div>
                    </div>

                    <!--Apellido-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Apellido</label>
                        <div class="col-md-6  inputGroupContainer">
                            <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" class="form-control" value="${user.apellidoUsuario}" placeholder="Apellido de Usuario" name="txtApellido" data-minLength="5" data-error="some error" required>
                            </div>
                        </div>
                    </div>

                    <!--Password-->
                    <div class="form-group has-feedback">
                        <label for="password"  class="col-md-4 control-label">Contraseña </label>
                        <div class="col-md-6  inputGroupContainer">
                            <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input type="text" class="form-control" value="${user.password}" placeholder="Ingrese Contraseña" name="txtPass" data-minLength="5" data-error="some error" required>
                                <span class="glyphicon form-control-feedback"></span>
                                <span class="help-block with-errors"></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group has-feedback">
                        <label for="confirmPassword"  class="col-md-4 control-label"> Confirmar contraseña</label>
                        <div class="col-md-6  inputGroupContainer">
                            <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                <input class="form-control {$borderColor}" id="userPw2"  type="password" placeholder="Confirme la contraseña" 
                                       name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                                       data-match-error="some error 2"
                                       required/>
                                <span class="glyphicon form-control-feedback"></span>
                                <span class="help-block with-errors"></span>
                            </div>
                        </div>
                    </div>

                    <!--ROL-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Rol de usuario</label>
                        <div class="col-md-6 selectContainer">
                            <input type="hidden" id='idRoll' value='${user.idRol}'>
                            <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <select id="usuarioRol" name="usarioRol" class="form-control selectpicker" data-minLength="5" data-error="some error" required>
                                    <%
                                        csRol rol = new csRol();

                                        ResultSet rs = rol.rolesUsuario();
                                        rs.beforeFirst();
                                        while (rs.next()) {
                                    %> 
                                    <option value="<%= rs.getString(1)%>" ><%= rs.getString(2)%></option>
                                    <%}
                                    %> 
                                </select>
                            </div>
                        </div>
                        <script>
                            function comenzar() {
                                var rolHidden = document.getElementById("idRoll");
                                var select = document.getElementById("usuarioRol");
                                select.value = rolHidden.value;

                                var estadoHidden = document.getElementById("idEstado");
                                var select = document.getElementById("usuarioEstadoid");
                                select.value = estadoHidden.value;
                            }

                            window.onload = comenzar;
                        </script>
                    </div>

                    <!--Estado-->
                    <div class="form-group">
                        <label class="col-md-4 control-label">Estado</label>
                        <div class="col-md-6 selectContainer">
                            <input type="hidden" id='idEstado' value='${user.estadoUsu}'>
                            <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                <select name="estadoUsu" class="form-control selectpicker" id="usuarioEstadoid" data-minLength="5" data-error="some error" required>
                                    <option value="1">Activo</option>
                                    <option value="2">Inactivo</option>
                                </select>
                            </div>
                        </div>

                    </div>

                    <center><span>
                            <a href="#modalGuardar" data-toggle="modal"> <input type="button" class="btn btn-primary btn-md" value="Guardar" ></a>
                            <button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#modalCancelar">Cancelar</button>
                        </span></center>    
                            <br>
                </div>
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
                                <a href=""><button type="submit" class="btn btn-warning btn-md">Sí</button></a>
                            </p><br>
                        </div>

                    </div>
                </div><br>
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
                            <a href="../Usuario/ListaUsuarios.jsp"><button type="submit" class="btn btn-default">Volver a la lista</button></a>
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
