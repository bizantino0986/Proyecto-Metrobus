package com.example.Examen02.entity.autobus;

import com.sun.javafx.beans.IDProperty;

import javax.persistence.*;

@Entity
@Table(name = "tipo_autobus")
public class TipoAutobusEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_tipo_autobus;

    private String nombre_tipo;
    private Integer largo;
    private Integer capacidad_pasajeros;
    private String tipo_combustible;
    private Double kilometros_litro;

    public Integer getId_tipo_autobus() {
        return id_tipo_autobus;
    }

    public void setId_tipo_autobus(Integer id_tipo_autobus) {
        this.id_tipo_autobus = id_tipo_autobus;
    }

    public String getNombre_tipo() {
        return nombre_tipo;
    }

    public void setNombre_tipo(String nombre_tipo) {
        this.nombre_tipo = nombre_tipo;
    }

    public Integer getLargo() {
        return largo;
    }

    public void setLargo(Integer largo) {
        this.largo = largo;
    }

    public Integer getCapacidad_pasajeros() {
        return capacidad_pasajeros;
    }

    public void setCapacidad_pasajeros(Integer capacidad_pasajeros) {
        this.capacidad_pasajeros = capacidad_pasajeros;
    }

    public String getTipo_combustible() {
        return tipo_combustible;
    }

    public void setTipo_combustible(String tipo_combustible) {
        this.tipo_combustible = tipo_combustible;
    }

    public Double getKilometros_litro() {
        return kilometros_litro;
    }

    public void setKilometros_litro(Double kilometros_litro) {
        this.kilometros_litro = kilometros_litro;
    }
}
