package modelo.DAO;

import modelo.Medicamento;
import Con_DB.Conn_DB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MedicamentoDAO {

    public boolean inserir(Medicamento m) throws Exception {
        String sql = "INSERT INTO Medicamento (nome_remedio, intervalo_tempo, dose, unidade, fk_id_animal) VALUES (?,?,?,?,?)";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, m.getNome_remedio());
            ps.setInt(2, m.getIntervalo_tempo());
            ps.setInt(3, m.getDose());
            ps.setString(4, m.getUnidade());
            ps.setInt(5, m.getFk_id_animal());
            return ps.executeUpdate() == 1;
        }
    }

    public boolean atualizar(Medicamento m) throws Exception {
        String sql = "UPDATE Medicamento SET nome_remedio=?, intervalo_tempo=?, dose=?, unidade=?, fk_id_animal=? WHERE id_remedio=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, m.getNome_remedio());
            ps.setInt(2, m.getIntervalo_tempo());
            ps.setInt(3, m.getDose());
            ps.setString(4, m.getUnidade());
            ps.setInt(5, m.getFk_id_animal());
            ps.setInt(6, m.getId_remedio());
            return ps.executeUpdate() == 1;
        }
    }

    public boolean excluir(int id) throws Exception {
        String sql = "DELETE FROM Medicamento WHERE id_remedio=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() == 1;
        }
    }

 // --- LISTAR COM NOME DO ANIMAL ---
    public List<Medicamento> listar() throws Exception {
        String sql = """
            SELECT 
                m.id_remedio,
                m.nome_remedio,
                m.intervalo_tempo,
                m.dose,
                m.unidade,
                a.idAnimal AS fk_id_animal,
                a.nome AS nomeAnimal
            FROM medicamento m
            JOIN animal a ON m.fk_id_animal = a.idAnimal
            ORDER BY m.nome_remedio
        """;

        List<Medicamento> lista = new ArrayList<>();

        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Medicamento m = new Medicamento();
                m.setId_remedio(rs.getInt("id_remedio"));
                m.setNome_remedio(rs.getString("nome_remedio"));
                m.setIntervalo_tempo(rs.getInt("intervalo_tempo"));
                m.setDose(rs.getInt("dose"));
                m.setUnidade(rs.getString("unidade"));
                m.setFk_id_animal(rs.getInt("fk_id_animal"));
                m.setNomeAnimal(rs.getString("nomeAnimal")); // Aqui tá a pill
                lista.add(m);
            }
        }
        return lista;
    }

    public Medicamento buscarPorId(int id) throws Exception {
        String sql = "SELECT id_remedio, nome_remedio, intervalo_tempo, dose, unidade, fk_id_animal FROM Medicamento WHERE id_remedio=?";
        try (Connection c = Conn_DB.conectar();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Medicamento m = new Medicamento();
                    m.setId_remedio(rs.getInt("id_remedio"));
                    m.setNome_remedio(rs.getString("nome_remedio"));
                    m.setIntervalo_tempo(rs.getInt("intervalo_tempo"));
                    m.setDose(rs.getInt("dose"));
                    m.setUnidade(rs.getString("unidade"));
                    m.setFk_id_animal(rs.getInt("fk_id_animal"));
                    return m;
                }
            }
        }
        return null;
    }
}
