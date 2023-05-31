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
    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center","magicConchShell");
        return "index";
    }
}
