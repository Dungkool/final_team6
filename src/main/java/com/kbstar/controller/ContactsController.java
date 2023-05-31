package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/contacts")
public class ContactsController {

//    @Autowired
//    ItemService itemService;
//    @Autowired
//    CartService cartService;

    String dir = "contacts/";

    @RequestMapping("")
    public String main(Model model){

        model.addAttribute("center","contacts");
        return "index";
    }
}
