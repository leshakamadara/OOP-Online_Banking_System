package com.banking.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.banking.model.Customer;
import com.banking.service.customerService;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        
        if (customer == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validate current password
        customerService service = new customerService();
        boolean isCurrentPasswordValid = service.validatePassword(customer.getUserId(), currentPassword);
        
        if (!isCurrentPasswordValid) {
            session.setAttribute("errorMessage", "Current password is incorrect");
            response.sendRedirect("Update.jsp");
            return;
        }
        
        // Validate new password matches confirmation
        if (!newPassword.equals(confirmPassword)) {
            session.setAttribute("errorMessage", "New passwords do not match");
            response.sendRedirect("Update.jsp");
            return;
        }
        
        // Update password
        boolean success = service.updatePassword(customer.getUserId(), newPassword);
        
        if (success) {
            session.setAttribute("successMessage", "Password updated successfully");
        } else {
            session.setAttribute("errorMessage", "Failed to update password");
        }
        
        response.sendRedirect("Profile.jsp");
    }
}
