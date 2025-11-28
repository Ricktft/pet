/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Henrique e Vitor
 */

import java.sql.Date;

public class Hospedagem {

    // Atributos
    private int idHospedagem;
    private int idDono;
    private int idAnimal;
    private Date dataEntrada;
    private Date dataSaida;
    private String observacoes;
    private double valorDiaria;
    private double valorTotal;

    // Métodos set
    public void setIdHospedagem(int p_idHospedagem) {
        this.idHospedagem = p_idHospedagem;
    }

    public void setIdDono(int p_idDono) {
        this.idDono = p_idDono;
    }

    public void setIdAnimal(int p_idAnimal) {
        this.idAnimal = p_idAnimal;
    }

    public void setDataEntrada(Date p_dataEntrada) {
        this.dataEntrada = p_dataEntrada;
    }

    public void setDataSaida(Date p_dataSaida) {
        this.dataSaida = p_dataSaida;
    }

    public void setObservacoes(String p_observacoes) {
        this.observacoes = p_observacoes;
    }

    public void setValorDiaria(double p_valorDiaria) {
        this.valorDiaria = p_valorDiaria;
    }

    public void setValorTotal(double p_valorTotal) {
        this.valorTotal = p_valorTotal;
    }

    // Métodos get
    public int getIdHospedagem() {
        return this.idHospedagem;
    }

    public int getIdDono() {
        return this.idDono;
    }

    public int getIdAnimal() {
        return this.idAnimal;
    }

    public Date getDataEntrada() {
        return this.dataEntrada;
    }

    public Date getDataSaida() {
        return this.dataSaida;
    }

    public String getObservacoes() {
        return this.observacoes;
    }

    public double getValorDiaria() {
        return this.valorDiaria;
    }

    public double getValorTotal() {
        return this.valorTotal;
    }
}

