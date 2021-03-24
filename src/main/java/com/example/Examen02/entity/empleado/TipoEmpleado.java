package com.example.Examen02.entity.empleado;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tipo_empleado")
public class TipoEmpleado implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_tipo_empleado;
    private String tipo_empleado;

    public int getId_tipo_empleado() {
        return id_tipo_empleado;
    }

    public void setId_tipo_empleado(int id_tipo_empleado) {
        this.id_tipo_empleado = id_tipo_empleado;
    }

    public String getTipo_empleado() {
        return tipo_empleado;
    }

    public void setTipo_empleado(String tipo_empleado) {
        this.tipo_empleado = tipo_empleado;
    }

    @Override
    public String toString() {
        return "TipoEmpleado{" +
                "id_tipo_empleado=" + id_tipo_empleado +
                ", tipo_empleado='" + tipo_empleado + '\'' +
                '}';
    }
}
