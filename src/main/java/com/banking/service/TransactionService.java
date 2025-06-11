package com.banking.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.banking.model.Account;
import com.banking.model.Transaction;
import com.banking.utility.DBConnect;

public class TransactionService {
    
    private AccountService accountService = new AccountService();
    private PayeeService payeeService = new PayeeService();
    
    // Create a new transaction
    public boolean createTransaction(Transaction transaction) {
        try {
            Connection conn = DBConnect.getConnection();
            
            // First, check if the source account has sufficient balance
            Account fromAccount = accountService.getAccountById(transaction.getFromAccountId());
            if (fromAccount == null || fromAccount.getBalance() < transaction.getAmount().doubleValue()) {
                return false; // Insufficient balance
            }
            
            // Begin transaction
            conn.setAutoCommit(false);
            
            try {
                // 1. Insert transaction record
                String query = "INSERT INTO transactions (fromAccountId, toAccountNumber, amount, transactionType, " +
                              "transferMode, bankName, remarks, purpose, status, payeeId) " +
                              "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, transaction.getFromAccountId());
                ps.setString(2, transaction.getToAccountNumber());
                ps.setBigDecimal(3, transaction.getAmount());
                ps.setString(4, transaction.getTransactionType());
                ps.setString(5, transaction.getTransferMode());
                ps.setString(6, transaction.getBankName());
                ps.setString(7, transaction.getRemarks());
                ps.setString(8, transaction.getPurpose());
                ps.setString(9, transaction.getStatus());
                
                if (transaction.getPayeeId() != null) {
                    ps.setInt(10, transaction.getPayeeId());
                } else {
                    ps.setNull(10, java.sql.Types.INTEGER);
                }
                
                int rowsAffected = ps.executeUpdate();
                
                // 2. Update source account balance
                if (rowsAffected > 0) {
                    String updateQuery = "UPDATE accounts SET balance = balance - ? WHERE accountId = ?";
                    PreparedStatement updatePs = conn.prepareStatement(updateQuery);
                    updatePs.setBigDecimal(1, transaction.getAmount());
                    updatePs.setInt(2, transaction.getFromAccountId());
                    updatePs.executeUpdate();
                    
                    // 3. If it's an internal transfer (HelaBank), update destination account balance
                    if ("HelaBank".equals(transaction.getBankName())) {
                        String toAccountQuery = "SELECT accountId FROM accounts WHERE accountNumber = ?";
                        PreparedStatement toAccountPs = conn.prepareStatement(toAccountQuery);
                        toAccountPs.setString(1, transaction.getToAccountNumber());
                        ResultSet rs = toAccountPs.executeQuery();
                        
                        if (rs.next()) {
                            int toAccountId = rs.getInt("accountId");
                            String creditQuery = "UPDATE accounts SET balance = balance + ? WHERE accountId = ?";
                            PreparedStatement creditPs = conn.prepareStatement(creditQuery);
                            creditPs.setBigDecimal(1, transaction.getAmount());
                            creditPs.setInt(2, toAccountId);
                            creditPs.executeUpdate();
                        }
                    }
                    
                    // Commit transaction
                    conn.commit();
                    return true;
                }
            } catch (Exception e) {
                // Rollback in case of error
                conn.rollback();
                e.printStackTrace();
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    // Get recent transactions for an account
    public List<Transaction> getRecentTransactions(int accountId, int limit) {
        List<Transaction> transactions = new ArrayList<>();
        
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT * FROM transactions WHERE fromAccountId = ? " +
                          "ORDER BY transactionDate DESC LIMIT ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, accountId);
            ps.setInt(2, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transactionId"));
                transaction.setFromAccountId(rs.getInt("fromAccountId"));
                transaction.setToAccountNumber(rs.getString("toAccountNumber"));
                transaction.setAmount(rs.getBigDecimal("amount"));
                transaction.setTransactionType(rs.getString("transactionType"));
                transaction.setTransferMode(rs.getString("transferMode"));
                transaction.setBankName(rs.getString("bankName"));
                transaction.setRemarks(rs.getString("remarks"));
                transaction.setPurpose(rs.getString("purpose"));
                transaction.setStatus(rs.getString("status"));
                transaction.setTransactionDate(rs.getTimestamp("transactionDate"));
                
                // Handle payeeId which might be NULL
                int payeeId = rs.getInt("payeeId");
                if (!rs.wasNull()) {
                    transaction.setPayeeId(payeeId);
                }
                
                transactions.add(transaction);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return transactions;
    }
    
    // Get all transactions for a user
    public List<Transaction> getUserTransactions(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        
        try {
            Connection conn = DBConnect.getConnection();
            String query = "SELECT t.*, a.accountNumber as fromAccountNumber, a.accountName as fromAccountName FROM transactions t " +
                    "JOIN accounts a ON t.fromAccountId = a.accountId " +
                    "WHERE a.userId = ? " +
                    "ORDER BY t.transactionDate DESC";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transactionId"));
                transaction.setFromAccountId(rs.getInt("fromAccountId"));
                transaction.setFromAccountNumber(rs.getString("fromAccountNumber")); 
                transaction.setFromAccountName(rs.getString("fromAccountName"));

                transaction.setToAccountNumber(rs.getString("toAccountNumber"));
                transaction.setAmount(rs.getBigDecimal("amount"));
                transaction.setTransactionType(rs.getString("transactionType"));
                transaction.setTransferMode(rs.getString("transferMode"));
                transaction.setBankName(rs.getString("bankName"));
                transaction.setRemarks(rs.getString("remarks"));
                transaction.setPurpose(rs.getString("purpose"));
                transaction.setStatus(rs.getString("status"));
                transaction.setTransactionDate(rs.getTimestamp("transactionDate"));
                
                // Handle payeeId which might be NULL
                int payeeId = rs.getInt("payeeId");
                if (!rs.wasNull()) {
                    transaction.setPayeeId(payeeId);
                }
                
                transactions.add(transaction);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return transactions;
    }
    
    public List<Transaction> searchTransactions(int userId, String searchTerm) {
        List<Transaction> transactions = new ArrayList<>();
        
        try {
            // Pre-process the search term to handle TRN0 prefix
            String processedSearchTerm = searchTerm;
            if (searchTerm != null && searchTerm.toUpperCase().startsWith("TRN0")) {
                // Extract just the numeric part
                processedSearchTerm = searchTerm.substring(4);
            }
            
            Connection conn = DBConnect.getConnection();
            String query = "SELECT t.*, a.accountNumber as fromAccountNumber, a.accountName as fromAccountName FROM transactions t " +
                          "JOIN accounts a ON t.fromAccountId = a.accountId " +
                          "WHERE a.userId = ? AND " +
                          "(t.transactionId LIKE ? OR " +  
                          "t.toAccountNumber LIKE ? OR " +
                          "t.bankName LIKE ? OR " +
                          "t.status LIKE ? OR " +
                          "CAST(t.amount AS CHAR) LIKE ? OR " +
                          "a.accountNumber LIKE ? OR " +
                          "a.accountName LIKE ? OR " +
                          "t.remarks LIKE ? OR " +  
                          "t.purpose LIKE ?) " +    
                          "ORDER BY t.transactionDate DESC";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            
            // Use the processed search term for transaction ID
            ps.setString(2, "%" + processedSearchTerm + "%"); // transactionId
            
            // Use the original search term for all other fields
            String searchPattern = "%" + searchTerm + "%";
            ps.setString(3, searchPattern); // toAccountNumber
            ps.setString(4, searchPattern); // bankName
            ps.setString(5, searchPattern); // status
            ps.setString(6, searchPattern); // amount
            ps.setString(7, searchPattern); // accountNumber
            ps.setString(8, searchPattern); // accountName
            ps.setString(9, searchPattern); // remarks
            ps.setString(10, searchPattern); // purpose
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transactionId"));
                transaction.setFromAccountId(rs.getInt("fromAccountId"));
                transaction.setFromAccountNumber(rs.getString("fromAccountNumber")); 
                transaction.setFromAccountName(rs.getString("fromAccountName"));
                transaction.setToAccountNumber(rs.getString("toAccountNumber"));
                transaction.setAmount(rs.getBigDecimal("amount"));
                transaction.setTransactionType(rs.getString("transactionType"));
                transaction.setTransferMode(rs.getString("transferMode"));
                transaction.setBankName(rs.getString("bankName"));
                transaction.setRemarks(rs.getString("remarks"));
                transaction.setPurpose(rs.getString("purpose"));
                transaction.setStatus(rs.getString("status"));
                transaction.setTransactionDate(rs.getTimestamp("transactionDate"));
                
                // Handle payeeId which might be NULL
                int payeeId = rs.getInt("payeeId");
                if (!rs.wasNull()) {
                    transaction.setPayeeId(payeeId);
                }
                
                transactions.add(transaction);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return transactions;
    }
}
