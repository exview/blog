package com.springMVC.service;

import com.springMVC.bean.Tag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TagService {
    Integer getTagId(Tag tag);

    Tag addTag(Tag tag);

    List<Tag> ListTag();

    Tag getTag(Integer integer);
}
