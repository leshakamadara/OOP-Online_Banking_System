package com.banking.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.banking.model.Customer;
import com.banking.model.Transaction;
import com.banking.service.TransactionService;

@WebServlet("/transaction")
public class TransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TransactionService transactionService;
    
    public TransactionServlet() {
        super();
        transactionService = new TransactionService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the user from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }
        
        Customer customer = (Customer) session.getAttribute("customer");
        int userId = customer.getUserId(); // You'll need to add this method to your Customer class
        
        // Check if there's a search term
        String searchTerm = request.getParameter("searchTerm");
        List<Transaction> transactions;
        
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            transactions = transactionService.searchTransactions(userId, searchTerm);
            request.setAttribute("searchTerm", searchTerm);
        } else {
            transactions = transactionService.getUserTransactions(userId);
        }
        
        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("/userTransactions.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
