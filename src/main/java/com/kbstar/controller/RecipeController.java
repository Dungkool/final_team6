package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.*;
import com.kbstar.service.*;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
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
    @Autowired
    GoodlistService goodlistService;
    @Autowired
    SubscribeService subscribeService;
    String dir = "recipe/";
    @Value("${uploadimgdir}")
    String imgdir;

    @RequestMapping("/all")
    public String main(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) {
        PageInfo<RecipeBasic> p;
        List<RecipeBasic> recipeList = null;
        try {

            p = new PageInfo<>(recipeService.getPage(pageNo), 5);
            recipeList = p.getList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("target", "recipe");
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("cpage", p);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/detail")
    public String get(Model model, Integer recipepin) throws Exception {
        RecipeBasic recipe = null;
        List<RecipeIngredient> ingredient = null;
        List<RecipeComment> comment = null;

        recipe = recipeService.get(recipepin);

        ingredient = ingredientService.getRecipeAllIngredient(recipepin);
        comment = commentService.getRecipeAllComment(recipepin);

        model.addAttribute("recipedetail", recipe);
        model.addAttribute("ingredientList", ingredient);
        model.addAttribute("recipeComment", comment);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model, RecipeBasic recipeBasic) throws Exception {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addIngredient")
    public String addIngredient(Model model, RecipeBasic recipeBasic) throws Exception {
        model.addAttribute("center", dir + "addIngredient");
        return "index";
    }


    @RequestMapping("/addImpl")
    public String addImpl(Model model, RecipeBasic recipeBasic, MultipartFile img) throws Exception {
        FileUploadUtil.saveFile(img, imgdir, recipeBasic.getRecipetitle() + "_thumb.jpg");
        FileUploadUtil.saveFile(img, imgdir, recipeBasic.getRecipetitle() + "_fin.jpg");
        recipeBasic.setThumbnailimg(recipeBasic.getRecipetitle() + "_thumb.jpg");
        recipeBasic.setFinishedimg(recipeBasic.getRecipetitle() + "_fin.jpg");

        recipeService.register(recipeBasic);

        model.addAttribute("center", dir + "add");
        return "redirect:/recipe/addIngredient";
    }

    @RequestMapping("/deleteImpl")
    public String deleteImpl(Integer recipepinDel) throws Exception {
        RecipeBasic recipeBasic = new RecipeBasic();
        recipeBasic.setRecipepin(recipepinDel);
        recipeService.remove(recipeBasic.getRecipepin());
        return "redirect:/recipe/all";
    }

    @RequestMapping("/search")
    public String search(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String recipetitle) throws Exception {
        PageInfo<RecipeBasic> p;
        List<RecipeBasic> recipeList = null;
        try {
            p = new PageInfo<>(recipeService.getSearch(pageNo, recipetitle), 5);
            recipeList = p.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "recipe");
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("cpage", p);
        model.addAttribute("recipetitle", recipetitle);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/searchType")
    public String searchType(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String type) throws Exception {
        PageInfo<RecipeBasic> p;
        List<RecipeBasic> recipeList = null;
        try {
            if (type != null && type.equals("*")) {
                type = ""; // 선택된 지역 값이 "*"인 경우 빈 문자열로 설정하여 모든 데이터를 조회하도록 함
            }
            p = new PageInfo<>(recipeService.getType(pageNo, type), 5);
            recipeList = p.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "recipe");
        model.addAttribute("recipeList", recipeList);
        model.addAttribute("cpage", p);
        model.addAttribute("type", type);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/commentImpl")
    public String commentImpl(RecipeComment recipeComment, HttpSession session) throws Exception {
        try {
            commentService.register(recipeComment);
//            session.setAttribute("logincust", cust);
        } catch (Exception e) {
            throw new Exception("등록 오류");
        }
        return "redirect:/recipe/detail?recipepin=" + recipeComment.getRecipepin();
    }

    @RequestMapping("/commentDel")
    public String commentDel(RecipeComment recipeComment, RecipeBasic recipeBasic) throws Exception {
        commentService.remove(recipeComment.getRecipecommentpin());
        return "redirect:/recipe/detail?recipepin=" + recipeBasic.getRecipepin();
    }

    @RequestMapping("/likeImpl")
    public String likeImpl(Model model, Integer custpinlike, Integer recipepinlike, HttpSession session) throws Exception {
        try {
            Goodlist goodlist = new Goodlist();
            goodlist.setCustpin(custpinlike);
            goodlist.setRecipepin(recipepinlike);
            goodlistService.register(goodlist);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
            // e.printStackTrace();
        }
        return "redirect:/recipe/detail?recipepin=" + recipepinlike;
    }

    @RequestMapping("/subImpl")
    public String subImpl(Model model, Integer custpinmy, Integer subcustpin, HttpSession session) throws Exception {
        try {
            Subscribe subscribe = new Subscribe();
            subscribe.setCustpin(custpinmy);
            subscribe.setSubcustpin(subcustpin);
            subscribeService.register(subscribe);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
            // e.printStackTrace();
        }
        return "redirect:/apply/mypage";
    }
}
