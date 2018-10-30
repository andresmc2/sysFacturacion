<%-- 
    Document   : Usuario
    Created on : 09-24-2018, 07:29:17 PM
    Author     : Andres
--%>

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
        <title>JSP Page</title>

        <style>
            .login{
                width: 400px;
                border: 1px solid #E1E1E1;
                border-radius: 4px;
                padding: 15px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
        </style>

    </head>
    <body>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <div class="login">
            <form action="../usuario.do" class="usuario form-horizontal">
                <input type="hidden" value="BuscarUsuario" name="opcionUsuario">
                <div class="form-header">
                    <p class="text-center"><h3 class="text-center">Buscar Usuario</h3></p>

                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Codigo:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="Codigo de Usuario" name="txtCodigoUsu">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Nombre:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="Nombre de Usuario" name="txtNombreUsu">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Apellido:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="Apellido de Usuario" name="txtApellidoUsu">
                    </div>
                </div>
                <div>
                    <span><p class="text-center">
                            <button type="submit" class="btn btn-primary btn-md">Buscar</button>
                            <button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#modalCancelar">Cancelar</button>
                        </p></span>
                </div>    
            </form>
        </div>
        <div class="modal fade" id="modalCancelar" role="dialog" tabindex="-1">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3><p class="text-center">Cancelar Operacion</p></h3>
                    </div>
                    <div class="modal-body">
                        <p class="text-center">
                            Presione Cancelar para salir del proceso o Anterior para Continuar 
                        </p>
                    </div>
                    <div class="modal-footer">
                        <p class="text-center" >
                            <button type="submit" class="btn btn-warning btn-md" data-dismiss="modal" aria-hidden="true">Anterior</button>
                            <a href="../PaginaPrincipal.jsp"><button type="submit" class="btn btn-warning btn-md">Cancelar</button></a>
                        </p>
                    </div>

                </div>
            </div>
        </div>
        <div>
            <
        </div>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
