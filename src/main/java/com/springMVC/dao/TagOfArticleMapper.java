package com.springMVC.dao;

import com.springMVC.bean.TagOfArticle;

public interface TagOfArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TagOfArticle record);

    int insertSelective(TagOfArticle record);

    TagOfArticle selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TagOfArticle record);

    int updateByPrimaryKey(TagOfArticle record);
}