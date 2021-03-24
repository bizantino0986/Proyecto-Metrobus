package com.example.Examen02.entity.direccion;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="direccion")
public class Direccion implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_direccion;
    private String calle;
    private int numero_exterior;
    private String codigo_postal;

    @ManyToOne
    @JoinColumn(name = "id_colonia_fk")
    private Colonia id_colonia_fk;

    public int getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(int id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getNumero_exterior() {
        return numero_exterior;
    }

    public void setNumero_exterior(int numero_exterior) {
        this.numero_exterior = numero_exterior;
    }

    public String getCodigo_postal() {
        return codigo_postal;
    }

    public void setCodigo_postal(String codigo_postal) {
        this.codigo_postal = codigo_postal;
    }

    public Colonia getId_colonia_fk() {
        return id_colonia_fk;
    }

    public void setId_colonia_fk(Colonia id_colonia_fk) {
        this.id_colonia_fk = id_colonia_fk;
    }

    @Override
    public String toString() {
        return "Direccion{" +
                "id=" + id_direccion +
                ", calle='" + calle + '\'' +
                ", numero_exterior=" + numero_exterior +
                ", codigo_postal='" + codigo_postal + '\'' +
                ", id_colonia_fk=" + id_colonia_fk +
                '}';
    }
}


