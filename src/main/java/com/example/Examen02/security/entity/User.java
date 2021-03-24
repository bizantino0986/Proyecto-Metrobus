package com.example.Examen02.security.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "usuarios")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String user;
    private String password;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "authority_has_user", joinColumns = @JoinColumn(name = "id_user_fk"), inverseJoinColumns = @JoinColumn(name = "id_authority_fk"))
    private Set<Authority> id_authority_fk;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Authority> getId_authority_fk() {
        return id_authority_fk;
    }

    public void setId_authority_fk(Set<Authority> id_authority_fk) {
        this.id_authority_fk = id_authority_fk;
    }
}
