package com.springMVC.service;

import com.springMVC.dto.ArticleDto;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface ArticleService {

    List<ArticleDto> ListArticle(Integer tagId);

    Integer addArticle(ArticleDto articleDto);

    ArticleDto getArticle(Integer integer);

    Integer deleteById(Integer integer);
}
