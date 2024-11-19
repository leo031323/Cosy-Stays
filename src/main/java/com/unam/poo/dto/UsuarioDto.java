package com.unam.poo.dto;
 
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UsuarioDto { 
    
    private String correo;

    private String telefono;

    private String descripcion;

    private Long dni;   

    private String nombre;

    private String apellido;

    private String contrasena;

    private Long city;
}
