package com.banking.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.banking.model.Account;
import com.banking.model.Customer;
import com.banking.model.Payee;
import com.banking.model.Transaction;
import com.banking.service.AccountService;
import com.banking.service.PayeeService;
import com.banking.service.TransactionService;

@WebServlet("/transfer/*")
public class TransferServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountService accountService;
    private PayeeService payeeService;
    private TransactionService transactionService;
    
    public TransferServlet() {
        super();
        accountService = new AccountService();
        payeeService = new PayeeService();
        transactionService = new TransactionService();
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
        
        // Get user accounts
        List<Account> accounts = accountService.getUserAccounts(userId);
        request.setAttribute("accounts", accounts);
        
        if (pathInfo == null || pathInfo.equals("/")) {
            // Default transfer page (quick transfer)
            request.getRequestDispatcher("/transferMoney.jsp").forward(request, response);
        } else if (pathInfo.equals("/payee")) {
            // Transfer to payee page
            List<Payee> payees = payeeService.getPayeesByUserId(userId);
            request.setAttribute("payees", payees);
            request.getRequestDispatcher("/transferMoneyPayee.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/transfer");
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
        
        if ("transfer".equals(action)) {
            // Process transfer
            String transferType = request.getParameter("transferType");
            int fromAccountId = Integer.parseInt(request.getParameter("fromAccount"));
            String transferMode = request.getParameter("transferMode");
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            String remarks = request.getParameter("remarks");
            String purpose = request.getParameter("purpose");
            
            // Create transaction object
            Transaction transaction = new Transaction();
            transaction.setFromAccountId(fromAccountId);
            transaction.setAmount(amount);
            transaction.setTransactionType("TRANSFER");
            transaction.setTransferMode(transferMode);
            transaction.setRemarks(remarks);
            transaction.setPurpose(purpose);
            transaction.setStatus("COMPLETED");
            
            boolean success = false;
            
            if ("quick".equals(transferType)) {
                // Quick transfer
                String toAccount = request.getParameter("toAccount");
                String confirmToAccount = request.getParameter("confirmToAccount");
                String bank = request.getParameter("bank");
                
                // Validate account numbers match
                if (!toAccount.equals(confirmToAccount)) {
                    session.setAttribute("errorMessage", "Account numbers do not match");
                    response.sendRedirect(request.getContextPath() + "/transfer");
                    return;
                }
                
                transaction.setToAccountNumber(toAccount);
                transaction.setBankName(bank);
                
                success = transactionService.createTransaction(transaction);
            } else if ("payee".equals(transferType)) {
                // Payee transfer
                int payeeId = Integer.parseInt(request.getParameter("payeeId"));
                Payee payee = payeeService.getPayeeById(payeeId, userId);
                
                if (payee != null) {
                    transaction.setToAccountNumber(payee.getAccountNumber());
                    transaction.setBankName(payee.getBankName());
                    transaction.setPayeeId(payeeId);
                    
                    success = transactionService.createTransaction(transaction);
                }
            }
            
            if (success) {
                session.setAttribute("successMessage", "Transfer completed successfully");
                response.sendRedirect(request.getContextPath() + "/dashboard");
            } else {
                session.setAttribute("errorMessage", "Transfer failed. Please check your account balance and try again.");
                response.sendRedirect(request.getContextPath() + "/transfer");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/transfer");
        }
    }
}
