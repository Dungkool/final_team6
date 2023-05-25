package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/class")
public class ClassController {

//    @Autowired
//    ItemService itemService;
//    @Autowired
//    CartService cartService;

    String dir = "class/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center","class");
        return "index";
    }
}
