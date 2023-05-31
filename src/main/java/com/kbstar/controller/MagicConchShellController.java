package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/magic")
public class MagicConchShellController {
    @Value("${key}")
    String key;

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center","magicConchShell");
        model.addAttribute("key",key);
        return "index";
    }
}
