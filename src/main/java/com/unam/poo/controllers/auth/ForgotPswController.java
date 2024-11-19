package com.unam.poo.controllers.auth;


import java.util.UUID;

import com.unam.poo.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.unam.poo.models.Correo;
import com.unam.poo.models.Users;
import com.unam.poo.services.Mail.MailServiceImpl;
import com.unam.poo.services.SpringMailSender.MailSenderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/forgotpsw")
public class ForgotPswController {

    @Autowired
    MailSenderService emailSender;
    
    @Autowired
    UsersService uService;

    @Autowired
    MailServiceImpl mailService;

    @Autowired
    PasswordEncoder passwordEncoder;
 

    @GetMapping("/")
    public String forgotpswload() {
        return "authForgotPsw";
    } 

    @PostMapping("/sendCode")
    public String sendCode(Model model, @RequestBody String mail, HttpServletRequest request, HttpServletResponse response){
        try {
            mail = mail.replace("%40", "@");
            String arr[] = mail.split("=");
            mail = arr[1];
            System.out.println(mail);
            
            String code = UUID.randomUUID().toString();

            String toInternetAddress = mail;
            String subject = "Password reset code";
            String body = code;

            emailSender.sendCustomMail(toInternetAddress, subject, body);

            Correo aux = mailService.getCorreoByMail(mail);
            aux.setCode(code);
            mailService.saveCorreo(aux);
            System.out.println("Code: " + code);
            response.sendRedirect(request.getContextPath() + "/forgotpsw/");
            return "authForgotPsw";
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            model.addAttribute("message", e.getMessage());
            return "error";
        }
        
    }
   
    @PostMapping("/reestablishPassword")
    public String reestablishPassword(Model model, @RequestBody String correo, @RequestBody String code, @RequestBody String password, HttpServletRequest request, HttpServletResponse response){
        try { 
            correo = correo.replace("%40", "@");
            String arr[] = correo.split("=");
            correo = arr[1]; //correo@gmail.com&code
            correo = correo.replace("&codigo", "");

            code = arr[2]; //code&password
            code = code.replace("&password", "");

            password = arr[3];

            System.out.println("Mail: " + correo);
            System.out.println("Code: " + code);
            System.out.println("Password: " + password);
            if (uService.getUserByCorreo(correo) != null){
                System.out.println("USER FIND");
                Users user = uService.getUserByCorreo(correo);
                if (user.getMail().getCode().equals(code)){
                    user.setPassword(passwordEncoder.encode(password));
                    uService.saveUser(user);
                    Correo mail = mailService.getCorreoByMail(correo);
                    mail.setCode("");
                    mailService.saveCorreo(mail);
                    System.out.println("Password changed successfully");
                    response.sendRedirect(request.getContextPath() + "/");
                }else{
                    System.out.println("Code incorrect");
                    model.addAttribute("message", "Code incorrect");
                    return "error";
                }
            }else{
                System.out.println("Email not registered");
                model.addAttribute("message", "Email not registered");
                return "error";
            }           
            return "welcome";
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            model.addAttribute("message", e.getMessage());
            return "error";
        }
        
    }
}
