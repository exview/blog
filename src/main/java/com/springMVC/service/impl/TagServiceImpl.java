package com.springMVC.service.impl;

import com.springMVC.bean.Tag;
import com.springMVC.dao.TagMapper;
import com.springMVC.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private TagMapper tagMapper;

    public Integer getTagId(Tag tag) {
        Tag record =  tagMapper.selectByTagName(tag.getName());
        if (null != record)
            return record.getId();
        return null;
    }

    public Tag addTag(Tag tag) {
        if (tagMapper.selectByTagName(tag.getName()) == null) {
            tagMapper.insertSelective(tag);
            return tagMapper.selectByTagName(tag.getName());
        }
        return null;
    }

    public List<Tag> ListTag() {
        return tagMapper.selectAll();
    }

    public Tag getTag(Integer integer) {
        return tagMapper.selectByPrimaryKey(integer);
    }
}
