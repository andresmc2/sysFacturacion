/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Conexion.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 *
 * @author Andres
 */
public class persimosRoles {

    private int idRolPermiso;
    private int idMenu;
    private int idSubMenu;
    private String nombreMenu;
    private String nombreSubMenu;

    public persimosRoles() {
    }

    public persimosRoles(int idRolPermiso, int idMenu, int idSubMenu, String nombreMenu, String nombreSubMenu) {
        this.idRolPermiso = idRolPermiso;
        this.idMenu = idMenu;
        this.idSubMenu = idSubMenu;
        this.nombreMenu = nombreMenu;
        this.nombreSubMenu = nombreSubMenu;
    }

    public int getIdRolPermiso() {
        return idRolPermiso;
    }

    public void setIdRolPermiso(int idRolPermiso) {
        this.idRolPermiso = idRolPermiso;
    }

    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    public int getIdSubMenu() {
        return idSubMenu;
    }

    public void setIdSubMenu(int idSubMenu) {
        this.idSubMenu = idSubMenu;
    }

    public String getNombreMenu() {
        return nombreMenu;
    }

    public void setNombreMenu(String nombreMenu) {
        this.nombreMenu = nombreMenu;
    }

    public String getNombreSubMenu() {
        return nombreSubMenu;
    }

    public void setNombreSubMenu(String nombreSubMenu) {
        this.nombreSubMenu = nombreSubMenu;
    }

    Conexion.conexion con = new conexion();

    public ResultSet permisosRol() throws SQLException {

        PreparedStatement miStatement = null;
        ResultSet rs = null;
        String query = "SELECT A.idSub_Menu,A.nombreSubMenu FROM facturacion.sub_menu A;";

        miStatement = con.getConnection().prepareStatement(query);
        rs = miStatement.executeQuery();

        while (rs.next()) {
        }

        con.desconectar();

        return rs;
    }

    public ResultSet permisosIdRol(int idRol) throws SQLException {
        PreparedStatement miStatement = null;
        ResultSet rs = null;
        String query = "SELECT * FROM facturacion.rol;";

        miStatement = con.getConnection().prepareStatement(query);
        rs = miStatement.executeQuery();

        while (rs.next()) {
        }

        con.desconectar();

        return rs;
    }

    public String encabezadoTablaPermisos() {

        StringBuilder sb = new StringBuilder();
        sb.append("<table class='table table-hover text-center' tablaa>\n<tr>\n");
        sb.append("<th class='text-center'>Funcion <input type=\"checkbox\"  name=\"selectAllCheckbox\" onclick=\"marcar    (this);\"> </th>\n");
        sb.append("<th class='text-center'>Modulo</th>\n");
        sb.append("<th class='text-center'>Sub Menu</th>");
        sb.append("</tr>\n");

        return sb.toString();
    }

    public String cuerpoTablaPermisos(int ID, String menu, String subMenu, int permiso) {
        StringBuilder sb = new StringBuilder();

        String checked = "";
        if (permiso == 1) {
            checked = "checked=\"checked\"";
        } else {
            checked = "";
        }

        sb.append("<tr>");
        sb.append("<td>\n");
        sb.append("<input type='hidden' name='selectedItems' id=c"+ID+" value='"+ID+"-"+permiso+"'>");
        sb.append("<input type=\"checkbox\" onclick='cambiarHidden(event)' id="+ID+" " + checked + ">");
        sb.append("</td>\n");
        sb.append("<td>\n");
        sb.append(menu);
        sb.append("</td>\n");
        sb.append("<td>\n");
        sb.append(subMenu);
        sb.append("</td>\n");
        sb.append("</tr>");

        return sb.toString();
    }

    public String finTablaPermisos() {
        StringBuilder sb = new StringBuilder();

        sb.append("</table>\n");

        return sb.toString();
    }

    public String mostrarTablaPermisos(int idRol, ServletContext application) {
        StringBuilder sb = new StringBuilder();

        sb.append(encabezadoTablaPermisos());

        csRol_Menu_SubMenu ob = new csRol_Menu_SubMenu();

        try {
            ResultSet rsPermisos = ob.ObtenerPermisos(idRol);
            rsPermisos.beforeFirst();
            while (rsPermisos.next()) {
                sb.append(cuerpoTablaPermisos(rsPermisos.getInt(1),
                        rsPermisos.getString(2),
                        rsPermisos.getString(3),
                        rsPermisos.getInt(4)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(persimosRoles.class.getName()).log(Level.SEVERE, null, ex);
        }

        sb.append(finTablaPermisos());

        return sb.toString();
    }

    public void actualizarPermisos(int idRolSubMenu) throws SQLException {
        //

        PreparedStatement pst = null;

        String query = "UPDATE facturacion.rol_menu_submenu SET rol_menu_submenu.Permiso=1 WHERE rol_menu_submenu.idMenu_SubMenu=?;";
        pst.getConnection().prepareStatement(query);
        pst.setInt(1, idRolSubMenu);
        pst.executeUpdate();
    }

    public boolean Actualizar(int idRolSubMenu,int permiso) {
        PreparedStatement pst = null;
        conexion con = new conexion();

        try {

            String consulta = "UPDATE facturacion.rol_menu_submenu SET rol_menu_submenu.Permiso="+permiso+" WHERE rol_menu_submenu.idMenu_SubMenu=?;";
            pst = con.getConnection().prepareStatement(consulta);
            pst.setInt(1, idRolSubMenu);

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("ERROR" + e);
        } finally {
            try {
                if (con.getConnection() != null) {
                    con.getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("ERROR" + e);
            }
        }

        return false;
    }
    
 
}
