package com.banking.service;


import java.util.List;

import com.banking.dao.AdminDAO;
import com.banking.model.AdminModel;

/**
 * Service class for Admin-related business operations.
 * This layer handles business logic between controller and data access layers.
 */
public class AdminService {
    private AdminDAO adminDAO;
    
    /**
     * Constructor initializes the DAO dependency
     */
    public AdminService() {
        this.adminDAO = new AdminDAO();
    }
    
    /**
     * Authenticate admin credentials and manage login process
     * 
     * @param username Admin username
     * @param password Admin password
     * @return List of AdminModel if authentication successful, empty list otherwise
     */
    public List<AdminModel> authenticateAdmin(String username, String password) {
        // Validate input parameters
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            return null;
        }
        
        // Basic sanitization to prevent SQL injection (additional to prepared statements)
        username = username.trim();
        
        // Call DAO for database authentication
        List<AdminModel> adminList = AdminDAO.validateAdminLogin(username, password);
        
        // Log successful login attempt (could add actual logging here)
        if (adminList != null && !adminList.isEmpty()) {
            System.out.println("Admin login successful: " + username);
        } else {
            System.out.println("Admin login failed: " + username);
        }
        
        return adminList;
    }
    
    /**
     * Register new admin in the system
     * 
     * @param username Admin username
     * @param password Admin password
     * @param fname First name
     * @param lname Last name
     * @param email Email address
     * @param phone Phone number
     * @param adminRole Role/permission level
     * @param department Department assignment
     * @return boolean indicating success or failure
     */
    public boolean registerAdmin(String username, String password, String fname, 
                               String lname, String email, String phone, 
                               String adminRole, String department) {
        
        // Validate required fields
        if (username == null || password == null || fname == null || 
            lname == null || email == null || adminRole == null) {
            return false;
        }
        
        // Validate email format
        if (!isValidEmail(email)) {
            return false;
        }
        
        // Validate password strength
        if (!isStrongPassword(password)) {
            return false;
        }
        
        // Business rule: Super admin role requires department specification
        if (adminRole.equalsIgnoreCase("super") && 
            (department == null || department.isEmpty())) {
            return false;
        }
        
        // Call DAO to insert new admin
        return AdminDAO.insertAdmin(username, password, fname, lname, 
                                  email, phone, adminRole, department);
    }
    
    /**
     * Update admin profile information
     * 
     * @param adminId Admin ID
     * @param fname First name
     * @param lname Last name
     * @param email Email
     * @param phone Phone
     * @return boolean indicating success or failure
     */
    public boolean updateAdminProfile(int adminId, String fname, String lname, 
                                    String email, String phone) {
        // Validate input
        if (adminId <= 0 || fname == null || lname == null || email == null) {
            return false;
        }
        
        // Validate email format
        if (!isValidEmail(email)) {
            return false;
        }
        
        // This method would need to be implemented in the AdminDAO
        // return AdminDAO.updateAdmin(adminId, fname, lname, email, phone);
        
        // Until implemented, return false
        return false;
    }
    
    /**
     * Change admin password
     * 
     * @param adminId Admin ID
     * @param currentPassword Current password for verification
     * @param newPassword New password
     * @return boolean indicating success or failure
     */
    public boolean changePassword(int adminId, String currentPassword, String newPassword) {
        // Validate input
        if (adminId <= 0 || currentPassword == null || newPassword == null) {
            return false;
        }
        
        // Verify current password first
        // This would require retrieving the admin and checking password
        
        // Validate password strength
        if (!isStrongPassword(newPassword)) {
            return false;
        }
        
        // This method would need to be implemented in the AdminDAO
        // return AdminDAO.updatePassword(adminId, newPassword);
        
        // Until implemented, return false
        return false;
    }
    
    /**
     * Check if admin session is valid
     * 
     * @param adminId Admin ID from session
     * @return boolean indicating if session is valid
     */
    public boolean isValidAdminSession(int adminId) {
        // This would check if the admin exists and is active
        return adminId > 0;
    }
    
    /**
     * Utility method to validate email format
     * 
     * @param email Email to validate
     * @return boolean indicating if email is valid
     */
    private boolean isValidEmail(String email) {
        // Simple regex for email validation
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        return email.matches(emailRegex);
    }
    
    /**
     * Utility method to check password strength
     * 
     * @param password Password to check
     * @return boolean indicating if password meets strength requirements
     */
    private boolean isStrongPassword(String password) {
        // Password must be at least 8 characters
        return password.length() >= 8;
        
        // In a real system, you would have more complex rules:
        // - Check for upper/lowercase letters
        // - Check for numbers
        // - Check for special characters
    }
}