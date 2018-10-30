/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Conexion.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andres
 */
public class csUsuario extends conexion {

    private int codUsuario;
    private String nombreUsuario;
    private String apellidoUsuario;
    private String password;
    private int idRol = 0;
    public String NombreRol;
    private int iniciada = 0;
    private int estadoUsu;
    private int intentosFallidos;

    public int getEstadoUsu() {
        return estadoUsu;
    }

    public void setEstadoUsu(int estadoUsu) {
        this.estadoUsu = estadoUsu;
    }

    public int getIntentosFallidos() {
        return intentosFallidos;
    }

    public void setIntentosFallidos(int intentosFallidos) {
        this.intentosFallidos = intentosFallidos;
    }

    public String getNombreRol() {
        return NombreRol;
    }

    public void setNombreRol(String NombreRol) {
        this.NombreRol = NombreRol;
    }

    public int getIniciada() {
        return iniciada;
    }

    public void setIniciada(int iniciada) {
        this.iniciada = iniciada;
    }

    public csUsuario() {
    }

    public csUsuario(int codUsuario, String nombreUsuario, String apellidoUsuario, String password, String NombreRol, int estadoUsu, int intentosFallidos) {
        this.codUsuario = codUsuario;
        this.nombreUsuario = nombreUsuario;
        this.apellidoUsuario = apellidoUsuario;
        this.password = password;
        this.NombreRol = NombreRol;
        this.estadoUsu = estadoUsu;
        this.intentosFallidos = intentosFallidos;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public int getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(int codUsuario) {
        this.codUsuario = codUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getApellidoUsuario() {
        return apellidoUsuario;
    }

    public void setApellidoUsuario(String apellidoUsuario) {
        this.apellidoUsuario = apellidoUsuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public ResultSet obtenerUsuario(int codigo) throws SQLException {

        PreparedStatement miStatement = null;
        ResultSet rs = null;

        miStatement = getConnection().prepareStatement("SELECT * FROM facturacion.usuario A WHERE A.codUsuario=? ;");
        miStatement.setInt(1, codigo);
        rs = miStatement.executeQuery();

        return rs;
    }

    /*Metodo para traer datos de usuario
    Sirve para el Login*/
    public ResultSet login(int codigo, String password) throws SQLException {

        PreparedStatement miStatement = null;
        ResultSet rs = null;

        miStatement = getConnection().prepareStatement("SELECT * FROM facturacion.usuario A WHERE A.codUsuario=?;");
        miStatement.setInt(1, codigo);
        //miStatement.setString(2, password);
        rs = miStatement.executeQuery();
        desconectar();
        while (rs.next()) {
        }
        return rs;
    }

    /*Metodo que incrementa la cantidad de errores en contrasela
    Sirve en el Login*/
    public void intentosFallidos(int codUsu, int incremento) throws SQLException {

        conexion con = new conexion();
        String queryIntentos = "UPDATE facturacion.usuario SET usuario.intentosPasswor=? WHERE usuario.codUsuario=?;";

        PreparedStatement miStatement;

        miStatement = con.getConnection().prepareStatement(queryIntentos);
        miStatement.setInt(1, incremento);
        miStatement.setInt(2, codUsu);
        miStatement.executeUpdate();
        con.desconectar();
    }

    /*Metodo que bloquea usuario si supero cantidad de intentos permitidos
    Sirve en el Login*/
    public void bloquearUsuario(int codUsu, int bloqueado) throws SQLException {

        String query = "UPDATE facturacion.usuario SET usuario.estadoUsu=? WHERE usuario.codUsuario=?;";

        PreparedStatement miStatement;

        miStatement = getConnection().prepareStatement(query);
        miStatement.setInt(1, codUsu);
        miStatement.setInt(2, bloqueado);
        miStatement.executeUpdate();
        desconectar();
    }

    //METODO QUE TRAE TODA LA LISTA DE USUARIOS
    public ResultSet usuariosLista() throws SQLException {

        conexion con = new conexion();

        PreparedStatement miStatement = null;
        ResultSet rs = null;

        miStatement = con.getConnection().prepareStatement("SELECT * FROM facturacion.usuario");
        rs = miStatement.executeQuery();
        con.desconectar();
        while (rs.next()) {
        }
        return rs;
    }

    public void insertarUsuario(String nombre, String apellido, String pass, int idRol) {

        String query = "INSERT INTO facturacion.usuario(usuario.nombreUsuario,usuario.apellidoUsuario,usuario.password,usuario.idRol) VALUES(?,?,?,?);";
        try {
            PreparedStatement miStatement = getConnection().prepareStatement(query);
            miStatement.setString(1, nombre);
            miStatement.setString(2, apellido);
            miStatement.setString(3, pass);
            miStatement.setInt(4, idRol);
            miStatement.executeUpdate();
            miStatement.close();
            desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(csUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizarUsuario(int codigo, String nombre, String apellido, String pass, int idRol) {

        String query = "UPDATE facturacion.usuario SET usuario.nombreUsuario=?, usuario.apellidoUsuario=?,usuario.password=?,usuario.idRol=? WHERE usuario.codUsuario=?;";

        PreparedStatement miStatement;
        try {
            miStatement = getConnection().prepareStatement(query);
            miStatement.setString(1, nombre);
            miStatement.setString(2, apellido);
            miStatement.setString(3, pass);
            miStatement.setInt(4, idRol);
            miStatement.setInt(5, codigo);
            miStatement.executeUpdate();
            desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(csUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<csUsuario> ListaUsuarios() throws SQLException {

        conexion con = new conexion();

        List<csUsuario> lista = null;

        PreparedStatement miStatement = null;
        ResultSet rs = null;

        //miStatement=con.getConnection().prepareStatement("SELECT  rol.nombreRol, usuario.codUsuario, usuario.nombreUsuario, usuario.apellidoUsuario, usuario.password, usuario.idRol FROM rol, usuario");
        miStatement = con.getConnection().prepareStatement("SELECT  rol.nombreRol, usuario.codUsuario, usuario.nombreUsuario, usuario.apellidoUsuario, usuario.password, usuario.idRol,usuario.estadoUsu FROM rol, usuario WHERE usuario.idRol=rol.idRol ORDER BY usuario.codUsuario ASC");

        rs = miStatement.executeQuery();

        lista = new LinkedList<csUsuario>();

        while (rs.next()) {
            csUsuario c = new csUsuario();

            c.setNombreRol(rs.getString(1));
            c.setCodUsuario(rs.getInt(2));
            c.setNombreUsuario(rs.getString(3));
            c.setApellidoUsuario(rs.getString(4));
            c.setPassword(rs.getString(5));
            c.setIdRol(rs.getInt(6));
            c.setEstadoUsu(rs.getInt(7));

            lista.add(c);
        }

        if (miStatement != null) {
            miStatement.close();
        }
        rs.close();

        return lista;
    }
    
    

    //NUEVAS 
    public boolean Eliminar(int cod) {
        PreparedStatement pst = null;

        try {

            String consulta = "delete from usuario where codUsuario =?";
            pst = getConnection().prepareStatement(consulta);
            pst.setInt(1, cod);

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("ERROR" + e);
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
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

    public boolean Actualizar(String NombreUs, String ApellidoUs, String Pass, int idRol, int Cod,int estado) {
        PreparedStatement pst = null;

        try {

            String consulta = "update usuario  set  nombreUsuario=?, apellidoUsuario =?, password=?, idRol=?,estadoUsu=? where codUsuario=?";
            pst = getConnection().prepareStatement(consulta);
            pst.setString(1, NombreUs);
            pst.setString(2, ApellidoUs);
            pst.setString(3, Pass);
            pst.setInt(4, idRol);
            pst.setInt(5, estado);
            pst.setInt(6, Cod);
            

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("ERROR" + e);
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
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
