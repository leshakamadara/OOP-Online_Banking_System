package com.banking.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.banking.service.customerService;

@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String userIdParam = request.getParameter("userId");
    	System.out.println("Received userId: " + userIdParam);

        // Get userId instead of username
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        customerService service = new customerService();
        boolean success = service.deleteCustomer(userId);
        
        if (success) {
            response.sendRedirect("Login.jsp?message=Account deleted successfully.");
        } else {
            response.sendRedirect("Update.jsp?error=Failed to delete account.");
        }
    }
}
