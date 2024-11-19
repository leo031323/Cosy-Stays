package com.unam.poo.models;

import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.unam.poo.security.model.Role;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
//import org.hibernate.validator.constraints.NotBlank;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//import java.util.Objects;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name="users")
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Basic
    @Column(name = "correo")
    @NotBlank(message = "Email cannot be empty")
    private String correo;

    @Basic
    @Column(name = "telephone")
    @NotBlank(message = "The telephone number cannot be empty")
    private String telephone;

    @Basic
    @Column(name = "description")
    private String description;

    @Basic
    @Column(name = "dni")
    @NotNull
    private Long dni;   

    @Basic
    @Column(name = "name")
    @NotBlank(message = "The name cannot be empty")
    private String name;

    @Basic
    @Column(name = "last_name")
        @NotBlank(message = "Surname cannot be empty")
    private String lastname;

    @Basic
    @Column(name = "password")
    @NotBlank(message = "Password cannot be empty")
    private String password;


    private Boolean active = true;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "users_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();

    @ManyToOne()
    @JoinColumn(name = "city_id")
    @JsonBackReference

    private City city;


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "users_publication", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "publication_id"))
    @JsonManagedReference
    private Set<Publication> favorites = new HashSet<>();

    @OneToOne(mappedBy = "users")
    private Correo mail;

    @OneToOne(mappedBy = "users")
    private Photo photo;

}