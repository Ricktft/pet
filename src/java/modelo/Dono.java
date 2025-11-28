/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.Blob;
/**
 *
 * @author Henrique e Vitor
 */
public class Dono {
    // Atributos
    private int idDono;
    private String nome;
    private String cpf;
    private String telefone;
    private String email;
    private byte[] imagem_dono;
    private byte[] imagem;

    // Métodos set
    public void setIdDono(int p_idDono) {
        this.idDono = p_idDono;
    }
    public void setNome(String p_nome) {
        this.nome = p_nome;
    }
    public void setCpf(String p_cpf) {
        this.cpf = p_cpf;
    }
    public void setTelefone(String p_telefone) {
        this.telefone = p_telefone;
    }
    public void setEmail(String p_email) {
        this.email = p_email;
    }

    public void setImagem_dono(byte[] p_imagem_dono) {
        this.imagem_dono = p_imagem_dono;
    }

    public void setImagem(byte[] p_imagem) {
        this.imagem = p_imagem;
    }

    // Métodos get
    public int getIdDono() {
        return this.idDono;
    }
    public String getNome() {
        return this.nome;
    }
    public String getCpf() {
        return this.cpf;
    }
    public String getTelefone() {
        return this.telefone;
    }
    public String getEmail() {
        return this.email;
    }

    public byte[] getImagem_dono() {
        return imagem_dono;
    }

    public byte[] getImagem() {
        return imagem;
    }
    
    
}
