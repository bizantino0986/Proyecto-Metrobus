package com.example.Examen02.security.entity;

import javax.persistence.*;

@Entity
@Table(name = "authority")
public class Authority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_authority;

    private String authority;

    public Integer getIdAuthority() {
        return id_authority;
    }

    public void setIdAuthority(Integer idAuthority) {
        this.id_authority = idAuthority;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }
}
