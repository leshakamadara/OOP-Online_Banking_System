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
import com.banking.service.AccountService;

@WebServlet("/account/*")
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountService accountService;
    
    public AccountServlet() {
        super();
        accountService = new AccountService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        // Get the user from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }
        
        Customer customer = (Customer) session.getAttribute("customer");
        int userId = customer.getUserId();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            // Display all accounts
            List<Account> accounts = accountService.getUserAccounts(userId);
            Account primaryAccount = accountService.getPrimaryAccount(userId);
            
            request.setAttribute("accounts", accounts);
            request.setAttribute("primaryAccount", primaryAccount);
            request.getRequestDispatcher("/userAccounts.jsp").forward(request, response);
        } else if (pathInfo.equals("/create")) {
            // Show account creation form
            request.getRequestDispatcher("/userOpenAccounts.jsp").forward(request, response);
        } else if (pathInfo.startsWith("/edit/")) {
            // Show account edit form
            try {
                int accountId = Integer.parseInt(pathInfo.substring(6));
                Account account = accountService.getAccountById(accountId);
                
                if (account != null && account.getUserId() == userId) {
                    request.setAttribute("account", account);
                    request.getRequestDispatcher("/userEditAccount.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/account");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/account");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/account");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        // Get the user from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }
        
        Customer customer = (Customer) session.getAttribute("customer");
        int userId = customer.getUserId();
        
        if ("create".equals(action)) {
            // Create a new account
            String accountName = request.getParameter("accountName");
            String accountType = request.getParameter("accountType");
            boolean isPrimary = request.getParameter("isPrimary") != null && 
                               request.getParameter("isPrimary").equals("true");
            
            Account account = accountService.createAccount(userId, accountName, accountType, isPrimary);
            
            if (account != null) {
                response.sendRedirect(request.getContextPath() + "/account");
            } else {
                request.setAttribute("error", "Failed to create account. Please try again.");
                request.getRequestDispatcher("/userOpenAccounts.jsp").forward(request, response);
            }
        } else if ("update".equals(action)) {
            // Update an existing account
            try {
                int accountId = Integer.parseInt(request.getParameter("accountId"));
                String accountName = request.getParameter("accountName");
                boolean isPrimary = request.getParameter("isPrimary") != null && 
                                   request.getParameter("isPrimary").equals("true");
                boolean active = request.getParameter("active") != null && 
                               request.getParameter("active").equals("true");
                
                boolean success = accountService.updateAccount(accountId, accountName, isPrimary, active, userId);
                
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/account");
                } else {
                    request.setAttribute("error", "Failed to update account. Please try again.");
                    response.sendRedirect(request.getContextPath() + "/account/edit/" + accountId);
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/account");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/account");
        }
    }
}