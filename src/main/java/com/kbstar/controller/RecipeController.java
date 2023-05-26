package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/recipe")
public class RecipeController {

//    @Autowired
//    ItemService itemService;
//    @Autowired
//    CartService cartService;

    String dir = "recipe/";

    @RequestMapping("/all")
    public String main(Model model){
        model.addAttribute("center",dir + "all");
        return "index";
    }

    @RequestMapping("/detail")
    public String get(Model model, Integer id) throws Exception {
//        Recipe recpie = null;
//        Recipe = recpieService.get(id);
//        model.addAttribute("gitem", item);
        model.addAttribute("center", dir + "detail");
        return "index";
    }
}
