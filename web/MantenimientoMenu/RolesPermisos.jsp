<%-- 
    Document   : PermisosMenuRoles
    Created on : 10-01-2018, 02:17:27 PM
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
        <div>
            <% Modelo.csRol rol = new csRol();

                ResultSet rs = rol.rolesUsuario();
                rs.beforeFirst();
                while (rs.next()) {
            %>
            <ul>
                <li name="listaRol" value="<%= rs.getString(1)%>"><a href="PermisosPorRol.jsp?rol=<%= rs.getString(1)%>"><%= rs.getString(2)%></li>
            </ul>
            <%
                }
            %>
        </div>
    </body>
</html>
