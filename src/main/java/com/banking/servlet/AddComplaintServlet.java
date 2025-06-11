package com.banking.servlet;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.banking.model.Complaint;
import com.banking.service.ComplaintService;

@WebServlet("/add-complaint")
public class AddComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ComplaintService complaintService;
    
    @Override
    public void init() {
        complaintService = new ComplaintService();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String accountOrNic = request.getParameter("accountOrNic");
        String phoneNumber = request.getParameter("phoneNumber");
        String preferredContactTime = request.getParameter("preferredContactTime");
        String complaintDetails = request.getParameter("complaintDetails");
        
        Complaint complaint = new Complaint(firstName, surname, address, email, 
                accountOrNic, phoneNumber, preferredContactTime, complaintDetails);
        
        try {
            int complaintId = complaintService.submitComplaint(complaint);
            request.setAttribute("message", "Complaint submitted successfully! Reference ID: " + complaintId);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error submitting complaint: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/add-complaint.jsp").forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/add-complaint.jsp").forward(request, response);
    }
}