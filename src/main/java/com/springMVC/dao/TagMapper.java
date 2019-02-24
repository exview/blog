package com.springMVC.dao;

import com.springMVC.bean.Tag;

import java.util.List;

public interface TagMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tag record);

    int insertSelective(Tag record);

    List<Tag> selectAll();

    Tag selectByPrimaryKey(Integer id);

    Tag selectByTagName(String tagName);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);
}