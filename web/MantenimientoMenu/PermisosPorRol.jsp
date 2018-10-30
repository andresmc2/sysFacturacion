<%-- 
    Document   : PermisosPorRol
    Created on : 10-01-2018, 02:44:48 PM
    Author     : Andres
--%>
<%@page import="Modelo.persimosRoles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../WEB-INF/jspf/headTitle.jspf" %>
    <body>
        <%
            String rol = request.getParameter("rol");
            request.setAttribute("rol", rol);
            persimosRoles per = new persimosRoles();
            int idRrol = Integer.parseInt(rol);

        %>
        <nav class="navbar navbar-inverse">
            <%@include file="../WEB-INF/jspf/header.jspf" %>
        </nav>

        <br>
        <script type="text/javascript">
            function marcar(source)
            {
                checkboxes = document.querySelectorAll('input[type="checkbox"]'); //obtenemos todos los controles del tipo Input
                for (i = 1; i < checkboxes.length; i++) { //recoremos todos los controles
                    if (checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                    {
                        var hidden = document.querySelector("input[type='hidden']#c" + checkboxes[i].id);
                        if (source.checked) {
                            hidden.value = checkboxes[i].id + "-1";
                        } else {
                            hidden.value = checkboxes[i].id + "-0";
                        }
                        checkboxes[i].checked = source.checked; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                    }
                }
            }
        </script>
        <form action="${pageContext.request.contextPath}/servletpermisosrol.do" method="POST" name="f1">
            <input type="hidden" name="permisosRol" value="asignarPermisos" >
            <%= per.mostrarTablaPermisos(idRrol, application)%>
            <script>
                document.forms[0].selectAllCheckbox.focus();
            </script>
            <input type="submit" value="Guardar">

        </form>
    </body>

</html>
<script>
    function cambiarHidden(e) {
        var check = e.target;
        var hidden = document.querySelector("input[type='hidden']#c" + check.id);

        if (check.checked) {
            hidden.value = check.id + "-1";
        } else {
            hidden.value = check.id + "-0";
        }

    }
</script>
