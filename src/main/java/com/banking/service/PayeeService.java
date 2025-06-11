package com.banking.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.banking.model.Payee;
import com.banking.utility.DBConnect;

public class PayeeService {
    
    // Add a new payee
    public boolean addPayee(Payee payee) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "INSERT INTO payees (userId, name, accountNumber, nickname, bankName, branch, payeeType) " +
                          "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, payee.getUserId());
            ps.setString(2, payee.getName());
            ps.setString(3, payee.getAccountNumber());
            ps.setString(4, payee.getNickname());
            ps.setString(5, payee.getBankName());
            ps.setString(6, payee.getBranch());
            ps.setString(7, payee.getPayeeType());
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all payees for a user
    public List<Payee> getPayeesByUserId(int userId) {
        List<Payee> payees = new ArrayList<>();
        
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM payees WHERE userId = ? ORDER BY dateAdded DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Payee payee = new Payee();
                payee.setPayeeId(rs.getInt("payeeId"));
                payee.setUserId(rs.getInt("userId"));
                payee.setName(rs.getString("name"));
                payee.setAccountNumber(rs.getString("accountNumber"));
                payee.setNickname(rs.getString("nickname"));
                payee.setBankName(rs.getString("bankName"));
                payee.setBranch(rs.getString("branch"));
                payee.setPayeeType(rs.getString("payeeType"));
                payee.setDateAdded(rs.getTimestamp("dateAdded"));
                payee.setLastUpdated(rs.getTimestamp("lastUpdated"));
                payees.add(payee);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return payees;
    }
    
    // Search payees by name or nickname
    public List<Payee> searchPayees(int userId, String searchTerm) {
        List<Payee> payees = new ArrayList<>();
        
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM payees WHERE userId = ? AND " +
                          "(name LIKE ? OR nickname LIKE ? OR accountNumber LIKE ?) " +
                          "ORDER BY dateAdded DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, "%" + searchTerm + "%");
            ps.setString(3, "%" + searchTerm + "%");
            ps.setString(4, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Payee payee = new Payee();
                payee.setPayeeId(rs.getInt("payeeId"));
                payee.setUserId(rs.getInt("userId"));
                payee.setName(rs.getString("name"));
                payee.setAccountNumber(rs.getString("accountNumber"));
                payee.setNickname(rs.getString("nickname"));
                payee.setBankName(rs.getString("bankName"));
                payee.setBranch(rs.getString("branch"));
                payee.setPayeeType(rs.getString("payeeType"));
                payee.setDateAdded(rs.getTimestamp("dateAdded"));
                payee.setLastUpdated(rs.getTimestamp("lastUpdated"));
                payees.add(payee);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return payees;
    }
    
    // Get a payee by ID
    public Payee getPayeeById(int payeeId, int userId) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM payees WHERE payeeId = ? AND userId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, payeeId);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Payee payee = new Payee();
                payee.setPayeeId(rs.getInt("payeeId"));
                payee.setUserId(rs.getInt("userId"));
                payee.setName(rs.getString("name"));
                payee.setAccountNumber(rs.getString("accountNumber"));
                payee.setNickname(rs.getString("nickname"));
                payee.setBankName(rs.getString("bankName"));
                payee.setBranch(rs.getString("branch"));
                payee.setPayeeType(rs.getString("payeeType"));
                payee.setDateAdded(rs.getTimestamp("dateAdded"));
                payee.setLastUpdated(rs.getTimestamp("lastUpdated"));
                return payee;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    // Update a payee
    public boolean updatePayee(Payee payee) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "UPDATE payees SET name = ?, accountNumber = ?, nickname = ?, " +
                          "bankName = ?, branch = ?, payeeType = ? WHERE payeeId = ? AND userId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, payee.getName());
            ps.setString(2, payee.getAccountNumber());
            ps.setString(3, payee.getNickname());
            ps.setString(4, payee.getBankName());
            ps.setString(5, payee.getBranch());
            ps.setString(6, payee.getPayeeType());
            ps.setInt(7, payee.getPayeeId());
            ps.setInt(8, payee.getUserId());
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Delete a payee
    public boolean deletePayee(int payeeId, int userId) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "DELETE FROM payees WHERE payeeId = ? AND userId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, payeeId);
            ps.setInt(2, userId);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}