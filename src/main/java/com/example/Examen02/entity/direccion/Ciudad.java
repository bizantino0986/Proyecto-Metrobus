package com.example.Examen02.entity.direccion;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="ciudad")
public class Ciudad implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_ciudad;
    private String nombre_ciudad;

    public int getId_ciudad() {
        return id_ciudad;
    }

    public void setId_ciudad(int id_ciudad) {
        this.id_ciudad = id_ciudad;
    }

    public String getNombre_ciudad() {
        return nombre_ciudad;
    }

    public void setNombre_ciudad(String nombre_ciudad) {
        this.nombre_ciudad = nombre_ciudad;
    }

    @Override
    public String toString() {
        return "Ciudad{" +
                "id_ciudad=" + id_ciudad +
                ", nombre_ciudad='" + nombre_ciudad + '\'' +
                '}';
    }

}
