package com.example.Examen02.entity.autobus;

import com.example.Examen02.entity.empleado.EmpleadoEntity;

import javax.persistence.*;

@Entity
@Table(name = "autobus")
public class AutobusEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_autobus;

    private String modelo_autobus;

    @ManyToOne
    @JoinColumn(name = "id_tipo_autobus_fk")
    private TipoAutobusEntity tipo_autobus;

    @ManyToOne
    @JoinColumn(name = "id_empleado_fk")
    private EmpleadoEntity id_empleado_fk;

    public Integer getId_autobus() {
        return id_autobus;
    }

    public void setId_autobus(Integer id_autobus) {
        this.id_autobus = id_autobus;
    }

    public String getModelo_autobus() {
        return modelo_autobus;
    }

    public void setModelo_autobus(String modelo_autobus) {
        this.modelo_autobus = modelo_autobus;
    }

    public TipoAutobusEntity getTipo_autobus() {
        return tipo_autobus;
    }

    public void setTipo_autobus(TipoAutobusEntity tipo_autobus) {
        this.tipo_autobus = tipo_autobus;
    }

    public EmpleadoEntity getId_empleado_fk() {
        return id_empleado_fk;
    }

    public void setId_empleado_fk(EmpleadoEntity id_empleado_fk) {
        this.id_empleado_fk = id_empleado_fk;
    }
}
