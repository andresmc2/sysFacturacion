/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Conexion.conexion;
import Modelo.csUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Andres
 */
@WebServlet(name = "login", urlPatterns = {"/login.do"})
public class login extends HttpServlet {

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

        Modelo.csUsuario ob = new csUsuario();
        HttpSession sesion = request.getSession();
        String Mensaje = "";
        String codigo = request.getParameter("txtCodigo");
        String pass = request.getParameter("txtPass");
        String iniciado = request.getParameter("iniciado");
        int idRol = 0;

        try {
            if (codigo.equals("") || pass.equals("")) {

                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            ob.setCodUsuario(Integer.parseInt(codigo));
            ob.setPassword(pass);
            int cod = Integer.parseInt(codigo);

            //ArrayList<String> resultado=new ArrayList<>();
            ResultSet resultado = null;

            resultado = ob.login(ob.getCodUsuario(), ob.getPassword());

            int codUsu = 0;
            String nomUsu = "";
            String apeUsu = "";
            String contra = "";
            int estadoUsu = 0;
            int intentosFallidos = 0;
            resultado.beforeFirst();
            while (resultado.next()) {
                codUsu = resultado.getInt(1);
                nomUsu = resultado.getString(2);
                apeUsu = resultado.getString(3);
                contra = resultado.getString(4);
                idRol = resultado.getInt(5);
                estadoUsu = resultado.getInt(6);
                intentosFallidos = resultado.getInt(7);
            }
            ob.setNombreUsuario(nomUsu);
            ob.setApellidoUsuario(apeUsu);
            ob.setIdRol(idRol);

            sesion.setAttribute("User", ob);

            /*  Determina estado de Usuario
                case 1 = Usuario Activo
                case 2 = Usuario Inactivo
                case 3 = Usuario Bloqueado
             */
            switch (estadoUsu) {
                case 1: {

                    if (intentosFallidos < 5) {
                        if (codUsu == cod) {

                            if (contra.equals(pass)) {
                                ob.intentosFallidos(codUsu, 0);
                                request.getRequestDispatcher("PaginaPrincipal.jsp").forward(request, response);
                            } else {
                                intentosFallidos = intentosFallidos + 1;
                                
                                ob.intentosFallidos(codUsu, intentosFallidos);
                                Mensaje = "contraseña incorrecta, intentos faliidos: "+intentosFallidos+" de 5";
                                request.setAttribute("Mensaje", Mensaje);
                                request.getRequestDispatcher("index.jsp").forward(request, response);
                            }
                        } else {
                            Mensaje = "Usuario y/o contraseña incorrectos";
                            request.setAttribute("Mensaje", Mensaje);
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        }
                    } else {
                        Mensaje = "Acaba de alcanzar el límite de intentos permitos, por favor consulte al administrador";
                        request.setAttribute("Mensaje", Mensaje);
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }

                    break;
                }
                case 2: {
                    Mensaje = "El usuario actualmente no se encuentra activo, favor consulte al administrador";
                    request.setAttribute("Mensaje", Mensaje);
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                    break;
                }
                case 3: {

                    break;
                }
                default:
                    Mensaje = "Usuario y/o contraseña incorrectos";
                    request.setAttribute("Mensaje", Mensaje);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }

            /*/Desde aqui se borraria
            if (codUsu == cod && contra.equals(pass)) {
                request.getRequestDispatcher("PaginaPrincipal.jsp").forward(request, response);

            } else {
                Mensaje = "Usuario y/o contraseña incorrectos";
                request.setAttribute("Mensaje", Mensaje);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }*/
            if (iniciado != null) {
                sesion.setAttribute("iniciado", "iniciado");
            }

        } catch (Exception e) {
            Mensaje = "Usuario y/o contraseña incorrectos\n" /*+ e*/;/*Se quito el mensaje de base de datos*/
            request.setAttribute("Mensaje", Mensaje);
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
