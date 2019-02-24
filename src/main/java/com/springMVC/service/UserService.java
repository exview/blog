package com.springMVC.service;

import com.springMVC.bean.AdminUser;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    public Integer checkUser(AdminUser adminUser);

    public AdminUser getUserById(Integer integer);
}
