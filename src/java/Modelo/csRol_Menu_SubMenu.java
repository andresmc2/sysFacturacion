/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Conexion.conexion;
import Modelo.csSubMenu;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andres
 */
public class csRol_Menu_SubMenu {

    private int idMenuSubMenu;
    private int idRol_RolMenuSubMenu;
    private int idMenu_RolMenuSubMenu;
    private int idSubMenu_RolMenuSubMenu;
    private int permiso_RolMenuSubMenu;

    public csRol_Menu_SubMenu() {
    }

    public csRol_Menu_SubMenu(int idMenuSubMenu, int idRol_RolMenuSubMenu, int idMenu_RolMenuSubMenu, int idSubMenu_RolMenuSubMenu, int permiso_RolMenuSubMenu) {
        this.idMenuSubMenu = idMenuSubMenu;
        this.idRol_RolMenuSubMenu = idRol_RolMenuSubMenu;
        this.idMenu_RolMenuSubMenu = idMenu_RolMenuSubMenu;
        this.idSubMenu_RolMenuSubMenu = idSubMenu_RolMenuSubMenu;
        this.permiso_RolMenuSubMenu = permiso_RolMenuSubMenu;
    }

    public int getIdMenuSubMenu() {
        return idMenuSubMenu;
    }

    public void setIdMenuSubMenu(int idMenuSubMenu) {
        this.idMenuSubMenu = idMenuSubMenu;
    }

    public int getIdRol_RolMenuSubMenu() {
        return idRol_RolMenuSubMenu;
    }

    public void setIdRol_RolMenuSubMenu(int idRol_RolMenuSubMenu) {
        this.idRol_RolMenuSubMenu = idRol_RolMenuSubMenu;
    }

    public int getIdMenu_RolMenuSubMenu() {
        return idMenu_RolMenuSubMenu;
    }

    public void setIdMenu_RolMenuSubMenu(int idMenu_RolMenuSubMenu) {
        this.idMenu_RolMenuSubMenu = idMenu_RolMenuSubMenu;
    }

    public int getIdSubMenu_RolMenuSubMenu() {
        return idSubMenu_RolMenuSubMenu;
    }

    public void setIdSubMenu_RolMenuSubMenu(int idSubMenu_RolMenuSubMenu) {
        this.idSubMenu_RolMenuSubMenu = idSubMenu_RolMenuSubMenu;
    }

    public int getPermiso_RolMenuSubMenu() {
        return permiso_RolMenuSubMenu;
    }

    public void setPermiso_RolMenuSubMenu(int permiso_RolMenuSubMenu) {
        this.permiso_RolMenuSubMenu = permiso_RolMenuSubMenu;
    }

    public void insertarRolMenuSubMenu(int idRol, int idMenu, int idSubMenu) throws SQLException {

        String query = "INSERT INTO facturacion.rol_menu_submenu(rol_menu_submenu.idRol,rol_menu_submenu.idMenu,rol_menu_submenu.idSub_Menu) VALUES (?,?,?);";

        conexion con = new conexion();

        PreparedStatement miStatement = con.getConnection().prepareStatement(query);
        miStatement.setInt(1, idRol);
        miStatement.setInt(2, idMenu);
        miStatement.setInt(3, idSubMenu);

        miStatement.executeUpdate();
        miStatement.close();
        con.desconectar();
    }

    /*Traer toda la tabla*/
    public ResultSet obtenerRolMenuSubMenu() throws SQLException {

        conexion con = new conexion();

        PreparedStatement miStatement = null;
        ResultSet rs = null;

        miStatement = con.getConnection().prepareStatement("SELECT * FROM facturacion.rol_menu_submenu;");
        rs = miStatement.executeQuery();
        con.desconectar();
        while (rs.next()) {
        }
        return rs;
    }

    /*Traer un registro*/
    public ResultSet obtenerRegistroRolMenu(int idRol, int idMenu, int idSubMenu) throws SQLException {

        conexion con = new conexion();

        PreparedStatement miStatement = null;
        ResultSet rs = null;

        miStatement = con.getConnection().prepareStatement("SELECT A.idRol,A.idMenu,A.idSub_Menu FROM facturacion.rol_menu_submenu A WHERE A.idRol=? AND A.idMenu=? AND A.idSub_Menu=?;");
        miStatement.setInt(1, idRol);
        miStatement.setInt(2, idMenu);
        miStatement.setInt(3, idSubMenu);
        rs = miStatement.executeQuery();
        con.desconectar();
        while (rs.next()) {
        }
        return rs;
    }

    /*Validar e insertar permisos a Memu por Rol*/
    public void permisoRolMemuSubMenu() {

        try {
            /*Objetos de clase usadas*/
            csRol rol = new csRol();
            csMenu menu = new csMenu();
            csSubMenu subMenu = new csSubMenu();

            ResultSet rsMenu = menu.menu();
            ResultSet rsRol = rol.rolesUsuario();
            rsRol.beforeFirst();
            while (rsRol.next()) {
                rol.setIdRol(rsRol.getInt(1));

                rsMenu.beforeFirst();
                while (rsMenu.next()) {
                    menu.setIdMenu(rsMenu.getInt(1));

                    ResultSet rsSubMenu = subMenu.subMenuConMenu(menu.getIdMenu());
                    rsSubMenu.beforeFirst();
                    while (rsSubMenu.next()) {
                        subMenu.setIdSubMenu(rsSubMenu.getInt(1));

                        ResultSet rsRolMenuSubMenu = obtenerRegistroRolMenu(rol.getIdRol(), menu.getIdMenu(), subMenu.getIdSubMenu());
                        rsRolMenuSubMenu.beforeFirst();
                        while (rsRolMenuSubMenu.next()) {
                            setIdRol_RolMenuSubMenu(rsRolMenuSubMenu.getInt(1));
                            setIdMenu_RolMenuSubMenu(rsRolMenuSubMenu.getInt(2));
                            setIdSubMenu_RolMenuSubMenu(rsRolMenuSubMenu.getInt(3));
                        }
                        if (rol.getIdRol() == getIdRol_RolMenuSubMenu()
                                && menu.getIdMenu() == getIdMenu_RolMenuSubMenu()
                                && subMenu.getIdSubMenu() == getIdSubMenu_RolMenuSubMenu()) {
                        } else {
                            insertarRolMenuSubMenu(rol.getIdRol(), menu.getIdMenu(), subMenu.getIdSubMenu());
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(csMenu_Rol.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet ObtenerPermisos(int rol) throws SQLException{
        
        conexion con = new conexion();
        
        PreparedStatement miStatement=null;
        ResultSet rs=null;
        
        String query="SELECT C.idMenu_SubMenu, A.nombreMenu, B.nombreSubMenu, C.Permiso FROM facturacion.menu A,facturacion.sub_menu B,facturacion.rol_menu_submenu C,facturacion.rol D WHERE D.idRol=? AND A.idMenu=C.idMenu AND B.idSub_Menu=C.idSub_Menu AND C.idRol=D.idRol;";
        miStatement=con.getConnection().prepareCall(query);
        miStatement.setInt(1, rol);
        rs=miStatement.executeQuery();
        
        while(rs.next()){
        }
        con.desconectar();
        return rs;
    }
}
