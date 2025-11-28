/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Con_DB;
import java.sql.*;
/**
 *
 * @author Henrique
 */
public class Conn_DB {
    
    public static Connection conectar() throws ClassNotFoundException {
        //com.mysql.cj.jdbc.Driver
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet", "root", "");
            System.out.println("Conexão estabelecida com sucesso!");
        } catch (SQLException ex) {
            System.out.println("Erro - SQL: " + ex);
        }
        return conn;
    }
}
