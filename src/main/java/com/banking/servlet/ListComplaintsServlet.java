package com.banking.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.banking.model.Complaint;
import com.banking.service.ComplaintService;

@WebServlet("/list-complaints")
public class ListComplaintsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ComplaintService complaintService;
    
    @Override
    public void init() {
        complaintService = new ComplaintService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            List<Complaint> complaints = complaintService.getAllComplaints();
            request.setAttribute("complaints", complaints);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving complaints: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/list-complaints.jsp").forward(request, response);

    }
}