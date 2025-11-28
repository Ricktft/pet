/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.DAO;

import modelo.Dono;
import Con_DB.Conn_DB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * CRUD de Dono
 */
public class DonoDAO {

    public boolean inserir(Dono d) throws Exception {
        String sql = "INSERT INTO dono (nome, cpf, telefone, email, imagem_dono) VALUES (?,?,?,?,?)";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, d.getNome());
            ps.setString(2, d.getCpf());
            ps.setString(3, d.getTelefone());
            ps.setString(4, d.getEmail());
            ps.setBytes(5, d.getImagem_dono());
            return ps.executeUpdate() == 1;
        }
    }

    public boolean atualizar(Dono d) throws Exception {
        String sql = "UPDATE Dono SET nome=?, cpf=?, telefone=?, email=? WHERE idDono=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, d.getNome());
            ps.setString(2, d.getCpf());
            ps.setString(3, d.getTelefone());
            ps.setString(4, d.getEmail());
            ps.setInt(5, d.getIdDono());
            return ps.executeUpdate() == 1;
        }
    }

    public boolean excluir(int idDono) throws Exception {
        // ON DELETE CASCADE no BD vai apagar Animais e Medicamentos relacionados
        String sql = "DELETE FROM Dono WHERE idDono=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, idDono);
            return ps.executeUpdate() == 1;
        }
    }

    public List<Dono> listar() throws Exception {
        String sql = "SELECT idDono, nome, cpf, telefone, email, imagem_dono FROM dono ORDER BY nome";
        List<Dono> lista = new ArrayList<>();
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Dono d = new Dono();
                d.setIdDono(rs.getInt("idDono"));
                d.setNome(rs.getString("nome"));
                d.setCpf(rs.getString("cpf"));
                d.setTelefone(rs.getString("telefone"));
                d.setEmail(rs.getString("email"));
                byte[] imagemBytes = rs.getBytes("imagem_dono");
                d.setImagem(imagemBytes);
                lista.add(d);
            }
        }
        return lista;
    }

    public Dono buscarPorId(int id) throws Exception {
        String sql = "SELECT idDono, nome, cpf, telefone, email, imagem_dono FROM dono WHERE idDono=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Dono d = new Dono();
                    d.setIdDono(rs.getInt("idDono"));
                    d.setNome(rs.getString("nome"));
                    d.setCpf(rs.getString("cpf"));
                    d.setTelefone(rs.getString("telefone"));
                    d.setEmail(rs.getString("email"));
                    byte[] imagemBytes = rs.getBytes("imagem_dono");
                    d.setImagem(imagemBytes);
                    return d;
                }
            }
        }
        return null;
    }
}
