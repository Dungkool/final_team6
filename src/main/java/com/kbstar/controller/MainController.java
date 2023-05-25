package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class MainController {
    @RequestMapping("/")
    public String main(Model model) throws Exception {
        model.addAttribute("center","center");
        return "index";
    }

}
