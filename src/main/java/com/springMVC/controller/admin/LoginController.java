package com.springMVC.controller.admin;

import com.springMVC.bean.AdminUser;
import com.springMVC.bean.ResponseData;
import com.springMVC.service.UserService;
import com.springMVC.service.impl.UserServiceImpl;
import com.springMVC.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class LoginController {
    @Autowired
    private UserService userService = new UserServiceImpl();

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, Model model){
        AdminUser adminUser = new AdminUser();
        adminUser.setUsername(request.getParameter("username"));
        adminUser.setPassword(request.getParameter("password"));
        ResponseData responseData;

        Integer userId = userService.checkUser(adminUser);
        if (null != userId){
            responseData = ResponseData.ok();
            adminUser.setId(userId);
            String token = TokenUtils.sign(adminUser, 60L * 1000L * 30L);
            adminUser = userService.getUserById(userId);
            responseData.putDataValue("userId", userId);
            responseData.putDataValue("token", token);
            responseData.putDataValue("adminUser", adminUser);
            request.setAttribute("adminUser", adminUser);
            request.setAttribute("userId", userId);
            request.setAttribute("token", token);
            return "Home.jsp";
        }
        else {
            responseData = ResponseData.unauthorized();
            return null;
        }
    }

}
