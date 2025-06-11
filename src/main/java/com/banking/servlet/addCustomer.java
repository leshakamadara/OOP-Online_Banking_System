package com.banking.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.banking.model.Customer;
import com.banking.service.customerService;

@WebServlet("/addCustomer")
public class addCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer cus = new Customer();
        cus.setUsername(request.getParameter("username"));
        cus.setFullname(request.getParameter("fullname"));
        // Remove accountNumber setting
        cus.setBranch(request.getParameter("branch"));
        cus.setContact(request.getParameter("contact"));
        cus.setGender(request.getParameter("gender"));
        cus.setNic(request.getParameter("nic"));
        cus.setEmail(request.getParameter("email"));
        cus.setPassword(request.getParameter("password"));
        
        customerService service = new customerService();
        service.regCustomer(cus);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
        dispatcher.forward(request, response);
    }
}
