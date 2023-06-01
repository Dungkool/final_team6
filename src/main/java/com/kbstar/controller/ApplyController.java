package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/apply")
public class ApplyController {

    @Autowired
    CustService custService;
    String dir = "apply/";
    @Value("${uploadimgdir}")
    String imgdir;
    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("center", "apply");
        return "index";
    }

    @RequestMapping("/mypage")
    public String mypage(Model model) {
        model.addAttribute("center", "mypage");
        return "index";
    }

    @RequestMapping("/profilemodify")
    public String profilemodify(Model model) {
        model.addAttribute("center", "profilemodify");
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

        model.addAttribute("center", "center");
        return "index";
    }

    @RequestMapping("/profilemodifyimpl")
    public String profilemodifyimpl(Model model, Cust cust, HttpSession session, MultipartFile img) throws Exception {
        log.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + img.getOriginalFilename());
        if (img == null || img.isEmpty() || img.getOriginalFilename() == null || img.getOriginalFilename().isEmpty()) {
            cust.setProfileimgname(cust.getProfileimgname());
        } else {
            FileUploadUtil.saveFile(img, imgdir, cust.getCustid() + "_profileimg.jpg");
            cust.setProfileimgname(cust.getCustid() + "_profileimg.jpg");
        }
        cust.setPassword(encoder.encode(cust.getPassword()));
        custService.modify(cust);
        session.setAttribute("logincust", cust);

        model.addAttribute("center", "profilemodify");
        return "index";
    }
}
