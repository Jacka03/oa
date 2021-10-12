package com.oa.filter;

import com.oa.pojo.Employee;
import com.oa.pojo.User;
import org.springframework.ui.Model;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/*"})
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//强制类型转换为HttpServletRequest
        HttpServletRequest request = (HttpServletRequest) servletRequest;

        // HttpSession session=request.getSession();
        // Employee nowEmployee = (Employee) session.getAttribute("NowEmployee");
        // System.out.println(nowEmployee);

        //获取请求uri
        String uri = request.getRequestURI();
        //登录拦截
        //--1获取session中的NowUser
        // User nowUser = (User) request.getAttribute("NowUser");
        // System.out.println(nowUser);
        //
        // Employee nowEmployee = (Employee) request.getAttribute("NowEmployee");
        // System.out.println(nowEmployee);

        User nowUser = (User) request.getSession().getAttribute("NowUser");
        System.out.println(nowUser);

        Employee nowEmployee = (Employee) request.getSession().getAttribute("NowEmployee");
        System.out.println(nowEmployee);
        System.out.println("------------");

        //允许一些固定的请求访问
        // if(uri.equals("/oa/loginUser")||uri.contains("assets")){//用户已经登录--样式允许访问
        if(uri.equals("/oa/loginUser")
                ||uri.contains("/oa/queryEmployeeLogin")
                ||uri.contains("/oa/logout")
                // ||uri.contains("assets")
                ||uri.contains(".jsp")){//用户已经登录
            //请求允许通过
            // System.out.println(uri+"around");
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
        // filterChain.doFilter(servletRequest,servletResponse);

        //--判断
        if(nowUser != null || nowEmployee != null){//用户已经登录
            //请求允许通过
            System.out.println(uri+"around");
            filterChain.doFilter(servletRequest,servletResponse);
        }else{//跳转回到登录页面
            System.out.println(uri+"false");
            request.getRequestDispatcher("login_Emp.jsp").forward(request,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
