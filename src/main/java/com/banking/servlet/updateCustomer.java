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

@WebServlet("/UpdateCustomerServlet")
public class updateCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session
        HttpSession session = request.getSession();
        
        // Get the customer from the form parameters
        int userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        
        // Create customer object with form data
        Customer customer = new Customer();
        customer.setUserId(userId);
        customer.setUsername(username);
        customer.setFullname(fullname);
        customer.setContact(contact);
        customer.setEmail(email);
        
        // Get the current customer from session to preserve other fields
        Customer currentCustomer = (Customer) session.getAttribute("customer");
        if (currentCustomer != null) {
            // Preserve fields that weren't updated in the form
            customer.setBranch(currentCustomer.getBranch());
            customer.setGender(currentCustomer.getGender());
            customer.setNic(currentCustomer.getNic());
            customer.setPassword(currentCustomer.getPassword());
            customer.setProfilePicture(currentCustomer.getProfilePicture());
        }
        
        // Update in database
        customerService service = new customerService();
        boolean success = service.updateCustomer(customer);
        
        if (success) {
            // Get fresh data from database
            Customer updatedCustomer = service.getCustomerById(userId);
            
            // Update session with fresh data
            session.setAttribute("customer", updatedCustomer);
            
            // Add success message
            session.setAttribute("successMessage", "Profile updated successfully");
        } else {
            // Add error message
            session.setAttribute("errorMessage", "Failed to update profile");
        }
        
        // Redirect instead of forward to avoid form resubmission issues
        response.sendRedirect("Profile.jsp");
    }
}
