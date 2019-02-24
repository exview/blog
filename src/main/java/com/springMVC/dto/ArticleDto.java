package com.springMVC.dto;

import com.springMVC.bean.Article;
import org.springframework.web.multipart.MultipartFile;

public class ArticleDto extends Article {
    private String tagName;
    private String MDFilePath;
    private MultipartFile mdFile;

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public MultipartFile getMdFile() {
        return mdFile;
    }

    public void setMdFile(MultipartFile mdFile) {
        this.mdFile = mdFile;
    }

    public String getMDFilePath() {
        return MDFilePath;
    }

    public void setMDFilePath(String MDFilePath) {
        this.MDFilePath = MDFilePath;
    }
}
