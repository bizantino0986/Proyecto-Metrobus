package com.example.Examen02.entity.metrobus;

import com.example.Examen02.entity.direccion.Direccion;

import javax.persistence.*;

@Entity
@Table(name = "metrobus")
public class MetrobusEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_metrobus;

    private String nombre_metrobus;

    @ManyToOne
    @JoinColumn(name = "id_direccion_fk")
    private Direccion id_direccion_fk;

    public Integer getId_metrobus() {
        return id_metrobus;
    }

    public void setId_metrobus(Integer id_metrobus) {
        this.id_metrobus = id_metrobus;
    }

    public String getNombre_metrobus() {
        return nombre_metrobus;
    }

    public void setNombre_metrobus(String nombre_metrobus) {
        this.nombre_metrobus = nombre_metrobus;
    }

    public Direccion getId_direccion_fk() {
        return id_direccion_fk;
    }

    public void setId_direccion_fk(Direccion id_direccion_fk) {
        this.id_direccion_fk = id_direccion_fk;
    }
}
