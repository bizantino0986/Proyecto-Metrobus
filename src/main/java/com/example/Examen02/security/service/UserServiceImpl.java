package com.example.Examen02.security.service;

import com.example.Examen02.security.entity.Authority;
import com.example.Examen02.security.entity.User;
import com.example.Examen02.security.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository repository;

    @Override
    public UserDetails loadUserByUsername(String user) throws UsernameNotFoundException {

        //Buscar el usuario con el repositorio y si no existe lanzar una exepcion
        User appUser = repository.findByUser(user).orElseThrow(() -> new UsernameNotFoundException("No existe usuario"));

        //Mapear nuestra lista de Authority con la de spring security
        List grantList = new ArrayList();
        for (Authority authority: appUser.getId_authority_fk()) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(authority.getAuthority());
            grantList.add(grantedAuthority);
        }

        //Crear El objeto UserDetails que va a ir en sesion y retornarlo.
        UserDetails userFinal = (UserDetails) new org.springframework.security.core.userdetails
                .User(appUser.getUser(), appUser.getPassword(), grantList);
        return userFinal;
    }
}
