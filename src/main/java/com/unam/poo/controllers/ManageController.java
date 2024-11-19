package com.unam.poo.controllers;

import com.unam.poo.dto.UsuarioDto;
import com.unam.poo.models.City;
import com.unam.poo.models.Users;
import com.unam.poo.services.City.CityService;
import com.unam.poo.services.UsersService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/manage")
public class ManageController {

    private static final Logger logger = LoggerFactory.getLogger(ManageController.class);

    @Autowired
    private UsersService usersService;

    @Autowired
    private CityService cityService;

    @GetMapping("/user")
    public String showUsers(Model model, HttpServletRequest request) {
        List<City> cities = cityService.findAll();
        List<Users> user = usersService.findAll();
        model.addAttribute("users", user);
        model.addAttribute("cities", cities);
        return "manage";
    }

    @PostMapping("/updateuser")
    public String updateProfile(@RequestParam("id") Long id,
                                @RequestParam("name") String name,
                                @RequestParam("lastname") String lastname,
                                @RequestParam("correo") String correo,
                                @RequestParam("telephone") String telephone,
                                @RequestParam("description") String description,
                                @RequestParam("city") Long cityId,
                                Model model) {
        try {
            logger.info("Received update for User ID: {}", id);
            logger.info("Name: {}", name);
            logger.info("Last Name: {}", lastname);
            logger.info("Email: {}", correo);
            logger.info("Telephone: {}", telephone);
            logger.info("Description: {}", description);
            logger.info("City ID: {}", cityId);

            // 查找并更新用户信息
            Users user = usersService.getUserById(id);
            user.setName(name);
            user.setLastname(lastname);
            user.setCorreo(correo);
            user.setTelephone(telephone);
            user.setDescription(description);
            City city = cityService.getCityById(cityId);
            user.setCity(city);
            if (city == null) {
                model.addAttribute("message", "City not found.");
                return "error";
            }

            // save updated user information
//            usersService.updateAndSaveUser(user, id);
            usersService.saveUser(user);
            return "redirect:/manage/user";
        } catch (Exception e) {
            logger.error("Error updating user", e);
            model.addAttribute("message", "An error occurred while updating the profile: " + e.getMessage());
            return "error";
        }
    }

    @PostMapping("/account")
    public String deleteAccount(Long id){
        Users user = usersService.getUserById(id);
        logger.info("Received delete for User ID: {}", id);
        user.setActive(false);
        usersService.saveUser(user);
        return "redirect:/manage/user";
    }

}
