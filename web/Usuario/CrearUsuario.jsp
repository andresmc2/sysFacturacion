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
        <div>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <%@include file="../WEB-INF/jspf/header.jspf" %>
        </nav>
        </div>
        <div class="col-xs-6 col-xs-offset-3 " id="cont">
            
            <form action="../usuario.do" method="POST" class="usuario form-horizontal" id="FormCrearUs">
                <input type="hidden" value="InsertarUsuario" name="opcionUsuario">
                <div class="form-header">
                    <h3 class="text-center">Crear un nuevo usuario</h3>
                </div>  <hr>
                <!--Nombre-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Nombre</label>
                    <div class="col-md-6  inputGroupContainer">
                      <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                          <input type="text" class="form-control" placeholder="Nombre de Usuario" name="txtCrearNombreUsu" id="nombre" data-minLength="5" data-error="some error" required >
                        </div>
                    </div>
                  </div>
                    <!--Apellido-->
                <div class="form-group">
                    <label class="col-md-4 control-label" >Apellido</label>
                    <div class="col-md-6  inputGroupContainer">
                      <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="txtCrearApellidoUsu" placeholder="Apellido de Usuario" class="form-control"  type="text" data-minLength="5" data-error="some error" required >
                      </div>
                    </div>
                  </div>
                
                <!--Password-->
                    <div class="form-group has-feedback">
                        <label for="password"  class="col-md-4 control-label">Contraseña </label>
                        <div class="col-md-6  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                    <input class="form-control" id="userPw" type="password" placeholder="Contraseña" name="txtCrearPassUsu" data-minLength="5" data-error="some error" required/>
                        <span class="glyphicon form-control-feedback"></span>
                        <span class="help-block with-errors"></span>
                        </div>
                     </div>
                    </div>

                      <div class="form-group has-feedback">
                    <label for="confirmPassword"  class="col-md-4 control-label">Confirmar contraseña</label>
                         <div class="col-md-6  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                    <input class="form-control {$borderColor}" id="userPw2" type="password" placeholder="Confirme la contraseña" 
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
                      <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <select name="usarioRol" class="form-control selectpicker" id="usuarioRol" data-minLength="5" data-error="some error" required>
                          <option value="" >Por favor seleccione un rol</option>
                          <%
                                csRol rol = new csRol();
                                csUsuario usu = new csUsuario();
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
                  </div>
                        <!--Estado-->
                        <div class="form-group">
                    <label class="col-md-4 control-label">Estado</label>
                    <div class="col-md-6 selectContainer">
                      <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <select name="usarioRol" class="form-control selectpicker" id="usuarioRol" data-minLength="5" data-error="some error" required>
                          <option value="" >Por favor seleccione un estado</option>
                          <option value="1" >No activo</option>                     
                          <option value="2">Activo</option>                           
                        </select>
                      </div>
                    </div>
                  </div>
                        <center>
                            
                            <span><input  type="submit" class="btn btn-primary btn-md" value="Guardar" >
                            <button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#modalCancelar">Cancelar</button>
                            </span></center><br>
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
        
<!--        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>-->
        <script src='../js/bootstrapvalidator.min.js'></script>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
 
<!--        <script src="js/index.js"></script>-->
        
        
        <script type="text/javascript">
 
   $(document).ready(function() {
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
                        min: 5,
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
