package com.banking.model;

import java.util.Date;

public class Account {
    private int accountId;
    private String accountNumber;
    private String accountName;
    private String accountType;
    private double balance;
    private int userId;
    private boolean isPrimary;
    private boolean active;
    private Date openDate;
    private Date lastUpdated;
    
    // Default constructor
    public Account() {}
    
    // Constructor with fields
    public Account(int accountId, String accountNumber, String accountName, String accountType, 
                  double balance, int userId, boolean isPrimary, boolean active) {
        this.accountId = accountId;
        this.accountNumber = accountNumber;
        this.accountName = accountName;
        this.accountType = accountType;
        this.balance = balance;
        this.userId = userId;
        this.isPrimary = isPrimary;
        this.active = active;
    }
    
    // Getters and Setters
    public int getAccountId() {
        return accountId;
    }
    
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
    
    public String getAccountNumber() {
        return accountNumber;
    }
    
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    
    public String getAccountName() {
        return accountName;
    }
    
    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
    
    public String getAccountType() {
        return accountType;
    }
    
    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }
    
    public double getBalance() {
        return balance;
    }
    
    public void setBalance(double balance) {
        this.balance = balance;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public boolean isPrimary() {
        return isPrimary;
    }
    
    public void setPrimary(boolean isPrimary) {
        this.isPrimary = isPrimary;
    }
    
    public boolean isActive() {
        return active;
    }
    
    public void setActive(boolean active) {
        this.active = active;
    }
    
    public Date getOpenDate() {
        return openDate;
    }
    
    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }
    
    public Date getLastUpdated() {
        return lastUpdated;
    }
    
    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}
