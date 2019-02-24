package com.springMVC.service.impl;

import com.springMVC.bean.Article;
import com.springMVC.bean.Tag;
import com.springMVC.dao.ArticleMapper;
import com.springMVC.dao.TagMapper;
import com.springMVC.dao.TagOfArticleMapper;
import com.springMVC.dto.ArticleDto;
import com.springMVC.service.ArticleService;
import com.springMVC.service.TagService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Value("${mdFileSavePath}")
    private String mdFileSavePath;

    @Value("${mdFileURL}")
    private String mdFileURL;

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private TagService tagService = new TagServiceImpl();

    public List<ArticleDto> ListArticle(Integer tagId) {
        List<Article> articles;
        if (tagId == null){
            articles =  articleMapper.selectAll();
        }else {
            articles = articleMapper.selectByTagId(tagId);
        }
        List<ArticleDto> articleDtos = new ArrayList<ArticleDto>();
        for (Article article : articles) {
            ArticleDto articleDto = new ArticleDto();
            BeanUtils.copyProperties(article,articleDto);
            articleDto.setMDFilePath(mdFileURL + article.getMdfile());
            articleDto.setTagName(tagService.getTag(article.getTagid()).getName());
            articleDtos.add(articleDto);
        }
        return articleDtos;
    }

    public Integer addArticle(ArticleDto articleDto) {
        Tag tag = new Tag();
        tag.setName(articleDto.getTagName());
        Integer tagId = tagService.getTagId(tag);
        if (tagId == null){
            tagService.addTag(tag);
            tagId = tagService.getTagId(tag);
        }
        articleDto.setTagid(tagId);

        Article article = new Article();
        BeanUtils.copyProperties(articleDto, article);
        File fileFolder = new File(mdFileSavePath);
        if (!fileFolder.exists()) {
            fileFolder.mkdirs();
        }
        String filePath = System.currentTimeMillis() + "_" + articleDto.getMdFile().getOriginalFilename();
        File file = new File(mdFileSavePath + filePath);
        try{
            articleDto.getMdFile().transferTo(file);
        }catch (IOException e) {
            //TODO 日志打印
            return null;
        }
        article.setMdfile(filePath);
        return articleMapper.insertSelective(article);
    }

    public ArticleDto getArticle(Integer integer) {
        Article article = articleMapper.selectByPrimaryKey(integer);
        ArticleDto articleDto = new ArticleDto();

        Tag tag = tagService.getTag(article.getTagid());

        BeanUtils.copyProperties(article, articleDto);
        articleDto.setTagName(tag.getName());
        articleDto.setMDFilePath(mdFileURL + articleDto.getMdfile());
        return articleDto;
    }

    public Integer deleteById(Integer integer) {
        return null;
    }
}
