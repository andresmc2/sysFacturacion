/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Conexion.conexion;

/**
 *
 * @author Andres
 */
public class csRol {
    private int idRol;
    private String nombreRol;

    public csRol() {
    }

    public csRol(int idRol, String nombreRol) {
        this.idRol = idRol;
        this.nombreRol = nombreRol;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombreRol() {
        return nombreRol;
    }

    public void setNombreRol(String nombreRol) {
        this.nombreRol = nombreRol;
    }
    
    public ResultSet rolesUsuario() throws SQLException{
    
        conexion con=new conexion();       
        
        PreparedStatement miStatement=null; 
        ResultSet rs = null;
        
        miStatement=con.getConnection().prepareStatement("SELECT * FROM facturacion.rol");
        rs=miStatement.executeQuery();
        con.desconectar();
        while(rs.next()){           
        }
        return rs;
    }
    
    public ResultSet rolUsuario() throws SQLException{
    
        conexion con=new conexion();       
        
        PreparedStatement miStatement=null; 
        ResultSet rs = null;
        
        miStatement=con.getConnection().prepareStatement("SELECT * FROM facturacion.rol");
        rs=miStatement.executeQuery();
        con.desconectar();
        while(rs.next()){  
        }
        return rs;
    }
}
