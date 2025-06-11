package com.banking.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.banking.model.Customer;
import com.banking.utility.DBConnect;

public class customerService {

    public boolean validate(Customer cus) {
        try {
            String query = "SELECT * FROM customer WHERE username = ? AND password = ?";
            Connection conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cus.getUsername().trim());
            ps.setString(2, cus.getPassword().trim());
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                System.out.println("User found in DB: " + rs.getString("username"));
                return true;
            } else {
                System.out.println("No matching user found in DB.");
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void regCustomer(Customer cus) {
        try {
            // Remove accountNumber from the query
            String query = "INSERT INTO customer (username, fullname, branch, contact, gender, nic, email, password) " +
                          "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            Connection conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cus.getUsername().trim());
            ps.setString(2, cus.getFullname().trim());
            ps.setString(3, cus.getBranch().trim());
            ps.setString(4, cus.getContact().trim());
            ps.setString(5, cus.getGender().trim());
            ps.setString(6, cus.getNic().trim());
            ps.setString(7, cus.getEmail().trim());
            ps.setString(8, cus.getPassword().trim());
            
            int rowsInserted = ps.executeUpdate();
            System.out.println("Customer inserted, rows affected: " + rowsInserted);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Customer getCustomer(String username, String password) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM customer WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Customer c = new Customer();
                c.setUserId(rs.getInt("userId")); 
                c.setUsername(rs.getString("username"));
                c.setFullname(rs.getString("fullname"));
                c.setBranch(rs.getString("branch"));
                c.setContact(rs.getString("contact"));
                c.setGender(rs.getString("gender"));
                c.setNic(rs.getString("nic"));
                c.setEmail(rs.getString("email"));
                c.setPassword(rs.getString("password"));
                return c;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateCustomer(Customer customer) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "UPDATE customer SET fullname=?, contact=?, email=? WHERE userId=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, customer.getFullname());
            ps.setString(2, customer.getContact());
            ps.setString(3, customer.getEmail());
            ps.setInt(4, customer.getUserId()); 
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteCustomer(int userId) { // Change parameter to userId
        try {
            String query = "DELETE FROM customer WHERE userId = ?";
            Connection conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId); // Change to setInt for userId
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean validatePassword(int userId, String password) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT password FROM customer WHERE userId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String storedPassword = rs.getString("password");
                return storedPassword.equals(password);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePassword(int userId, String newPassword) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "UPDATE customer SET password = ? WHERE userId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Customer getCustomerById(int userId) {
        Customer customer = null;
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM customer WHERE userId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                customer = new Customer();
                customer.setUserId(rs.getInt("userId"));
                customer.setUsername(rs.getString("username"));
                customer.setFullname(rs.getString("fullname"));
                customer.setBranch(rs.getString("branch"));
                customer.setContact(rs.getString("contact"));
                customer.setGender(rs.getString("gender"));
                customer.setNic(rs.getString("nic"));
                customer.setEmail(rs.getString("email"));
                customer.setPassword(rs.getString("password"));
                customer.setProfilePicture(rs.getString("profilePicture"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }
}


