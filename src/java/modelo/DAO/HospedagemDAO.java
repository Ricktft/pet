/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Henrique
 */
package modelo.DAO;

import java.sql.*;
import java.util.*;
import modelo.Hospedagem;
import Con_DB.Conn_DB;

public class HospedagemDAO {

    // Inserir
    public boolean inserir(Hospedagem h) throws Exception {
        String sql = "INSERT INTO hospedagem (idDono, idAnimal, dataEntrada, dataSaida, valorDiaria, valorTotal, observacoes) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, h.getIdDono());
            ps.setInt(2, h.getIdAnimal());
            ps.setDate(3, h.getDataEntrada());
            ps.setDate(4, h.getDataSaida());
            ps.setDouble(5, h.getValorDiaria());
            ps.setDouble(6, h.getValorTotal());
            ps.setString(7, h.getObservacoes());

            return ps.executeUpdate() == 1;
        }
    }

    // Atualizar
    public boolean atualizar(Hospedagem h) throws Exception {
        String sql = "UPDATE hospedagem SET idDono=?, idAnimal=?, dataEntrada=?, dataSaida=?, valorDiaria=?, valorTotal=?, observacoes=? "
                   + "WHERE idHospedagem=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, h.getIdDono());
            ps.setInt(2, h.getIdAnimal());
            ps.setDate(3, h.getDataEntrada());
            ps.setDate(4, h.getDataSaida());
            ps.setDouble(5, h.getValorDiaria());
            ps.setDouble(6, h.getValorTotal());
            ps.setString(7, h.getObservacoes());
            ps.setInt(8, h.getIdHospedagem());

            return ps.executeUpdate() == 1;
        }
    }

    // Excluir
    public boolean excluir(int idHospedagem) throws Exception {
        String sql = "DELETE FROM hospedagem WHERE idHospedagem=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, idHospedagem);
            return ps.executeUpdate() == 1;
        }
    }

    // Buscar por ID
    public Hospedagem buscarPorId(int idHospedagem) throws Exception {
        String sql = "SELECT * FROM hospedagem WHERE idHospedagem=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, idHospedagem);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Hospedagem h = new Hospedagem();
                h.setIdHospedagem(rs.getInt("idHospedagem"));
                h.setIdDono(rs.getInt("idDono"));
                h.setIdAnimal(rs.getInt("idAnimal"));
                h.setDataEntrada(rs.getDate("dataEntrada"));
                h.setDataSaida(rs.getDate("dataSaida"));
                h.setValorDiaria(rs.getDouble("valorDiaria"));
                h.setValorTotal(rs.getDouble("valorTotal"));
                h.setObservacoes(rs.getString("observacoes"));
                return h;
            }
        }
        return null;
    }

    // Listar todas
    public List<Hospedagem> listar() throws Exception {
        String sql = "SELECT * FROM hospedagem ORDER BY dataEntrada DESC";
        List<Hospedagem> lista = new ArrayList<>();

        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Hospedagem h = new Hospedagem();
                h.setIdHospedagem(rs.getInt("idHospedagem"));
                h.setIdDono(rs.getInt("idDono"));
                h.setIdAnimal(rs.getInt("idAnimal"));
                h.setDataEntrada(rs.getDate("dataEntrada"));
                h.setDataSaida(rs.getDate("dataSaida"));
                h.setValorDiaria(rs.getDouble("valorDiaria"));
                h.setValorTotal(rs.getDouble("valorTotal"));
                h.setObservacoes(rs.getString("observacoes"));
                lista.add(h);
            }
        }
        return lista;
    }
}


