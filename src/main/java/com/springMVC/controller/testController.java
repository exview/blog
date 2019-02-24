package com.springMVC.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class testController {

    @ResponseBody
    @RequestMapping("/test")
    public String index(){
        return "Home.jsp";
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/Home.jsp");
        modelAndView.getModel().put("username", "silverspoon");
        return modelAndView;
    }
}
