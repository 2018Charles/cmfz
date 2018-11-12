package com.baizhi.controller;

import com.baizhi.entity.Admin;
import org.springframework.stereotype.Controller;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@Controller
public class MyFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest servletRequest= (HttpServletRequest) request;
        HttpServletResponse servletResponse= (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

        String path = servletRequest.getRequestURI();
       Admin admin= (Admin) session.getAttribute("login_admin");


        if (admin==null){
            servletResponse.sendRedirect("/cmfz/back/main/login.jsp");
        }else {
            chain.doFilter(request, response);
        }

    }

    @Override
    public void destroy() {

    }
}
