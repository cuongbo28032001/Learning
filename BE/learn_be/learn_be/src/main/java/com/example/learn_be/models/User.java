package com.example.learn_be.models;

import com.example.learn_be.commons.enums.Enums.Gender;
import com.example.learn_be.commons.enums.Role;
import com.example.learn_be.dtos.UserDto;
import jakarta.persistence.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.*;
import java.util.stream.Collectors;

@Entity
@Table(name = "user")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "username", length = 100, nullable = false, unique = true)
    private String username;

    @Column(nullable = false, length = 100)
    private String password;

    //anotation giới tính
    @Enumerated
    @Column(name = "gender")
    private Gender gender;

    @Column(name = "birthday")
    private Date birthday;

    @Column(name = "address", length = 100)
    private String address;

    @Column(name = "phone", length = 14)
    private String phone;

    @Column(name = "email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "role")
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role")
    private Set<Integer> roles =
            new HashSet<>(Arrays.asList(Role.USER.getId()));

    public UserDto toDto() {
        return new UserDto(
                this.id,
                this.name,
                this.gender != null ? this.gender.name() : null,
                this.birthday,
                this.address,
                this.email,
                this.roles.stream().map(r -> Role.fromId(r).name()).collect(Collectors.toSet()));
    }

    public void addRole(Role role) {
        this.roles.add(role.getId());
    }

    public User() {
    }

    public User(String username, String email, String password) {
        this.username = username;
        this.password = password;
        this.email = email;
    }

    @Override

    public Collection<? extends GrantedAuthority> getAuthorities() {
        // TODO Auto-generated method stub
        return roles.stream().map(r -> new SimpleGrantedAuthority(Role.fromId(r).name())).collect(Collectors.toSet());
    }

    public List<String> getRolesString() {
        return roles.stream().map(r -> Role.fromId(r).name()).collect(Collectors.toList());
    }

    @Override
    public String getPassword() {
        // TODO Auto-generated method stub
        return this.password;
    }

    @Override
    public String getUsername() {
        // TODO Auto-generated method stub
        return this.username;
    }

    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<Integer> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        if (roles == null || roles.isEmpty()) {
            this.roles.clear();
        } else {
            this.roles = roles.stream().map(r -> r.getId()).collect(Collectors.toSet());
        }
    }

    public void setRolesInteger(Set<Integer> roles) {
        if (roles == null || roles.isEmpty()) {
            this.roles.clear();
        } else {
            this.roles = roles.stream().map(r -> Role.fromId(r).getId()).collect(Collectors.toSet());
        }
    }

    public void setStringRoles(Set<String> roles) {
        if (roles == null || roles.isEmpty()) {
            this.roles.clear();
        } else {
            this.roles = roles.stream().map(r -> Role.fromDectiption(r).getId()).collect(Collectors.toSet());
        }
    }


}
