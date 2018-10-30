package Controlador;


import Conexion.conexion;
import Modelo.csUsuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Andres
 */
public class NewClass {

    public ResultSet usuariosLista() throws SQLException{
    
        conexion con=new conexion();       
        
        PreparedStatement miStatement=null; 
        ResultSet rs = null;
        
        miStatement=con.getConnection().prepareStatement("SELECT * FROM facturacion.usuario");
        rs=miStatement.executeQuery();
        while(rs.next()){           
        }
        return rs;
    }
}
