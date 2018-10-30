<%-- 
    Document   : PaginaPrincipal
    Created on : 09-24-2018, 01:50:24 PM
    Author     : Andres
--%>

<%@page session="true" %>
<%@page import="Modelo.csMenu"%>
<%@page import="Modelo.csUsuario"%>
<%@page import="Controlador.NewClass" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Menu Principal</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */ 
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }

            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {height: 450px}

            /* Set gray background color and 100% height */
            .sidenav {
                padding-top: 20px;
                background-color: #f1f1f1;
                height: 100%;
            }

            /* Set black background color, white text and some padding */
            footer {
                background-color: #555;
                color: white;
                padding: 15px;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 767px) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {height:auto;} 
            }
        </style>
        <%

            if ((csUsuario) session.getAttribute("User") != null) {
                csUsuario ob = (csUsuario) session.getAttribute("User");
                int codUsu = ob.getCodUsuario();
                csMenu menu = new csMenu();
        %>

    </head>
    <body>
        <!-- TOP BAR -->

        <%--<%@include file="WEB-INF/jspf/jspfCerrSes.jspf" %>--%>
        <nav class="navbar navbar-inverse"  >
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" >
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="PaginaPrincipal.jsp">Ferreteria Franel</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li ><a href="#">Inicio</a></li>
                            <%=menu.mostrarListaMenu(ob.getIdRol(), application)%>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <%--<%@include file='WEB-INF/jspf/jspfCerrSes.jspf' %>--%>

                        <li><a href="#myModal" data-toggle="modal" ><span class="glyphicon glyphicon-log-out"></span>Cerrar Sesión</a></li>
                    </ul>

                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog modal-sm">


                            <div class="modal-content" margin="500" >
                                <div class="modal-header" >
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <center><h4 class="modal-title">¿Desea cerrar sesión?</h4></center>  
                                </div>
                                <div class="modal-body">

                                    <%out.print("<div>");
                                     out.print("<center>");%>                                            
                                    <button type="submit" class="btn btn-warning btn-md" data-dismiss="modal">Cancelar</button>                                       
                                    <%@include file="WEB-INF/jspf/jspfCerrSes.jspf"%>                                    
                                </div>	  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <!-- END TOP VAR -->

        <div class="container-fluid text-center">    
            <div class="row content">
                <div class="col-sm-2 sidenav">
                    <p><a href="#">Link</a></p>
                    <p><a href="#">Link</a></p>
                    <p><a href="#">Link</a></p>
                </div>
                <div class="col-sm-8 text-center">
                    <p class="text-center"><h3>Bienvenid@ <b><% out.print(ob.getNombreUsuario() + " " + ob.getApellidoUsuario()); %></b></h1></p>
                </div>
                <div class="col-sm-2 sidenav">
                    <div class="well">
                        <p>ADS</p>
                    </div>
                    <div class="well">
                        <p>ADS</p>
                    </div>
                </div>
            </div>
        </div>

        <footer class="container-fluid text-center">
            <p>Progra 4 Inc.<br> Todos los derechos reservados</p>
        </footer>
        <%} else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }%>
    </body>
</html>
