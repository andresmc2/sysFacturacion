/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.csMenu;
import Modelo.csMenu_Rol;
import Modelo.csRol_Menu_SubMenu;
import Modelo.csSubMenu;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ServletSubMenu", urlPatterns = {"/servletsubmenu.do"})
public class ServletSubMenu extends HttpServlet {

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
        
        String opcion = request.getParameter("opcionSubMenu");
        String Mensaje="";
        switch (opcion) {
            case "InsertarSubMenu": {
                String nombreSubMenu = request.getParameter("txtCrearSubMenu");
                String linkSubMenu = request.getParameter("txtCrearLinkSub");
                String menuAso = request.getParameter("menuAsociado");
                try {
                    int idMenu = Integer.parseInt(menuAso);
                    
                    csSubMenu subMenu= new csSubMenu();
                    subMenu.insertarSubMenu(nombreSubMenu, linkSubMenu, idMenu);
                    
                    csRol_Menu_SubMenu ob1 = new csRol_Menu_SubMenu();
                    ob1.permisoRolMemuSubMenu();
                    Mensaje="SubMenu agregado exitosamente; <a href='../MantenimientoMenu/RolesPermisos.jsp'>conceder permisos</a>";
                     response.sendRedirect("/sysFacturacion/MantenimientoMenu/CrearSubMenu.jsp?Mensaje="+Mensaje);
                   //request.getRequestDispatcher("/MantenimientoMenu/RolesPermisos.jsp").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletMenu.class.getName()).log(Level.SEVERE, null, ex);
                }
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
