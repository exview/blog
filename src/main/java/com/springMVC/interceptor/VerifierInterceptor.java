package com.springMVC.interceptor;

import com.auth0.jwt.internal.org.bouncycastle.asn1.ocsp.ResponseData;
import com.springMVC.bean.AdminUser;
import com.springMVC.utils.CommonUtils;
import com.springMVC.utils.TokenUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VerifierInterceptor implements HandlerInterceptor {
    /**
     * 对拦截的请求进行身份验证
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.setCharacterEncoding("UTF-8");
        String token = request.getParameter("token");

        //判断token是否存在
        if (CommonUtils.isEmpty(token)) {
            AdminUser adminUser = TokenUtils.unsign(token, AdminUser.class);
            String username = request.getParameter("username");
            if (null != username && null != adminUser) {
                if (username.equals(adminUser.getUsername())) {
                    return true;
                }
                else {
                    //TODO 添加错误码
                    return false;
                }
            }
            else {
                //TODO 添加错误码
                return false;
            }
        }
        else {
            //TODO 添加错误码
            return false;
        }
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
