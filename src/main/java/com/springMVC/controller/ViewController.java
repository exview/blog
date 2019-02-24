package com.springMVC.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

    @RequestMapping("/toAdmin")
    public String toAdmin(){
        return "jsp/admin/index";
    }

    @RequestMapping("/toAdminHome")
    public String toAdminHome() {
        return "jsp/admin/home";
    }

    @RequestMapping("/toAdminContent")
    public String toAdminContent() {
        return "jsp/admin/content";
    }

    @RequestMapping("/toAdminContentArticle")
    public String toAdminContentArticle() {
        return "jsp/admin/content-article";
    }

    @RequestMapping("/toAdminContentTag")
    public String toAdminContentTag() {
        return "jsp/admin/content-tag";
    }

    @RequestMapping("/toFrontArticleInfo")
    public String toFrontArticleInfo() {
        return "jsp/front/article-info";
    }
}
