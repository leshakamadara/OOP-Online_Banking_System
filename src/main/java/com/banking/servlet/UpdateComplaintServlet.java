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

@WebServlet("/update-complaint")
public class UpdateComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ComplaintService complaintService;
    
    @Override
    public void init() {
        complaintService = new ComplaintService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        try {
            Complaint complaint = complaintService.getComplaintById(id);
            if (complaint != null) {
                request.setAttribute("complaint", complaint);
                request.getRequestDispatcher("/edit-complaint.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Complaint not found with ID: " + id);
                response.sendRedirect(request.getContextPath() + "/list-complaints");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving complaint: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/list-complaints");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String accountOrNic = request.getParameter("accountOrNic");
        String phoneNumber = request.getParameter("phoneNumber");
        String preferredContactTime = request.getParameter("preferredContactTime");
        String complaintDetails = request.getParameter("complaintDetails");
        String status = request.getParameter("status");
        
        try {
            Complaint complaint = complaintService.getComplaintById(id);
            if (complaint != null) {
                complaint.setFirstName(firstName);
                complaint.setSurname(surname);
                complaint.setAddress(address);
                complaint.setEmail(email);
                complaint.setAccountOrNic(accountOrNic);
                complaint.setPhoneNumber(phoneNumber);
                complaint.setPreferredContactTime(preferredContactTime);
                complaint.setComplaintDetails(complaintDetails);
                complaint.setStatus(status);
                
                boolean updated = complaintService.updateComplaint(complaint);
                if (updated) {
                    request.getSession().setAttribute("message", "Complaint updated successfully!");
                } else {
                    request.getSession().setAttribute("error", "Failed to update complaint");
                }
                response.sendRedirect(request.getContextPath() + "/view-complaint?id=" + id);
            } else {
                request.getSession().setAttribute("error", "Complaint not found with ID: " + id);
                response.sendRedirect(request.getContextPath() + "/list-complaints");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Error updating complaint: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/list-complaints");
        }
    }
}