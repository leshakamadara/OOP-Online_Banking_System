package com.banking.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.banking.model.AdminModel;
import com.banking.service.AdminService;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get login parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            // Validate login credentials
        	AdminService adminService = new AdminService();
        	List<AdminModel> adminLogin = adminService.authenticateAdmin(username, password);
            
            if (adminLogin != null && !adminLogin.isEmpty()) {
                // Create session
                HttpSession session = request.getSession();
                
                // Get admin details
                AdminModel admin = adminLogin.get(0);
                
                // Store admin information in session
                session.setAttribute("adminId", admin.getId());
                session.setAttribute("adminUsername", admin.getUsername());
                session.setAttribute("adminFname", admin.getFname());
                session.setAttribute("adminLname", admin.getLname());
                session.setAttribute("adminEmail", admin.getEmail());
                session.setAttribute("adminRole", admin.getAdminRole());
                session.setAttribute("adminDept", admin.getDepartment());
                
                // Set session timeout (30 minutes)
                session.setMaxInactiveInterval(30*60);
                
                // Redirect to admin home page with success message
                String alertMess = "Login Successful!";
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('" + alertMess + "');" +
                    "window.location.href='adminHome.jsp'</script>");
            } else {
                // Invalid credentials, redirect back to login page
                String alertMess = "Invalid admin credentials! Please try again.";
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('" + alertMess + "');" +
                    "window.location.href='adminLogin.jsp'</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminLogin.jsp");
        }
    }
}