package com.banking.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.banking.model.Account;
import com.banking.utility.DBConnect;

public class AccountService {
    
    // Generate a unique account number
    private String generateAccountNumber() {
        Random random = new Random();
        // Format: 2-digit branch code + 8-digit random number
        String branchCode = "10"; // Default branch code
        StringBuilder sb = new StringBuilder(branchCode);
        
        // Generate 8 random digits
        for (int i = 0; i < 8; i++) {
            sb.append(random.nextInt(10));
        }
        
        return sb.toString();
    }
    
    // Check if account number already exists
    private boolean accountNumberExists(String accountNumber) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT COUNT(*) FROM accounts WHERE accountNumber = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Create a new account
    public Account createAccount(int userId, String accountName, String accountType, boolean isPrimary) {
        Account account = null;
        
        try {
            Connection conn = DBConnect.getConnection();
            
            // Generate a unique account number
            String accountNumber;
            do {
                accountNumber = generateAccountNumber();
            } while (accountNumberExists(accountNumber));
            
            // If this is set as primary, update all other accounts to non-primary
            if (isPrimary) {
                String updateQuery = "UPDATE accounts SET isPrimary = FALSE WHERE userId = ?";
                PreparedStatement updatePs = conn.prepareStatement(updateQuery);
                updatePs.setInt(1, userId);
                updatePs.executeUpdate();
            }
            
            // If this is the first account, make it primary by default
            if (!hasAccounts(userId)) {
                isPrimary = true;
            }
            
            String query = "INSERT INTO accounts (accountNumber, accountName, accountType, userId, isPrimary) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, accountNumber);
            ps.setString(2, accountName);
            ps.setString(3, accountType);
            ps.setInt(4, userId);
            ps.setBoolean(5, isPrimary);
            
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    account = new Account();
                    account.setAccountId(rs.getInt(1));
                    account.setAccountNumber(accountNumber);
                    account.setAccountName(accountName);
                    account.setAccountType(accountType);
                    account.setBalance(0.00);
                    account.setUserId(userId);
                    account.setPrimary(isPrimary);
                    account.setActive(true);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return account;
    }
    
    // Check if user has any accounts
    private boolean hasAccounts(int userId) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT COUNT(*) FROM accounts WHERE userId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get all accounts for a user
    public List<Account> getUserAccounts(int userId) {
        List<Account> accounts = new ArrayList<>();
        
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM accounts WHERE userId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("accountId"));
                account.setAccountNumber(rs.getString("accountNumber"));
                account.setAccountName(rs.getString("accountName"));
                account.setAccountType(rs.getString("accountType"));
                account.setBalance(rs.getDouble("balance"));
                account.setUserId(rs.getInt("userId"));
                account.setPrimary(rs.getBoolean("isPrimary"));
                account.setActive(rs.getBoolean("active"));
                accounts.add(account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return accounts;
    }
    
    // Get primary account for a user
    public Account getPrimaryAccount(int userId) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM accounts WHERE userId = ? AND isPrimary = TRUE";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("accountId"));
                account.setAccountNumber(rs.getString("accountNumber"));
                account.setAccountName(rs.getString("accountName"));
                account.setAccountType(rs.getString("accountType"));
                account.setBalance(rs.getDouble("balance"));
                account.setUserId(rs.getInt("userId"));
                account.setPrimary(rs.getBoolean("isPrimary"));
                account.setActive(rs.getBoolean("active"));
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    // Update account details
    public boolean updateAccount(int accountId, String accountName, boolean isPrimary, boolean active, int userId) {
        try {
            Connection conn = DBConnect.getConnection();
            
            // If setting this account as primary, update all other accounts to non-primary
            if (isPrimary) {
                String updateQuery = "UPDATE accounts SET isPrimary = FALSE WHERE userId = ?";
                PreparedStatement updatePs = conn.prepareStatement(updateQuery);
                updatePs.setInt(1, userId);
                updatePs.executeUpdate();
            }
            
            String query = "UPDATE accounts SET accountName = ?, isPrimary = ?, active = ? WHERE accountId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, accountName);
            ps.setBoolean(2, isPrimary);
            ps.setBoolean(3, active);
            ps.setInt(4, accountId);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    // Get account by ID
    public Account getAccountById(int accountId) {
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM accounts WHERE accountId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("accountId"));
                account.setAccountNumber(rs.getString("accountNumber"));
                account.setAccountName(rs.getString("accountName"));
                account.setAccountType(rs.getString("accountType"));
                account.setBalance(rs.getDouble("balance"));
                account.setUserId(rs.getInt("userId"));
                account.setPrimary(rs.getBoolean("isPrimary"));
                account.setActive(rs.getBoolean("active"));
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}