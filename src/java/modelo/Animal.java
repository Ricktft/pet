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
public class Animal {
    // Atributos
    private int idAnimal;
    private String nome;
    private String especie;
    private String raca;
    private int idade;
    private double peso;
    private java.sql.Date data_chegada;// usando o java.sql.Date (JDBC trabalha bem)
    private java.sql.Date data_saida;
    private String observacoes;
    private byte[] imagem_pet;
    private byte[] imagem;
    private int idDono; // FK

    // Métodos set
    public void setIdAnimal(int p_idAnimal) {
        this.idAnimal = p_idAnimal;
    }
    public void setNome(String p_nome) {
        this.nome = p_nome;
    }
    public void setEspecie(String p_especie) {
        this.especie = p_especie;
    }
    public void setRaca(String p_raca) {
        this.raca = p_raca;
    }
    public void setIdade(int p_idade) {
        this.idade = p_idade;
    }
    public void setPeso(double p_peso) {
        this.peso = p_peso;
    }
    public void setData_chegada(java.sql.Date p_data_chegada) {
    this.data_chegada = p_data_chegada;
    }

    public void setData_saida(java.sql.Date p_data_saida) {
    this.data_saida = p_data_saida;
    }
    public void setObservacoes(String p_observacoes) {
        this.observacoes = p_observacoes;
    }
    public void setImagem_pet(byte[] p_imagem_pet) {
        this.imagem_pet = p_imagem_pet;
    }
    
    public void setIdDono(int p_idDono) {
        this.idDono = p_idDono;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }
    

    // Métodos get
    public int getIdAnimal() {
        return this.idAnimal;
    }
    public String getNome() {
        return this.nome;
    }
    public String getEspecie() {
        return this.especie;
    }
    public String getRaca() {
        return this.raca;
    }
    public int getIdade() {
        return this.idade;
    }
    public double getPeso() {
        return this.peso;
    }
    public java.sql.Date getData_chegada() {
    return this.data_chegada;
}

    public java.sql.Date getData_saida() {
    return this.data_saida;
    }
    public String getObservacoes() {
        return this.observacoes;
    }

    public byte[] getImagem_pet() {
        return imagem_pet;
    }
    
    public int getIdDono() {
        return this.idDono;
    }

    public byte[] getImagem() {
        return imagem;
    }
    
    
}
