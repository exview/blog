package com.springMVC.dto;

import com.springMVC.bean.AdminUser;
import org.springframework.web.multipart.MultipartFile;

public class AdminUserDto extends AdminUser {
    private String imgFilePath;

    private MultipartFile file;

    public String getImgFilePath() {
        return imgFilePath;
    }

    public void setImgFilePath(String imgFilePath) {
        this.imgFilePath = imgFilePath;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
