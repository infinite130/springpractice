package com.vam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingController {

    @GetMapping("/shopping")
    public String shoppingMainPageGET(Model model) {
        // logic
        return "shoppingMainPage";
    }
}
