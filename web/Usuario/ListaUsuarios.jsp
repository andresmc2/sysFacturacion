<%-- 
    Document   : ListaUsuarios
    Created on : 3/10/2018, 03:17:11 PM
    Author     : William Vasquez
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.csRol"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.csUsuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="../css/newcss.css" rel="stylesheet" type="text/css"/>

        <script src="../js/BuscadorTabla.js" type="text/javascript"></script>

        <title>Lista de Usuario</title>

        <style>
            #calculator {
                width: 325px;
                height: auto;
                margin: 0px auto;
                padding: 20px 20px 9px;
                background: #9dd2ea;
                background: linear-gradient(rgba(171, 183, 241, 0.87), #8bceec);
                border-radius: 20px;
                box-shadow: 0px 4px rgba(0, 104, 136, 0.53), 0px 10px 15px rgba(0, 0, 0, 0.2);
            }
            /* Clear floats */
            .keys, .top {overflow: hidden;}
        </style>

    </head>
    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <%@include file="../WEB-INF/jspf/header.jspf" %>
        </nav>


        <%@include file="../WEB-INF/jspf/TraerListaUs.jspf" %>

        <div class="datagrid" > 
            <div class="modal fade" id="modalNE" role="dialog" tabindex="-1">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h3>¿Desea eliminar el registro?</h3></center>  
                        </div>
                        <div class="modal-body">
                            <p class="text-center">
                                Si elimina el registro, no será posible recuperarlo
                            </p>
                        </div>
                        <div class="modal-footer">
                            <form action="../usuario.do"  method="post" >
                                <p class="text-center" >
                                    <input type="hidden" value='' name='cod' id='cod'>
                                    <input type="hidden" value='EliminarUs' name='opcionUsuario'>
                                    <button type="button"  class="btn btn-warning btn-md" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                                    <input type="submit" value="Sí" class="btn btn-default">
                                </p>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalFiltros" role="dialog" tabindex="-1" >
                <div class="modal-dialog modal-sm" role="document" style="width:  300px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <center><h3>Filtros</h3></center>  
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <h4>N°Registros</h4>
                                <select name="state" id="maxRows" class="form-control" style="width: 100px;">
                                    <option value="5000">Ver todo</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="75">75</option>
                                    <option value="100">100</option>
                                </select>

                            </div>          
                        </div> 

                        <div class="modal-footer">


                            <center><button type="button"  class="btn btn-success" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-ok" ></span></center>                                            
                        </div>

                    </div>
                </div>
            </div>




            <div class="container well" id="ContainerLista"  >




                <input class="text-info" id="txtBuscar" type="text" onkeyup="Buscar()" placeholder="Buscar" >
                <a href="#modalFiltros" data-toggle="modal" class="btn-link" style="margin-left: 200px">Filtrar</a>
                <a class="btn btn-primary" href="CrearUsuario.jsp" role="button" id="btnInsert">Nuevo usuario</a>
                <table class="table table-responsive" id="lista" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th scope="col"><center>Código</center></th>
                    <th scope="col"><center>Nombres</center></th>
                    <th scope="col"><center>Apellidos</center></th>
                    <th scope="col"><center>Contraseña</center></th>                               
                    <th scope="col"><center>Rol</center></th>
                    <th scope="col"><center>Estado</center></th>

                    <th scope="col"><center>Actualizar</center></th>
                    </tr>
                    </thead>    
                    <tbody>
                        <c:forEach items="${lista}" var="n">
                            <tr>
                                <th scope="row"><center>${n.codUsuario}</center></th>
                        <td><center>${n.nombreUsuario}</center></td>
                        <td><center>${n.apellidoUsuario}</center></td>
                        <td><center>${n.password}</center></td>

                        <td><center>${n.nombreRol}</center></td>
                        <td><center><c:if test="${n.estadoUsu == 1}">Activo</c:if><c:if test="${n.estadoUsu != 1}">Inactivo</c:if></center></td>
                            <script type="text/javascript">
                                function CambiarValor(userId)
                                {
                                    var hiddenCod = document.getElementById("cod");
                                    hiddenCod.value = userId;
                                }
                            </script>

<!--                            <td style="text-align: center">
                                
                                    <button  <c:if test="${n.idRol == 1 && n.codUsuario == User.codUsuario}">disabled</c:if> class="btn btn-warning" data-toggle="modal" onclick="CambiarValor('${n.codUsuario}')" data-target='#modalNE'>
                                    <span class="glyphicon glyphicon-trash" ></span>
                                    
                            </td>-->

                            <td style="text-align: center">
                                <a  class="btn btn-warning" 
                                    href="ActualizarUsuario.jsp?id=${n.codUsuario}" role="button">
                                <span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </td>
                        </tr>
                    </c:forEach>



                    </tbody>
                </table>
                <div class="pagination-container">
                    <nav>
                        <ul class="pagination" ></ul>

                    </nav>
                </div>
            </div>
        </div>
    
        <script src="../js/jquery.min.js"></script>

        <script>
                                        var table = '#lista';
                                        $('#maxRows').on('change', function () {
                                            $('.pagination').html('');
                                            var trnum = 0;
                                            var maxRows = parseInt($(this).val());
                                            var totalRows = $(table + ' tbody tr').length;
                                            $(table + ' tr:gt(0)').each(function () {
                                                trnum++;
                                                if (trnum > maxRows) {
                                                    $(this).hide();
                                                }
                                                if (trnum <= maxRows) {
                                                    $(this).show();
                                                }
                                            });
                                            if (totalRows > maxRows) {
                                                var pagenum = Math.ceil(totalRows / maxRows);
                                                for (var i = 1; i <= pagenum; ) {
                                                    $('.pagination').append('<li data-page="' + i + '">\<span>' + i++ + '<span class="sr-only">(current)</span></span>\</li>').show();
                                                }
                                            }
                                            $('.pagination li:first-child').addClass('active');
                                            $('.pagination li').on('click', function () {
                                                var pageNum = $(this).attr('data-page');
                                                var trIndex = 0;
                                                $('.pagination li').removeClass('active');
                                                $(this).addClass('active');
                                                $(table + ' tr:gt(0)').each(function () {
                                                    trIndex++;
                                                    if (trIndex > (maxRows * pageNum) || trIndex <= ((maxRows * pageNum) - maxRows)) {
                                                        $(this).hide();
                                                    } else {
                                                        $(this).show();
                                                    }
                                                });
                                            });
                                        });
                                        
        </script>
    </body>
</html>
