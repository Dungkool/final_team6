package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.RecipeBasic;
import com.kbstar.dto.RecipeComment;
import com.kbstar.dto.RecipeIngredient;
import com.kbstar.service.IngredientService;
import com.kbstar.service.RecipeCommentService;
import com.kbstar.service.RecipeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/recipe")
public class RecipeController {

    @Autowired
    RecipeService recipeService;
    @Autowired
    IngredientService ingredientService;
    @Autowired
    RecipeCommentService commentService;
    String dir = "recipe/";

    @RequestMapping("/all")
    public String main(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model){
        PageInfo<RecipeBasic> p;
        List<RecipeBasic> recipeList = null;
        try {
            p = new PageInfo<>(recipeService.getPage(pageNo), 3);
            recipeList = p.getList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("target", "recipe");
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("cpage", p);
        model.addAttribute("center",dir + "all");
        return "index";
    }

    @RequestMapping("/detail")
    public String get(Model model, Integer recipepin) throws Exception {
        RecipeBasic recipe = null;
        List<RecipeIngredient> ingredient = null;
        List<RecipeComment> comment = null;

        recipe = recipeService.get(recipepin);
        ingredient = ingredientService.getAllIngredient(recipepin);
        comment = commentService.getAllIngredient(recipepin);

        model.addAttribute("recipedetail", recipe);
        model.addAttribute("ingredientList", ingredient);
        model.addAttribute("recipeComment", comment);
        model.addAttribute("center", dir + "detail");
        return "index";
    }
}
