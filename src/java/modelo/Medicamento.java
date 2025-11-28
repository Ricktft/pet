/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Henrique e Vitor
 */
public class Medicamento {
    // Atributos
    private int id_remedio;
    private String nome_remedio;
    private int intervalo_tempo;
    private int dose;
    private String unidade;
    private int fk_id_animal; // FK
    private String nomeAnimal;
    

    // Métodos set
    public void setId_remedio(int p_id_remedio) {
        this.id_remedio = p_id_remedio;
    }
    public void setNome_remedio(String p_nome_remedio) {
        this.nome_remedio = p_nome_remedio;
    }
    public void setIntervalo_tempo(int p_intervalo_tempo) {
        this.intervalo_tempo = p_intervalo_tempo;
    }
    public void setDose(int p_dose) {
    this.dose = p_dose;
    }
    
    public void setUnidade(String p_unidade) {
    this.unidade = p_unidade;
    }
    public void setFk_id_animal(int p_fk_id_animal) {
        this.fk_id_animal = p_fk_id_animal;
    }
    public void setNomeAnimal(String p_nomeAnimal){
        this.nomeAnimal = p_nomeAnimal;
    }
                
    // Métodos get
    public int getId_remedio() {
        return this.id_remedio;
    }
    public String getNome_remedio() {
        return this.nome_remedio;
    }
    public int getIntervalo_tempo() {
        return this.intervalo_tempo;
    }
    public int getDose() {
    return this.dose;
    }

    public String getUnidade() {
    return this.unidade;
    }
    public int getFk_id_animal() {
        return this.fk_id_animal;
    }
    public String getNomeAnimal (){
        return this.nomeAnimal;
    }
}
