/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author KABUM
 */
public class Cadastro {
    private int idCad;              
    private String nomeCad;
    private String senhaCad;
    
    //GET

    public int getIdCad() {
        return this.idCad;
    }

    public String getNomeCad() {
        return this.nomeCad;
    }

    public String getSenhaCad() {
        return this.senhaCad;
    }
    
    //SET

    public void setIdCad(int p_idCad) {
        this.idCad = p_idCad;
    }

    public void setNomeCad(String p_nomeCad) {
        this.nomeCad = p_nomeCad;
    }

    public void setSenhaCad(String p_senhaCad) {
        this.senhaCad = p_senhaCad;
    }
    
}
