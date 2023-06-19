package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Contact;
import com.kbstar.dto.Notice;
import com.kbstar.service.ContactService;
import com.kbstar.service.NoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/contacts")
public class ContactsController {

    @Autowired
    ContactService contactService;

    @Autowired
    NoticeService noticeService;

    @RequestMapping("")
    public String main(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Notice> p;
        try {
            p = new PageInfo<>(noticeService.getPage(pageNo), 5);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("target", "contacts");
        model.addAttribute("nlist", p);
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
        model.addAttribute("center", "contacts");
        return "index";
    }

    @RequestMapping("/notice_detail")
    public String notice_detail(Model model, Notice notice, HttpSession session) throws Exception {
        Notice n;
        n = noticeService.get(notice.getNoticepin());
        model.addAttribute("noticedetail", n);
        model.addAttribute("center", "notice_detail");
        return "index";
    }
}
