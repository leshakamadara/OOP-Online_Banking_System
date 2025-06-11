package com.banking.utility;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(urlPatterns = {"/adminHome.jsp", "/adminDashboard.jsp", "/adminProfile.jsp"})
public class AdminAuthenticationFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, 
            FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        HttpSession session = httpRequest.getSession(false);
        
        boolean isLoggedIn = (session != null && session.getAttribute("adminId") != null);
        
        if (isLoggedIn) {
            chain.doFilter(request, response);
        } else {
            String alertMessage = "Please login as admin first!";
            httpResponse.setContentType("text/html");
            httpResponse.getWriter().println("<script>alert('" + alertMessage + "');" +
                "window.location.href='adminLogin.jsp'</script>");
        }
    }
    
    @Override
    public void destroy() {
    }
}