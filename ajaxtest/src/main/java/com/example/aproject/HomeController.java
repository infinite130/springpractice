package com.example.aproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String root() {
        return "home"; // home.jsp를 반환
    }

    @GetMapping("/test1")
    public String home() {
        return "test1"; // test1.jsp를 반환
    }
}
