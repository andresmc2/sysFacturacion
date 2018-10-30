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
        <title>Añadir Usuario</title>

        <style>
            .login{
                width: 800px;
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


        <div class="login" id="cont">
            <form action="../usuario.do" method="POST" class="usuario form-horizontal" id="FormCrearUs">
                <input type="hidden" value="InsertarUsuario" name="opcionUsuario">
                <div class="form-header">
                    <h3 class="text-center">Creación de Cliente Nuevo</h3>
                </div>  <hr>
                <table>
                    <tr>
                        <td>

                            <!--Estado-->
                            <div class="form-group">
                                <label class="col-md-4 control-label">Tipo de Cliente</label>
                                <div class="col-md-6 selectContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                        <select name="usarioRol" class="form-control selectpicker" id="usuarioRol" data-minLength="5" data-error="some error" required>
                                            <option value="" >Seleccione tipo de cliente</option>
                                            <option value="1" >Natural</option>                     
                                            <option value="2">Juridico</option>                           
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!--Primer Nombre-->
                            <div class="form-group">
                                <label class="col-md-4 control-label">Primer Nombre</label>
                                <div class="col-md-6  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input type="text" class="form-control" placeholder="Primer Nonbre" name="txtCrearNombreUsu" id="primerNombre" data-minLength="5" data-error="some error" required >
                                    </div>
                                </div>
                            </div>
                            <!--Segundo Nombre-->
                            <div class="form-group">
                                <label class="col-md-4 control-label">Segundo Nombre</label>
                                <div class="col-md-6  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input type="text" class="form-control" placeholder="Segundo Nombre" name="txtCrearNombreUsu" id="segundoNombre" data-minLength="5" data-error="some error" required >
                                    </div>
                                </div>
                            </div>
                            <!--Primer Apellido-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" >Primer Apellido</label>
                                <div class="col-md-6  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="txtCrearApellidoUsu" placeholder="Primer Apellido" class="form-control"  type="text" data-minLength="5" data-error="some error" required >
                                    </div>
                                </div>
                            </div>
                            <!--Segundo Apellido-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" >Segundo Apellido</label>
                                <div class="col-md-6  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="txtCrearApellidoUsu" placeholder="Segundo Apellido" class="form-control"  type="text" data-minLength="5" data-error="some error" required >
                                    </div>
                                </div>
                            </div>
                            <!--Apellido de Casada-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" >Apellido de Casada</label>
                                <div class="col-md-6  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="txtCrearApellidoUsu" placeholder="Apellido de Casada" class="form-control"  type="text" data-minLength="5" data-error="some error" required >
                                    </div>
                                </div>
                            </div>                                
                    <center>

                        <span><input  type="submit" class="btn btn-primary btn-md" value="Guardar" >
                            <button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#modalCancelar">Cancelar</button>
                        </span></center>
            </form> 
        </div>    


        <div class="modal fade" id="modalCancelar" role="dialog" tabindex="-1">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <center><h3>Cancelar Operacion</h3></center>
                    </div>
                    <div class="modal-body">
                        <p class="text-center">
                            Presione Cancelar para salir del proceso o Anterior para Continuar 
                        </p>
                    </div>
                    <div class="modal-footer">
                        <p class="text-center" >
                            <button type="submit" class="btn btn-warning btn-md" data-dismiss="modal" aria-hidden="true">Anterior</button>
                            <a href="../Usuario/ListaUsuarios.jsp"><button type="submit" class="btn btn-warning btn-md">Cancelar</button></a>
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </td>
</tr>
</table>

<!--        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>-->
<script src='../js/bootstrapvalidator.min.js'></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!--        <script src="js/index.js"></script>-->


<script type="text/javascript">

    $(document).ready(function () {
        $('#cont').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                txtCrearNombreUsu: {
                    validators: {
                        stringLength: {
                            min: 3,
                        },
                        notEmpty: {
                            message: 'Por favor ingrese sus nombres'
                        }
                    }
                },
                txtCrearApellidoUsu: {
                    validators: {
                        stringLength: {
                            min: 3,
                        },
                        notEmpty: {
                            message: 'Por favor ingrese sus apellidos'
                        }
                    }
                },

                usuarioRol: {
                    validators: {
                        notEmpty: {
                            message: 'Por favor seleccione un rol'
                        }
                    }
                },
                usuarioEstado: {
                    validators: {
                        notEmpty: {
                            message: 'Por favor seleccione un estado'
                        }
                    }
                },
                txtCrearPassUsu: {
                    validators: {
                        identical: {
                            field: 'confirmPassword',
                            message: 'Por favor, confirme su contraseña en la caja de texto de abajo'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        identical: {
                            field: 'txtCrearPassUsu',
                            message: 'Las contraseñas no coinciden'
                        }
                    }
                }


            }
        })
    });
</script>
</body>
</html>
