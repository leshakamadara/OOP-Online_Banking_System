package com.banking.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.banking.model.Account;
import com.banking.model.Customer;
import com.banking.model.Transaction;
import com.banking.service.AccountService;
import com.banking.service.TransactionService;


@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountService accountService;
    private TransactionService transactionService;
    
    public DashboardServlet() {
        super();
        accountService = new AccountService();
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
        int userId = customer.getUserId();
        
        // Get primary account and recent transactions
        Account primaryAccount = accountService.getPrimaryAccount(userId);
        List<Transaction> recentTransactions = null;
        
        if (primaryAccount != null) {
            recentTransactions = transactionService.getRecentTransactions(primaryAccount.getAccountId(), 5);
        }
        
        request.setAttribute("primaryAccount", primaryAccount);
        request.setAttribute("recentTransactions", recentTransactions);
        
        request.getRequestDispatcher("/userDashboard.jsp").forward(request, response);
    }
}