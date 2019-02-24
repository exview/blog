package com.springMVC.controller.admin;

import com.springMVC.bean.Article;
import com.springMVC.dto.ArticleDto;
import com.springMVC.service.ArticleService;
import com.springMVC.service.impl.ArticleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class ArticleController {

    @Autowired
    private ArticleService articleService = new ArticleServiceImpl();

    @ResponseBody
    @RequestMapping(value = "/article", method = RequestMethod.GET)
    public List<ArticleDto> listArticle(Article article) {
        //TODO 返回文章列表
        return articleService.ListArticle(null);
    }

    @ResponseBody
    @RequestMapping(value = "/article", method = RequestMethod.POST)
    public Integer addArticle(ArticleDto articleDto) {
        return articleService.addArticle(articleDto);
    }

    @RequestMapping(value = "/article/{articleId}", method = RequestMethod.GET)
    public ArticleDto updateArticleInit(@RequestParam("articleId")Integer articleId) {
        //TODO 返回已有文章的内容
        return null;
    }

    @RequestMapping(value = "/article/{articleId}", method = RequestMethod.POST)
    public void updateArticle(Article article) {
        //TODO  保存修改的文章
    }

    @RequestMapping(value = "/article/{articleId}", method = RequestMethod.DELETE)
    public void deleteById(@RequestParam("articleId")Integer articleId) {
        //TODO 删除文章

    }
}
