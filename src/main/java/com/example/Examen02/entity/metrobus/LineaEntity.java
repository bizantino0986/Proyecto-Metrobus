package com.example.Examen02.entity.metrobus;

import com.example.Examen02.entity.empleado.EmpleadoEntity;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Time;

@Entity
@Table(name = "linea")
public class LineaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_linea;

    private String color_linea;
    private Integer numero_paradas;


    @DateTimeFormat(pattern = "HH:mm")
    private Time tiempo_recorrido;
    private Integer autobuces_linea;

    @ManyToOne
    @JoinColumn(name = "encargado_linea_fk")
    private EmpleadoEntity encargado_linea;

    @ManyToOne
    @JoinColumn(name = "id_metrobus_fk")
    private MetrobusEntity id_metrobus_fk;

    public Integer getId_linea() {
        return id_linea;
    }

    public void setId_linea(Integer id_linea) {
        this.id_linea = id_linea;
    }

    public String getColor_linea() {
        return color_linea;
    }

    public void setColor_linea(String color_linea) {
        this.color_linea = color_linea;
    }

    public Integer getNumero_paradas() {
        return numero_paradas;
    }

    public void setNumero_paradas(Integer numero_paradas) {
        this.numero_paradas = numero_paradas;
    }

    public Time getTiempo_recorrido() {
        return tiempo_recorrido;
    }

    public void setTiempo_recorrido(Time tiempo_recorrido) {
        this.tiempo_recorrido = tiempo_recorrido;
    }

    public Integer getAutobuces_linea() {
        return autobuces_linea;
    }

    public void setAutobuces_linea(Integer autobuces_linea) {
        this.autobuces_linea = autobuces_linea;
    }

    public EmpleadoEntity getEncargado_linea() {
        return encargado_linea;
    }

    public void setEncargado_linea(EmpleadoEntity encargado_linea) {
        this.encargado_linea = encargado_linea;
    }

    public MetrobusEntity getId_metrobus_fk() {
        return id_metrobus_fk;
    }

    public void setId_metrobus_fk(MetrobusEntity id_metrobus_fk) {
        this.id_metrobus_fk = id_metrobus_fk;
    }
}
