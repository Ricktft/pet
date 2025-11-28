/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.DAO;

import modelo.Cadastro;
import Con_DB.Conn_DB;
import seguro.MD5;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author KABUM
 */
public class CadastroDAO {
    //Cadastrar
        public boolean cadastrar(Cadastro cad) throws ClassNotFoundException {
        String sql = "INSERT INTO cadastro (nomeCad, senhaCad) VALUES (?, ?)";
        
        try (Connection c = Conn_DB.conectar();
             PreparedStatement stmt = c.prepareStatement(sql)) {
            
            stmt.setString(1, cad.getNomeCad());
            stmt.setString(2, MD5.hash(cad.getSenhaCad()));
            
            stmt.executeUpdate();
            return true;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
        
    //Logar
        public Cadastro validarLogin(String nome, String senha) throws ClassNotFoundException {
        String senhaHash = MD5.hash(senha);
        String sql = "SELECT * FROM cadastro WHERE nomeCad = ? AND senhaCad = ?";
        
        try (Connection c = Conn_DB.conectar();
             PreparedStatement stmt = c.prepareStatement(sql)) {
            
            stmt.setString(1, nome);
            stmt.setString(2, senhaHash);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Cadastro cad = new Cadastro();
                cad.setIdCad(rs.getInt("idCad"));
                cad.setNomeCad(rs.getString("nomeCad"));
                
                return cad;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
