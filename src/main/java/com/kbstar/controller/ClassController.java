package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.ClassBasic;
import com.kbstar.service.ClassService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/cookingclass")
public class ClassController {
    String dir = "cookingclass/";

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    ClassService classService;


    @RequestMapping("/class")
    public String get(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<ClassBasic> c;
        List<ClassBasic> clist;
        //List<ClassBasic> list = classService.get();
        try {
            c = new PageInfo<>(classService.getPage(pageNo), 5);
            clist = c.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0002");
        }
        model.addAttribute("target", "class");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", c);
        model.addAttribute("center", dir + "class");
        return "index";
    }

    @RequestMapping("/search")
    public String search(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String classtitle) throws Exception {
        PageInfo<ClassBasic> c;
        List<ClassBasic> clist;
        try {
            c = new PageInfo<>(classService.getSearch(pageNo, classtitle), 5);
            clist = c.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "class");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", c);
        model.addAttribute("classtitle", classtitle);
        model.addAttribute("center", dir + "class");
        return "index";
    }

    @RequestMapping("/searchlocation")
    public String searchlocation(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String location) throws Exception {
        PageInfo<ClassBasic> c;
        List<ClassBasic> clist;
        try {
            if (location != null && location.equals("*")) {
                clist = classService.get();
                c = new PageInfo<>(clist, 5);
            } else {
                c = new PageInfo<>(classService.getLocation(pageNo, location), 5);
                clist = c.getList();
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "class");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", c);
        model.addAttribute("location", location);
        model.addAttribute("center", dir + "class");
        return "index";
    }

    @RequestMapping("/searchtype")
    public String searchtype(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String type) throws Exception {
        PageInfo<ClassBasic> c;
        List<ClassBasic> clist;
        try {
            if (type != null && type.equals("*")) {
                clist = classService.get();
                c = new PageInfo<>(clist, 5);
            } else {
                c = new PageInfo<>(classService.getLocation(pageNo, type), 5);
                clist = c.getList();
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        model.addAttribute("target", "class");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", c);
        model.addAttribute("type", type);
        model.addAttribute("center", dir + "class");
        return "index";
    }

    @RequestMapping("/searchlocationtype")
    public String searchlocationtype(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, String location, String type) throws Exception {
        PageInfo<ClassBasic> c;
        List<ClassBasic> clist;
        try {
            c = new PageInfo<>(classService.getPage_category(pageNo, location, type), 5);
            clist = c.getList();// 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0002");
        }
        model.addAttribute("target", "class");
        model.addAttribute("clist", clist);
        model.addAttribute("cpage", c);
        model.addAttribute("location", location);
        model.addAttribute("type", type);
        model.addAttribute("center", dir + "class");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model) {
        model.addAttribute("center", dir + "detail");
        return "index";
    }
}
