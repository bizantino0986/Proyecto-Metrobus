package com.example.Examen02.entity.direccion;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="colonia")
public class Colonia implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_colonia;
    private String nombre_colonia;

    @ManyToOne
    @JoinColumn(name = "id_ciudad_fk")
    private Ciudad id_ciudad_fk;

    public int getId_colonia() {
        return id_colonia;
    }

    public void setId_colonia(int id_colonia) {
        this.id_colonia = id_colonia;
    }

    public String getNombre_colonia() {
        return nombre_colonia;
    }

    public void setNombre_colonia(String nombre_colonia) {
        this.nombre_colonia = nombre_colonia;
    }

    public Ciudad getId_ciudad_fk() {
        return id_ciudad_fk;
    }

    public void setId_ciudad_fk(Ciudad id_ciudad_fk) {
        this.id_ciudad_fk = id_ciudad_fk;
    }

    @Override
    public String toString() {
        return "Colonia{" +
                "id=" + id_colonia +
                ", nombre_colonia='" + nombre_colonia + '\'' +
                ", id_ciudad_fk=" + id_ciudad_fk +
                '}';
    }

}
