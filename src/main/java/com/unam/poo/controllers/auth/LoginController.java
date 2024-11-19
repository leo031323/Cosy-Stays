package com.unam.poo.controllers.auth;
import com.unam.poo.controllers.PanelUsrController;
import com.unam.poo.dto.LoginDto;
import com.unam.poo.models.Users;
import com.unam.poo.security.model.Role;
import com.unam.poo.security.service.RoleService;
import com.unam.poo.services.UsersService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 

import java.io.IOException;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping; 
 
@Controller
public class LoginController { 

    @Autowired
    UsersService usersService;
    
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    PanelUsrController panelUsrController;

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException { 
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("authentication"); 
        response.sendRedirect(request.getContextPath() + "/");
        return "welcome";
    }

    @GetMapping("/login")
    public String loginLoad() {
        return "authLogin";
    } 


    @PostMapping("/login")
    public String login(Model model, @Validated @ModelAttribute("LoginDto") LoginDto loginDto, HttpServletRequest request, HttpServletResponse response, BindingResult result) {
        if (result.hasErrors()) { 
          return "Error";
        }  
        try { 
            Users user = usersService.getUserByCorreo(loginDto.getCorreo().toString());
            if (user != null){  
                if (user.getActive()){
                    if (passwordEncoder.matches(loginDto.getContrasena(), user.getPassword())){
                        System.out.println("Authentication: redirection...");
                       
                        
                        request.getSession().setAttribute("userId", user.getId()); 
                        request.getSession().setAttribute("authentication", "true");
                        Set<String> roles = user.getRoles().stream()
                                .map(role -> role.getRoleName().name())
                                .collect(Collectors.toSet());
                        request.getSession().setAttribute("roles", roles);

                        
                        response.sendRedirect(request.getContextPath() + "/");
                        return "welcome";
                    }else{
                        System.out.println("ERROR: Password incorrect");
                        model.addAttribute("message", "Password incorrect");
                        return "error";
                        //return "authLogin";
                    }
                }else{
                    System.out.println("ERROR: User inactive");
                    model.addAttribute("message", "User inactive");
                    return "error";
                }
            }else{
                System.out.println("ERROR: User no register");
                model.addAttribute("message", "User no register");
                return "error";
            } 
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            model.addAttribute("message", e.getMessage());
            return "error";
        }


    }
}