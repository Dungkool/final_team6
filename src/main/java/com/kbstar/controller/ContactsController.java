package com.kbstar.controller;

import com.kbstar.dto.Contact;
import com.kbstar.service.ContactService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/contacts")
public class ContactsController {

    @Autowired
    ContactService contactService;
    String dir = "contacts/";

    @RequestMapping("")
    public String main(Model model) {

        model.addAttribute("center", "contacts");
        return "index";
    }

    @RequestMapping("/contactimpl")
    public String contactimpl(Model model, Contact contact, HttpSession session) throws Exception {
        try {
            contactService.register(contact);
        } catch (Exception e) {
            throw new Exception("등록 오류");
        }
        model.addAttribute("center", "center");
        return "index";
    }
}
