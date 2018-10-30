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

/**
 *
 * @author Andres
 */
public class csSubMenu {
    private int idSubMenu;
    private String nombreSubMenu;
    private String linkSubMenu;

    public csSubMenu() {
    }

    public csSubMenu(int idSubMenu, String nombreSubMenu, String linkSubMenu) {
        this.idSubMenu = idSubMenu;
        this.nombreSubMenu = nombreSubMenu;
        this.linkSubMenu = linkSubMenu;
    }

    public int getIdSubMenu() {
        return idSubMenu;
    }

    public void setIdSubMenu(int idSubMenu) {
        this.idSubMenu = idSubMenu;
    }

    public String getNombreSubMenu() {
        return nombreSubMenu;
    }

    public void setNombreSubMenu(String nombreSubMenu) {
        this.nombreSubMenu = nombreSubMenu;
    }

    public String getLinkSubMenu() {
        return linkSubMenu;
    }

    public void setLinkSubMenu(String linkSubMenu) {
        this.linkSubMenu = linkSubMenu;
    }
    
    public ResultSet subMenuDatos() throws SQLException{
    
        conexion con=new conexion();       
        
        PreparedStatement miStatement=null; 
        ResultSet rs = null;
        
        miStatement=con.getConnection().prepareStatement("SELECT D.nombreSubMenu, D.link FROM facturacion.rol A,facturacion.rol_menu_submenu B,facturacion.menu C, facturacion.sub_menu D WHERE A.idRol=? AND C.nombreMenu=? AND B.idRol=A.idRol AND B.idMenu=C.idMenu AND B.idSub_Menu=D.idSub_Menu;");
        rs=miStatement.executeQuery();
        while(rs.next()){           
        }
        return rs;
    }
    
    public void insertarSubMenu(String nombre, String link, int menu) throws SQLException{        
        
        conexion con=new conexion();
        
        String query="INSERT INTO facturacion.sub_menu (sub_menu.nombreSubMenu,sub_menu.link,sub_menu.idMenu) VALUES (?,?,?);";
        
            PreparedStatement miStatement=con.getConnection().prepareStatement(query);
            miStatement.setString(1, nombre);
            miStatement.setString(2, link);
            miStatement.setInt(3, menu);
            miStatement.executeUpdate();
  
        con.desconectar();
    }
    
    public ResultSet subMenu() throws SQLException{
    
        conexion con=new conexion();       
        
        PreparedStatement miStatement=null; 
        ResultSet rs = null;
        
        miStatement=con.getConnection().prepareStatement("SELECT A.idSub_Menu,A.nombreSubMenu FROM facturacion.sub_menu A;");
        rs=miStatement.executeQuery();
        con.desconectar();
        while(rs.next()){           
        }
        return rs;
    }
    
    public ResultSet subMenuConMenu(int idMenu) throws SQLException{
    
        conexion con=new conexion();       
        
        PreparedStatement miStatement=null; 
        ResultSet rs = null;
        
        miStatement=con.getConnection().prepareStatement("SELECT * FROM facturacion.sub_menu WHERE sub_menu.idMenu=?;");
        miStatement.setInt(1, idMenu);
        rs=miStatement.executeQuery();
        
        while(rs.next()){           
        }
        con.desconectar();
        return rs;
    }
}
