package modelo.DAO;

import java.sql.*;
import java.util.*;
import modelo.Animal;
import Con_DB.Conn_DB;

public class AnimalDAO {

    // Inserir
    public boolean inserir(Animal a) throws ClassNotFoundException {
        String sql = "INSERT INTO animal (nome, especie, raca, idade, peso, data_chegada, data_saida, observacoes,idDono, imagem_pet) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = Conn_DB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, a.getNome());
            ps.setString(2, a.getEspecie());
            ps.setString(3, a.getRaca());
            ps.setInt(4, a.getIdade());
            ps.setDouble(5, a.getPeso());
            ps.setDate(6, a.getData_chegada());
            ps.setDate(7, a.getData_saida());
            ps.setString(8, a.getObservacoes());
            ps.setInt(9, a.getIdDono());
            ps.setBytes(10, a.getImagem_pet());
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inserir animal: " + e.getMessage(), e);
        }
    }

    // Atualizar
    public boolean atualizar(Animal a) throws ClassNotFoundException {
        String sql = "UPDATE animal SET nome=?, especie=?, raca=?, idade=?, peso=?, data_chegada=?, data_saida=?, observacoes=?, idDono=? WHERE idAnimal=?";
        try (Connection conn = Conn_DB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, a.getNome());
            ps.setString(2, a.getEspecie());
            ps.setString(3, a.getRaca());
            ps.setInt(4, a.getIdade());
            ps.setDouble(5, a.getPeso());
            ps.setDate(6, a.getData_chegada());
            ps.setDate(7, a.getData_saida());
            ps.setString(8, a.getObservacoes());
            ps.setInt(9, a.getIdDono());
            ps.setInt(10, a.getIdAnimal());

            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar animal: " + e.getMessage(), e);
        }
    }

    // Excluir
    public boolean excluir(int idAnimal) throws ClassNotFoundException {
        String sql = "DELETE FROM animal WHERE idAnimal=?";
        try (Connection conn = Conn_DB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idAnimal);
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao excluir animal: " + e.getMessage(), e);
        }
    }

    // Listar todos
    public List<Animal> listar() throws ClassNotFoundException {
        String sql = "SELECT idAnimal, nome, especie, raca, idade, peso, data_chegada, data_saida, observacoes,imagem_pet, idDono FROM animal ORDER BY nome";
        List<Animal> lista = new ArrayList<>();

        try (Connection conn = Conn_DB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Animal a = new Animal();
                a.setIdAnimal(rs.getInt("idAnimal"));
                a.setNome(rs.getString("nome"));
                a.setEspecie(rs.getString("especie"));
                a.setRaca(rs.getString("raca"));
                a.setIdade(rs.getInt("idade"));
                a.setPeso(rs.getDouble("peso"));
                byte[] imagemBytes = rs.getBytes("imagem_pet");
                a.setImagem(imagemBytes);

                // onde tava dando erro ambiguo 
               a.setData_chegada(rs.getDate("data_chegada")); // isso já é java.sql.Date
               a.setData_saida(rs.getDate("data_saida"));


                a.setObservacoes(rs.getString("observacoes"));
                a.setIdDono(rs.getInt("idDono"));
                lista.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar animais: " + e.getMessage(), e);
        }
        return lista;
    }

    // Buscar por ID
   public Animal buscarPorId(int idAnimal) throws ClassNotFoundException {
    String sql = "SELECT * FROM animal WHERE idAnimal=?";
    Animal a = null;

    try (Connection conn = Conn_DB.conectar();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, idAnimal);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                a = new Animal();
                a.setIdAnimal(rs.getInt("idAnimal"));
                a.setNome(rs.getString("nome"));
                a.setEspecie(rs.getString("especie"));
                a.setRaca(rs.getString("raca"));
                a.setIdade(rs.getInt("idade"));
                a.setPeso(rs.getDouble("peso"));
                a.setData_chegada(rs.getDate("data_chegada"));
                a.setData_saida(rs.getDate("data_saida"));
                a.setObservacoes(rs.getString("observacoes"));
                byte[] imagemBytes = rs.getBytes("imagem_pet");
                a.setImagem(imagemBytes);
                a.setIdDono(rs.getInt("idDono"));
            }
        }
    } catch (SQLException e) {
        throw new RuntimeException("Erro ao buscar animal: " + e.getMessage(), e);
    }
    return a;
}
}

