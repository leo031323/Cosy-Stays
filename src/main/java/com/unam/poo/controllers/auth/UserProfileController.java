package com.unam.poo.controllers.auth;

import java.net.URLDecoder;
import java.util.List;

import com.unam.poo.models.*;
import com.unam.poo.services.Publication.PublicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.unam.poo.dto.LoginDto;
import com.unam.poo.dto.UsuarioDto;
import com.unam.poo.models.Photo;
import com.unam.poo.services.UsersService;
import com.unam.poo.services.CharacteristicAmenity.CharacteristicAmenityService;
import com.unam.poo.services.City.CityService;
import com.unam.poo.services.Amenity.AmenityService;
import com.unam.poo.services.Photo.PhotoService;
import com.unam.poo.services.Province.ProvinceService;
import com.unam.poo.services.Type.TypeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
    @RequestMapping("/user")
public class UserProfileController {

    @Autowired
    PublicationService publicationService;

    @Autowired
    TypeService typeService;

    @Autowired
    UsersService usersService;

    @Autowired
    ProvinceService provinceService;

    @Autowired
    AmenityService amenityService;

    @Autowired
    CharacteristicAmenityService characteristicAmenityService;

    @Autowired
    CityService cityService;
    
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    PhotoService photoService;

    @GetMapping("/profile")
    public String userProfile(Model model, HttpServletRequest request)
    {
        List<Publication> publications = publicationService.findAllByState("active");
        publications.addAll(   publicationService.findAllByState("Rented")   );
        publications.addAll(   publicationService.findAllByState("Deactivate")   );
        List<CharacteristicAmenity> characteristicAmenities = characteristicAmenityService.findAll();

        Long userId = (Long) request.getSession().getAttribute("userId");
        model.addAttribute("users", usersService.getUserById(userId));
        model.addAttribute("publications", publications);
        model.addAttribute("characteristicAmenities", characteristicAmenities);

        List<City> cities = cityService.findAll();
        model.addAttribute("cities", cities);
        
        return "userProfile";
    }

    @PostMapping("/update")
    public String updateProfile(Model model, @Validated @ModelAttribute("UsuarioDto") UsuarioDto userDto, HttpServletRequest request, HttpServletResponse response){
        try {
            System.out.println("PARTICULARS TO APPEAR ON THE OUTER PACKAGING: ");
            System.out.println("Name: " + userDto.getNombre());
            System.out.println("Lastname: " + userDto.getApellido());
            System.out.println("Mail: " + userDto.getCorreo());
            System.out.println("Telephone: " + userDto.getTelefono());
            System.out.println("City ID: " + userDto.getCity());
            System.out.println("Description: " + userDto.getDescripcion());


            Long userId = (Long) request.getSession().getAttribute("userId");
            Users user = usersService.getUserById(userId);
            System.out.println("User : " + user);
            
            City city = cityService.getCityById(userDto.getCity());
            System.out.println("City : " + city);

            System.out.println("Setting city");
            user.setCity(city);
            System.out.println("Setting name");
            user.setName(userDto.getNombre());
            System.out.println("Setting lastname");
            user.setLastname(userDto.getApellido());
            System.out.println("Setting telephone");
            user.setTelephone(userDto.getTelefono());
            System.out.println("Setting description");
            user.setDescription(userDto.getDescripcion());
            System.out.println("Setting email");
            user.setCorreo(userDto.getCorreo());
            System.out.println("Checking...");
            usersService.saveUser(user);
            System.out.println("Update successful.");
            response.sendRedirect(request.getContextPath()+"/user/profile");
            return "userProfile";
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage() + ". Cause: " + e.getCause());
            model.addAttribute("message", e.getMessage() );
            return "error";
        }
    }

    @PostMapping("/configProfile")
    public String configProfile(Model model, @RequestBody String body, HttpServletRequest request, HttpServletResponse response, BindingResult result) {
        if (result.hasErrors()) { 
            model.addAttribute("message", result.getAllErrors().toString());
            return "error";
        }  
        try {    
            Long userId = (Long) request.getSession().getAttribute("userId");
            Users user = usersService.getUserById(userId);
            if ( user != null){
                Photo photo = user.getPhoto();
                String str = body.replace("imagen=", ""); 
                str = URLDecoder.decode(str, "UTF-8");
                System.out.println(str);
                photo.setProfile(str);
                photoService.savePhoto(photo);
            } 
            response.sendRedirect(request.getContextPath() + "/user/profile");
            return "userProfile";             
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

    @PostMapping("/configCover")
    public String configCover(Model model, @RequestBody String body, HttpServletRequest request, HttpServletResponse response, BindingResult result) {
        if (result.hasErrors()) { 
            model.addAttribute("message", result.getAllErrors().toString());
            return "error";
        }  
        try {   
            Long userId = (Long) request.getSession().getAttribute("userId");
            Users user = usersService.getUserById(userId);
            if ( user != null){
                Photo photo = user.getPhoto();
                String str = body.replace("portada=", ""); 
                str = URLDecoder.decode(str, "UTF-8");
                System.out.println(str);
                photo.setFront(str);
                photoService.savePhoto(photo);
            } 
            response.sendRedirect(request.getContextPath() + "/user/profile");
            return "userProfile";            
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

    @PostMapping("/Account")
    public String deleteAccount(Model model, @Validated @ModelAttribute("LoginDto") LoginDto loginDto, HttpServletRequest request, HttpServletResponse response, BindingResult result) {
        if (result.hasErrors()) { 
          return "Error";
        }  
        try { 
            System.out.println("Search for users");
            Users user = usersService.getUserByCorreo(loginDto.getCorreo().toString());
            System.out.println("Find");
            if (user != null){  
                System.out.println("Mail correct, Verify password");
                if (passwordEncoder.matches(loginDto.getContrasena(), user.getPassword())){
                    System.out.println("Authentication: Account cancellation...");
                   
                    user.setActive(false);
                    usersService.saveUser(user);
                    
                    request.getSession().removeAttribute("users");
                    request.getSession().removeAttribute("authentication"); 
                    response.sendRedirect(request.getContextPath() + "/");
                    return "welcome"; 
                }else{
                    System.out.println("ERROR: Password incorrect");
                    model.addAttribute("message", "Password incorrect");
                    return "error";
                }
            }else{
                System.out.println("ERROR: Mail incorrect");
                model.addAttribute("message", "Mail incorrect");
                return "error";
            } 
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

    @PostMapping("/password")
    public String Password(
            @RequestParam("currentPassword") String currentPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpServletRequest request,
            Model model) {

        System.out.println("entering changePassword");

        Long userId = (Long) request.getSession().getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        Users user = usersService.getUserById(userId);

        if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
            model.addAttribute("error", "Current password is incorrect.");
            return "redirect:/user/profile";
        }

        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "New passwords do not match.");
            return "redirect:/user/profile";
        }


        user.setPassword(passwordEncoder.encode(newPassword));
        usersService.saveUser(user);

        model.addAttribute("message", "Password changed successfully.");
        return "redirect:/login";
    }



}
