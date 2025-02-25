package com.emergentes.utiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionBD {
    static public String driver = "com.mysql.cj.jdbc.Driver";
    static public String url = "jdbc:mysql://localhost:3306/bd_blog";
    static public String usuario = "root";
    static public String password = "";
    
    protected Connection conn = null;

    public ConexionBD() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, usuario, password);
        } catch (ClassNotFoundException ex) {
            System.out.println("Error en el driver: " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Error al realizar la conexion: " + ex.getMessage());
        }
    }
    
    public Connection conectar(){
        return conn;
    }
    
    public void desconectar(){
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Error al cerrar la conexión: "+ex.getMessage());
        }
    }

    public void eliminarRegistro(int id) {
        String sql = "DELETE FROM nuevo WHERE id = ?";
        try (PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al eliminar el registro: " + ex.getMessage());
        }
    }

    public void renumerarIDs() {
        String sql1 = "SET @new_id = 0;";
        String sql2 = "UPDATE nuevo SET id = (@new_id := @new_id + 1) ORDER BY id;";
        try (Statement stmt = conn.createStatement()) {
            stmt.execute(sql1);
            stmt.execute(sql2);
        } catch (SQLException ex) {
            System.out.println("Error al renumerar los IDs: " + ex.getMessage());
        }
    }
}
