package com.unam.poo.controllers.auth;

import com.unam.poo.dto.UsuarioDto;
import com.unam.poo.models.City;
import com.unam.poo.models.Correo;
import com.unam.poo.models.Photo;
import com.unam.poo.models.Users;
import com.unam.poo.security.enums.RoleName;
import com.unam.poo.security.model.Role;
import com.unam.poo.security.service.RoleService;
import com.unam.poo.services.UsersService;
import com.unam.poo.services.City.CityService;
import com.unam.poo.services.Mail.MailService;
import com.unam.poo.services.Photo.PhotoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/register")
@Controller
public class RegisterController {

    @Autowired
    UsersService usersService;
 
    public RegisterController(UsersService usersService) {
        this.usersService = usersService;
    }

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    RoleService roleService;

    @Autowired
    CityService cityService;
    
    @Autowired
    PhotoService photoService;

    @Autowired
    MailService mailService;

    @GetMapping ("/authRegister")
    public String registerLoad(Model model) {
        List<City> cities = cityService.findAll();
        model.addAttribute("city", cities);
        return "authRegister";
    }

    @PostMapping("/newRegister")
    public String register(Model model, @Validated @ModelAttribute("UsuarioDto") UsuarioDto userDto, HttpServletRequest request, HttpServletResponse response, BindingResult result) throws IOException {
        if (result.hasErrors()) {
          return "authRegister";
        } 
        try {
            Users user = new Users();
            if (userDto.getNombre()!="" && userDto.getApellido() != "" && userDto.getCorreo() != ""){
                if (userDto.getDni() > 10000000L){
                    if (userDto.getContrasena().length() > 7 && userDto.getContrasena().length() < 17){
                        City city = cityService.getCityById(userDto.getCity());
                        System.out.println(city);
                        user.setCity(city);
                        user.setName(userDto.getNombre());
                        user.setLastname(userDto.getApellido());
                        user.setTelephone(userDto.getTelefono());
                        user.setDescription("Enter description!");
                        user.setCorreo(userDto.getCorreo());
                        user.setDni(userDto.getDni());
                        user.setPassword(passwordEncoder.encode(userDto.getContrasena()));

                        Set<Role> roles = new HashSet<>();
                        roles.add(roleService.getByRoleName(RoleName.ROLE_USER).get());
                        user.setRoles(roles);

                        Photo photo = new Photo();
                        photo.setUsers(user);
                        photo.setProfile("../assets/img/pp.jpeg");
                        photo.setFront("../assets/img/bgdep.jpeg");
                        photoService.savePhoto(photo);
                        user.setPhoto(photo);

                        Correo correo = new Correo();
                        correo.setUsers(user);
                        mailService.saveCorreo(correo);

                        System.out.println("Registering...");
                        usersService.saveUser(user);
                        System.out.println("Registration successful.");
                        response.sendRedirect(request.getContextPath() + "/login");
                        return "authLogin";
                    }else{
                        System.out.println("ERROR: Password must be greater than 8 characters and less than 16 characters");
                        model.addAttribute("message", "ERROR: Password must be greater than 8 characters and less than 16 characters");
                        return "error";
                    }                
                }else{
                    System.out.println("ERROR:The value of the ID card must be a valid number greater than 10000000");
                    model.addAttribute("message", "The value of the ID card must be a valid number greater than 10000000");
                    return "error";
                }
            }else{
                System.out.println("ERROR: Values must be specified for name, surname, and email");
                model.addAttribute("message", "Values must be specified for name, surname, and email");
                return "error";
            }
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

}
