package com.banking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.banking.model.AdminModel;
import com.banking.utility.DBConnect;


public class AdminDAO {
	private static Connection con = null;
    private static PreparedStatement pstmt = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
    // Admin login validation
    public static List<AdminModel> validateAdminLogin(String username, String password) {
        ArrayList<AdminModel> admin = new ArrayList<>();
        
        try {
            // Get DB connection
            con = DBConnect.getConnection();
            
            // Use PreparedStatement for better security
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                int id = rs.getInt("id");
                String uname = rs.getString("username");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String email = rs.getString("email");
                String adminRole = rs.getString("admin_role");
                String department = rs.getString("department");
                
                // Create admin model with essential info for session
                AdminModel adminModel = new AdminModel(id, uname, fname, lname, email, 
                                                              adminRole, department);
                admin.add(adminModel);
                
                // Update last_login timestamp
                updateLastLogin(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            closeResources();
        }
        
        return admin;
    }
    
    // Update last login time
    private static void updateLastLogin(int adminId) {
        try {
            String updateSql = "UPDATE admin SET last_login = CURRENT_TIMESTAMP WHERE id = ?";
            pstmt = con.prepareStatement(updateSql);
            pstmt.setInt(1, adminId);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Insert new admin
    public static boolean insertAdmin(String username, String password, String fname, 
                                     String lname, String email, String phone, 
                                     String adminRole, String department) {
        boolean isSuccess = false;
        
        try {
            con = DBConnect.getConnection();
            
            String sql = "INSERT INTO admin (username, password, fname, lname, email, phone, " +
                         "admin_role, department) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, fname);
            pstmt.setString(4, lname);
            pstmt.setString(5, email);
            pstmt.setString(6, phone);
            pstmt.setString(7, adminRole);
            pstmt.setString(8, department);
            
            int result = pstmt.executeUpdate();
            if (result > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        
        return isSuccess;
    }
    
    // Close all database resources
    private static void closeResources() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}