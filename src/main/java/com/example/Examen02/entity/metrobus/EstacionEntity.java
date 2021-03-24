package com.example.Examen02.entity.metrobus;

import com.example.Examen02.entity.empleado.EmpleadoEntity;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Time;
import java.time.LocalDateTime;

@Entity
@Table(name = "estacion")
public class EstacionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_estacion;

    private String nombre_estacion;

    @DateTimeFormat(pattern = "HH:mm")
    private LocalDateTime tiempo_siguiente_estacion;

    @ManyToOne
    @JoinColumn(name = "id_linea_fk")
    private LineaEntity id_linea_fk;

    @ManyToOne
    @JoinColumn(name = "id_empleado_fk")
    private EmpleadoEntity id_empleado_fk;

    public Integer getId_estacion() {
        return id_estacion;
    }

    public void setId_estacion(Integer id_estacion) {
        this.id_estacion = id_estacion;
    }

    public String getNombre_estacion() {
        return nombre_estacion;
    }

    public void setNombre_estacion(String nombre_estacion) {
        this.nombre_estacion = nombre_estacion;
    }

    public LocalDateTime getTiempo_siguiente_estacion() {
        return tiempo_siguiente_estacion;
    }

    public void setTiempo_siguiente_estacion(LocalDateTime tiempo_siguiente_estacion) {
        this.tiempo_siguiente_estacion = tiempo_siguiente_estacion;
    }

    public LineaEntity getId_linea_fk() {
        return id_linea_fk;
    }

    public void setId_linea_fk(LineaEntity id_linea_fk) {
        this.id_linea_fk = id_linea_fk;
    }

    public EmpleadoEntity getId_empleado_fk() {
        return id_empleado_fk;
    }

    public void setId_empleado_fk(EmpleadoEntity id_empleado_fk) {
        this.id_empleado_fk = id_empleado_fk;
    }
}
