/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andres
 */
public class conexion {
//jdbc:mysql://localhost:3306/facturacion
    private static Connection conn;
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String usuario = "root";
    private static final String password = "";
    private static final String url = "jdbc:mysql://localhost:3306/facturacion";

    public conexion() {

        conn = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, usuario, password);

            if (conn != null) {
                System.out.println("conexion correcta");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("fallo conexion" + e);
        }
    }

    //ESTE METODO RETORNA LA CONEXION
    public Connection getConnection() {
        return conn;
    }
    
    //ESTE METODO DESCONECTA LA BD
    public void desconectar() {
        conn=null;
        try{
        if(conn==null){
            conn.close();
            System.out.println("conexion terminada");
        }
        }catch(Exception e)
        {
            System.err.println("ERROR"+ e);
        }
    }
    
    public static void main(String[] args) {     
        conexion con=new conexion();    
        con.desconectar();
    }
    

}
