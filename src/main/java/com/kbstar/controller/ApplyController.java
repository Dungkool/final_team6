package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/apply")
public class ApplyController {

    @Autowired
    CustService custService;
    String dir = "apply/";
    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("center", "apply");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Cust cust, HttpSession session) throws Exception {
        try {
            cust.setPassword(encoder.encode(cust.getPassword()));
            custService.register(cust);
            session.setAttribute("logincust", cust);
        } catch (Exception e) {
            throw new Exception("가입 오류");
        }

        model.addAttribute("rcust", cust);
        model.addAttribute("center", "center");
        return "index";
    }
}
