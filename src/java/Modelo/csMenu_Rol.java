/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Conexion.conexion;
import java.sql.ResultSet;

/**
 *
 * @author Andres
 */
public class csMenu_Rol {

    private int idRol_Menu;
    private int idRol_MenuRol;
    private int idMenu_MenuRol;
    private int permiso_MenuRol;

    public int getIdRol_Menu() {
        return idRol_Menu;
    }

    public void setIdRol_Menu(int idRol_Menu) {
        this.idRol_Menu = idRol_Menu;
    }

    public int getIdRol_MenuRol() {
        return idRol_MenuRol;
    }

    public void setIdRol_MenuRol(int idRol_MenuRol) {
        this.idRol_MenuRol = idRol_MenuRol;
    }

    public int getIdMenu_MenuRol() {
        return idMenu_MenuRol;
    }

    public void setIdMenu_MenuRol(int idMenu_MenuRol) {
        this.idMenu_MenuRol = idMenu_MenuRol;
    }

    public int getPermiso_MenuRol() {
        return permiso_MenuRol;
    }

    public void setPermiso_MenuRol(int permiso_MenuRol) {
        this.permiso_MenuRol = permiso_MenuRol;
    }

    public csMenu_Rol(int idRol_Menu, int idRol_MenuRol, int idMenu_MenuRol, int permiso_MenuRol) {
        this.idRol_Menu = idRol_Menu;
        this.idRol_MenuRol = idRol_MenuRol;
        this.idMenu_MenuRol = idMenu_MenuRol;
        this.permiso_MenuRol = permiso_MenuRol;
    }

    public csMenu_Rol() {
    }

    /*
    *
    @ Metodo que sirve para asignar permiso por defecto a menus
    *
     */
    public void insertarRolMenu(int idRol, int idMenu) throws SQLException {

        String query = "INSERT INTO facturacion.rol_menu(rol_menu.idRol,rol_menu.idMenu) VALUE(?,?);";

        conexion con = new conexion();

        PreparedStatement miStatement = con.getConnection().prepareStatement(query);
        miStatement.setInt(1, idRol);
        miStatement.setInt(2, idMenu);

        miStatement.executeUpdate();
        miStatement.close();
        con.desconectar();
    }

    /*Traer toda la tabla*/
    public ResultSet obtenerRolMenu() throws SQLException {

        conexion con = new conexion();

        PreparedStatement miStatement = null;
        ResultSet rs = null;

        miStatement = con.getConnection().prepareStatement("SELECT * FROM facturacion.rol_menu;");
        rs = miStatement.executeQuery();
        con.desconectar();
        while (rs.next()) {
        }
        return rs;
    }

    /*Traer un registro*/
    public ResultSet obtenerRegistroRolMenu(int idRol, int idMenu) throws SQLException {

        conexion con = new conexion();

        PreparedStatement miStatement = null;
        ResultSet rs = null;

        miStatement = con.getConnection().prepareStatement("SELECT A.idRol,A.idMenu FROM facturacion.rol_menu A WHERE A.idRol=? AND A.idMenu=?;");
        miStatement.setInt(1, idRol);
        miStatement.setInt(2, idMenu);
        rs = miStatement.executeQuery();
        con.desconectar();
        while (rs.next()) {
        }
        return rs;
    }


    /*Validar e insertar permisos a Memu por Rol*/
    public void permisoRolMemu() {

        try {
            csRol rol = new csRol();
            csMenu menu = new csMenu();
            ResultSet rsMenu = menu.menu();
            ResultSet rsRol = rol.rolesUsuario();

            rsRol.beforeFirst();
            while (rsRol.next()) {
                rol.setIdRol(rsRol.getInt(1));

                rsMenu.beforeFirst();
                while (rsMenu.next()) {
                    menu.setIdMenu(rsMenu.getInt(1));

                    ResultSet rsRolMenu = obtenerRegistroRolMenu(rol.getIdRol(), menu.getIdMenu());
                    rsRolMenu.beforeFirst();
                    while (rsRolMenu.next()) {
                        setIdRol_MenuRol(rsRolMenu.getInt(1));
                        setIdMenu_MenuRol(rsRolMenu.getInt(2));
                    }
                    if (rol.getIdRol() == getIdRol_MenuRol() && menu.getIdMenu() == getIdMenu_MenuRol()) {
                    } else {
                        insertarRolMenu(rol.getIdRol(), menu.getIdMenu());
                    }

                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(csMenu_Rol.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
