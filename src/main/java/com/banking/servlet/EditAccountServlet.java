package com.banking.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.banking.model.Account;
import com.banking.service.AccountService;

@WebServlet("/editAccount")
public class EditAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private AccountService accountService = new AccountService();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String accountIdStr = request.getParameter("accountId");
        
        if (accountIdStr != null && !accountIdStr.isEmpty()) {
            try {
                int accountId = Integer.parseInt(accountIdStr);
                Account account = accountService.getAccountById(accountId);
                
                if (account != null) {
                    request.setAttribute("account", account);
                    request.getRequestDispatcher("userEditAccount.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                // Invalid account ID format
            }
        }
        
        // If we get here, something went wrong
        response.sendRedirect(request.getContextPath() + "/accounts");
    }
}
