/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;
import Conexion.conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import Conexion.conexion;
import java.sql.Connection;
import javax.servlet.ServletContext;


/**
 *
 * @author Andres
 */
public class csMenu {

    public csMenu() {
    }
    
  private int idMenu;
  private String nombreMenu;
  private String linkMenu;

    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    public String getNombreMenu() {
        return nombreMenu;
    }

    public void setNombreMenu(String nombreMenu) {
        this.nombreMenu = nombreMenu;
    }

    public String getLinkMenu() {
        return linkMenu;
    }

    public void setLinkMenu(String linkMenu) {
        this.linkMenu = linkMenu;
    }
  
    
    public ResultSet submenuLista(int idRol,String nombreMenu) throws SQLException{
        
        ArrayList<String> menu=new ArrayList<>();

        
           conexion ob=new conexion();
           
            PreparedStatement miStatement=ob.getConnection().prepareStatement("SELECT D.nombreSubMenu, D.link, B.Permiso FROM facturacion.rol A,facturacion.rol_menu_submenu B,facturacion.menu C, facturacion.sub_menu D WHERE A.idRol=? AND C.nombreMenu=? AND B.idRol=A.idRol AND B.idMenu=C.idMenu AND B.idSub_Menu=D.idSub_Menu AND D.idMenu=B.idMenu;");
            
            miStatement.setInt(1, idRol);
            miStatement.setString(2, nombreMenu);
            ResultSet rs=miStatement.executeQuery();

            while(rs.next()){                              
            }  
        return rs;
    }
    
    public ArrayList menuLista(int idRol){
        conexion ob=new conexion();
        ArrayList<String> nombreMenu=new ArrayList<>();
              
        try { 
            PreparedStatement miStatement=null;
            miStatement=ob.getConnection().prepareStatement("SELECT DISTINCT A.idMenu, B.nombreMenu, A.Permiso FROM facturacion.rol_menu_submenu A, facturacion.menu B WHERE A.idRol=? AND A.idMenu=B.idMenu AND A.Permiso=1;");
            //miStatement=ob.getConnection().prepareStatement("SELECT A.nombreMenu, A.link, B.permisoMenu FROM facturacion.menu A,facturacion.rol_menu B,facturacion.rol C WHERE B.idRol=? AND B.idMenu=A.idMenu AND C.idRol=B.idRol;");
            //PreparedStatement miStatement=getConnection().prepareStatement("SELECT A.nombreMenu FROM facturacion.menu A,facturacion.rol_menu B,facturacion.rol C WHERE B.idRol=? AND B.idMenu=A.idMenu AND C.idRol=B.idRol;");
            miStatement.setInt(1, idRol);
            ResultSet rs=miStatement.executeQuery();

            while(rs.next()){
                nombreMenu.add(rs.getString(2));
                /*int i;
                i=rs.getInt(3);
                if(i==1){
                nombreMenu.add(rs.getString(1));
                }*/
            }
            ob.desconectar();
            
        } catch (SQLException ex) {
            Logger.getLogger(csUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return nombreMenu;
    }
    
    public ArrayList menuLink(int idRol){
        conexion ob=new conexion();
        ArrayList<String> nombreMenu=new ArrayList<>();
        ArrayList<String> linkMenu=new ArrayList<>();
              
        try {
            
            PreparedStatement miStatement=null;
            miStatement=ob.getConnection().prepareStatement("SELECT A.nombreMenu, A.link FROM facturacion.menu A,facturacion.rol_menu B,facturacion.rol C WHERE B.idRol=? AND B.idMenu=A.idMenu AND C.idRol=B.idRol;");
            //PreparedStatement miStatement=getConnection().prepareStatement("SELECT A.nombreMenu FROM facturacion.menu A,facturacion.rol_menu B,facturacion.rol C WHERE B.idRol=? AND B.idMenu=A.idMenu AND C.idRol=B.idRol;");
            miStatement.setInt(1, idRol);
            ResultSet rs=miStatement.executeQuery();

            while(rs.next()){
                
                linkMenu.add(rs.getString(2));
            }
            ob.desconectar();
            
        } catch (SQLException ex) {
            Logger.getLogger(csUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return linkMenu;
    }
    
    
    public String listamenu(int idRol,String nombreMenu,ServletContext application) throws SQLException{
        
        csSubMenu subMenu=new csSubMenu();
        //ArrayList<String> menu=new ArrayList<>();
        ResultSet menu;
        menu=this.submenuLista(idRol,nombreMenu);
        StringBuilder sb=new StringBuilder();
        menu.beforeFirst();
        while(menu.next()){
            int i;
            i=menu.getInt(3);
            
            if(i==1){
            sb.append("<li><a href='"+application.getContextPath()+"/"+menu.getString(2)+"'>\n");
            sb.append(menu.getString(1));
            sb.append("</a></li>\n");
            }
        }
        return sb.toString();
        
    }
    
    public String mostrarListaMenu(int rol,ServletContext application) throws SQLException{
        
        ArrayList<String> menu=new ArrayList<>();
        menu=this.menuLista(rol);

        StringBuilder sb=new StringBuilder();
        for(int i=0;i<menu.size();i++){
            sb.append("<li class=\"dropdown\"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">");
            sb.append(menu.get(i));
            sb.append("<span class=\"caret\"></span></a>\n");
            sb.append("<ul class=\"dropdown-menu\">\n");
            
            sb.append(this.listamenu(rol, menu.get(i),application));
            
            sb.append("</ul>");
            sb.append("</li>\n");
        }
        return sb.toString();      
    }
    
    
    public ResultSet menu() throws SQLException{
    
        conexion con=new conexion();       
        
        PreparedStatement miStatement=null; 
        ResultSet rs = null;
        
        miStatement=con.getConnection().prepareStatement("SELECT A.idMenu, A.nombreMenu FROM facturacion.menu A");
        rs=miStatement.executeQuery();
        con.desconectar();
        while(rs.next()){           
        }
        return rs;
    }
    
    public void insertarMenu(String nombreMenu) throws SQLException{        
        
        conexion con = new conexion();
        
        String query="INSERT INTO facturacion.menu (menu.nombreMenu) VALUES(?);";
       
            PreparedStatement miStatement=con.getConnection().prepareStatement(query);
            miStatement.setString(1, nombreMenu);
            miStatement.executeUpdate();
            miStatement.close();
            con.desconectar();
    }
}
