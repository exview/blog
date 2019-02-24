package com.springMVC.controller.admin;

import com.springMVC.bean.Tag;
import com.springMVC.service.TagService;
import com.springMVC.service.impl.TagServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class TagController {

    @Autowired
    private TagService tagService = new TagServiceImpl();

    @ResponseBody
    @RequestMapping(value = "/tag", method = RequestMethod.GET)
    public List<Tag> ListTag(){
        return tagService.ListTag();
    }

    @ResponseBody
    @RequestMapping(value = "/tag", method = RequestMethod.POST)
    public Tag addTag(Tag tag) {
        return tagService.addTag(tag);
    }
}