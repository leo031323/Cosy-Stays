package com.unam.poo.controllers;

import com.unam.poo.models.Users;
import com.unam.poo.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("/panel")
public class PanelUsrController {
    @Autowired
    UsersService usersService;

    @GetMapping("/panelusr")
    public String panelUsr(Model model) {
        List<Users> users = usersService.findAll();
        model.addAttribute("user", users);
        return "table";
    }
}
