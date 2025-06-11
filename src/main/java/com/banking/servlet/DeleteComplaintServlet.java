package com.banking.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.banking.service.ComplaintService;

@WebServlet("/delete-complaint")
public class DeleteComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ComplaintService complaintService;
    
    @Override
    public void init() {
        complaintService = new ComplaintService();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        try {
            boolean deleted = complaintService.deleteComplaint(id);
            if (deleted) {
                request.getSession().setAttribute("message", "Complaint deleted successfully!");
            } else {
                request.getSession().setAttribute("error", "Failed to delete complaint");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Error deleting complaint: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/list-complaints");

    }
}