<%-- 
    Document   : MantenimientoMenu
    Created on : 09-28-2018, 10:32:46 PM
    Author     : Andres
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.csRol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../WEB-INF/jspf/headTitle.jspf" %>
    <body>
        <nav class="navbar navbar-inverse">
            <%@include file="../WEB-INF/jspf/header.jspf" %>
        </nav>
        
        <div class="login text-center">
            <form action="${pageContext.request.contextPath}/servletmenu.do" method="POST" class="usuario form-horizontal">
                <input type="hidden" value="InsertarMenu" name="opcionMenu">
                <div class="form-header">
                    <p class="text-center"><h3 class="text-center">Añadir Menu</h3></p>

                </div>                
                <div class="form-group">
                    <label class="control-label col-sm-3">Nombre de Menu:</label>
                    <div class="col-xs-6">
                        <input type="text" class="form-control" placeholder="Nombre de Nuevo Menu" name="txtCrearMenu" required>
                    </div>
                </div>
                
                <div>
                    <span><p class="text-center">
                            <input type="submit" class="btn btn-primary btn-md" value="Guardar">
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
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
        <!-- OTRO-->
        
        
        
        <!-- FIN OTRO -->

        <footer class="container-fluid text-center">
            <p>Progra 4 Inc.<br> Todos los derechos reservados</p>
        </footer>
    </body>
</html>
