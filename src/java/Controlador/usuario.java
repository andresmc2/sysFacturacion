/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.csUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andres
 */
@WebServlet(name = "usuario", urlPatterns = {"/usuario.do"})
public class usuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       csUsuario usu = new csUsuario();
        String Mensaje ="";
        String caso = request.getParameter("opcionUsuario");

        switch (caso) {
            case "ActualizarUs": {
                try{
                String Nombre = request.getParameter("txtNombre");
                String Apellido= request.getParameter("txtApellido");
                String Pass= request.getParameter("txtPass");
                int Rol = Integer.parseInt(request.getParameter("usarioRol"));
                int Cod = Integer.parseInt(request.getParameter("txtCod"));
                int Estado = Integer.parseInt(request.getParameter("estadoUsu"));
                
                
                    usu.Actualizar(Nombre, Apellido, Pass, Rol, Cod,Estado);
                    Mensaje="Datos actualizados correctamente";
                    request.setAttribute("Mensaje", Mensaje);
                    
                    //request.getRequestDispatcher("/Usuario/ListaUsuarios.jsp").forward(request, response);
                    response.sendRedirect("/sysFacturacion/Usuario/ListaUsuarios.jsp");
                }catch(Exception e)
                {
                    Mensaje="No se pudo actualizar "+e; 
                    request.setAttribute("Mensaje", Mensaje);
                    response.sendRedirect("/sysFacturacion/Usuario/ActualizarUsuario.jsp");
                }
                
                
                
                
                break;
            }
            case "InsertarUsuario": {

                String crearNombreUsu = request.getParameter("txtCrearNombreUsu");
                String crearApellidoUsu = request.getParameter("txtCrearApellidoUsu");
                String crearPasswordUsu = request.getParameter("txtCrearPassUsu");
                try {
                    String crearRolUsu = request.getParameter("usarioRol");
                    int rol = Integer.parseInt(crearRolUsu);

                    usu.insertarUsuario(crearNombreUsu, crearApellidoUsu, crearPasswordUsu, rol);
                    response.sendRedirect("/sysFacturacion/Usuario/ListaUsuarios.jsp");

                } catch (Exception e) {
                    
                }

                break;
            }case "EliminarUs":
            {
                csUsuario cs = new csUsuario();
                int cod= Integer.parseInt(request.getParameter("cod"));
                cs.Eliminar(cod);
                response.sendRedirect("/sysFacturacion/Usuario/ListaUsuarios.jsp");
            }
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
