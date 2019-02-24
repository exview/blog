package com.springMVC.controller.front;

import com.springMVC.dto.ArticleDto;
import com.springMVC.service.ArticleService;
import com.springMVC.service.impl.ArticleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class FrontArticleController {

    @Autowired
    private ArticleService articleService = new ArticleServiceImpl();

    @ResponseBody
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public List<ArticleDto> AllArticle() {
        return articleService.ListArticle(null);
    }

    @ResponseBody
    @RequestMapping(value = "/{tagId}", method = RequestMethod.GET)
    public List<ArticleDto> ArticleByTag(@PathVariable Integer tagId) {
        return articleService.ListArticle(tagId);
    }

    @RequestMapping(value = "article/{articleId}", method = RequestMethod.GET)
    public String ArticleByPrimaryId(@PathVariable Integer articleId, HttpServletRequest request) {
        ArticleDto articleDto = articleService.getArticle(articleId);
        request.setAttribute("articleDto", articleDto);
        return "jsp/front/article-info";
    }
}
