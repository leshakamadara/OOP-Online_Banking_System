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

@WebServlet("/view-complaint")
public class ViewComplaintServlet extends HttpServlet {
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
                request.getRequestDispatcher("/view-complaint.jsp").forward(request, response);
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
}