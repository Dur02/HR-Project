package com.wyu.interceptor;


import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckUserInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest Request, HttpServletResponse Response, Object o) throws Exception {
        //检测用户是否登录
        HttpSession session = Request.getSession();
        String path = Request.getRequestURI();
        if(path.indexOf("login.do")!=-1||path.indexOf("register.do")!=-1||path.indexOf("forward.do")!=-1){
            return true;
        }
        if (session.getAttribute("user")!=null){
            System.out.println("用户已登录");
            return true;
        }else {
            //未登录
            System.out.println("用户未登录");
            //request.getContextPath() == pageContext.request.contextPath
            Response.sendRedirect(Request.getContextPath()+"/login.jsp");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest Request, HttpServletResponse Response, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest Request, HttpServletResponse Response, Object o, Exception e) throws Exception {

    }
}
