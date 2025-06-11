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
import com.banking.model.Payee;
import com.banking.service.PayeeService;

@WebServlet("/payees/*")
public class PayeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PayeeService payeeService;
    
    public PayeeServlet() {
        super();
        payeeService = new PayeeService();
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
            // Display all payees
            List<Payee> payees = payeeService.getPayeesByUserId(userId);
            request.setAttribute("payees", payees);
            request.getRequestDispatcher("/userMyPayee.jsp").forward(request, response);
        } else if (pathInfo.equals("/add")) {
            // Show add payee form
            request.getRequestDispatcher("/userAddNewPayee.jsp").forward(request, response);
        } else if (pathInfo.startsWith("/edit/")) {
            // Show edit payee form
            try {
                int payeeId = Integer.parseInt(pathInfo.substring(6));
                Payee payee = payeeService.getPayeeById(payeeId, userId);
                
                if (payee != null) {
                    request.setAttribute("payee", payee);
                    request.getRequestDispatcher("/userEditPayee.jsp").forward(request, response);
                } else {
                    session.setAttribute("errorMessage", "Payee not found");
                    response.sendRedirect(request.getContextPath() + "/payees");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/payees");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/payees");
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
        
        if ("add".equals(action)) {
            // Add a new payee
            String name = request.getParameter("name");
            String accountNumber = request.getParameter("accountNumber");
            String confirmAccountNumber = request.getParameter("confirmAccountNumber");
            String nickname = request.getParameter("nickname");
            String bankName = request.getParameter("bankName");
            String branch = request.getParameter("branch");
            String bankType = request.getParameter("bankType");
            
            // Validate account numbers match
            if (!accountNumber.equals(confirmAccountNumber)) {
                session.setAttribute("errorMessage", "Account numbers do not match");
                response.sendRedirect(request.getContextPath() + "/payees/add");
                return;
            }
            
            Payee payee = new Payee(userId, name, accountNumber, nickname, bankName, branch, bankType);
            
            boolean success = payeeService.addPayee(payee);
            
            if (success) {
                session.setAttribute("successMessage", "Payee added successfully");
                response.sendRedirect(request.getContextPath() + "/payees");
            } else {
                session.setAttribute("errorMessage", "Failed to add payee. Please try again.");
                response.sendRedirect(request.getContextPath() + "/payees/add");
            }
        } else if ("update".equals(action)) {
            // Update an existing payee
            try {
                int payeeId = Integer.parseInt(request.getParameter("payeeId"));
                String name = request.getParameter("name");
                String accountNumber = request.getParameter("accountNumber");
                String nickname = request.getParameter("nickname");
                String bankName = request.getParameter("bankName");
                String branch = request.getParameter("branch");
                String bankType = request.getParameter("bankType");
                
                Payee payee = new Payee(userId, name, accountNumber, nickname, bankName, branch, bankType);
                payee.setPayeeId(payeeId);
                
                boolean success = payeeService.updatePayee(payee);
                
                if (success) {
                    session.setAttribute("successMessage", "Payee updated successfully");
                    response.sendRedirect(request.getContextPath() + "/payees");
                } else {
                    session.setAttribute("errorMessage", "Failed to update payee. Please try again.");
                    response.sendRedirect(request.getContextPath() + "/payees/edit/" + payeeId);
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/payees");
            }
        } else if ("delete".equals(action)) {
            // Delete a payee
            try {
                int payeeId = Integer.parseInt(request.getParameter("payeeId"));
                
                boolean success = payeeService.deletePayee(payeeId, userId);
                
                if (success) {
                    session.setAttribute("successMessage", "Payee deleted successfully");
                } else {
                    session.setAttribute("errorMessage", "Failed to delete payee");
                }
                
                response.sendRedirect(request.getContextPath() + "/payees");
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/payees");
            }
        } else if ("search".equals(action)) {
            // Search payees
            String searchTerm = request.getParameter("searchTerm");
            
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                List<Payee> payees = payeeService.searchPayees(userId, searchTerm);
                request.setAttribute("payees", payees);
                request.setAttribute("searchTerm", searchTerm);
            } else {
                List<Payee> payees = payeeService.getPayeesByUserId(userId);
                request.setAttribute("payees", payees);
            }
            
            request.getRequestDispatcher("/userMyPayee.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/payees");
        }
    }
}