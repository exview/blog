package com.springMVC.service.impl;

import com.springMVC.bean.AdminUser;
import com.springMVC.dao.AdminUserMapper;
import com.springMVC.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private AdminUserMapper adminUserMapper;

    public Integer checkUser(AdminUser adminUser) {
        Integer userId = adminUserMapper.selectByRecord(adminUser);
        return userId;
    }


    public AdminUser getUserById(Integer integer) {
        if (null != integer) {
            AdminUser adminUser = adminUserMapper.selectByPrimaryKey(integer);
            return adminUser;
        }
        return null;
    }
}
