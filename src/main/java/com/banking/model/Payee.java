package com.banking.model;

import java.util.Date;

public class Payee {
    private int payeeId;
    private int userId;
    private String name;
    private String accountNumber;
    private String nickname;
    private String bankName;
    private String branch;
    private String payeeType;
    private Date dateAdded;
    private Date lastUpdated;
    
    // Default constructor
    public Payee() {}
    
    // Constructor with essential fields
    public Payee(int userId, String name, String accountNumber, String nickname, 
                String bankName, String branch, String payeeType) {
        this.userId = userId;
        this.name = name;
        this.accountNumber = accountNumber;
        this.nickname = nickname;
        this.bankName = bankName;
        this.branch = branch;
        this.payeeType = payeeType;
    }
    
    // Getters and Setters
    public int getPayeeId() {
        return payeeId;
    }
    
    public void setPayeeId(int payeeId) {
        this.payeeId = payeeId;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getAccountNumber() {
        return accountNumber;
    }
    
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    
    public String getNickname() {
        return nickname;
    }
    
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    
    public String getBankName() {
        return bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
    
    public String getBranch() {
        return branch;
    }
    
    public void setBranch(String branch) {
        this.branch = branch;
    }
    
    public String getPayeeType() {
        return payeeType;
    }
    
    public void setPayeeType(String payeeType) {
        this.payeeType = payeeType;
    }
    
    public Date getDateAdded() {
        return dateAdded;
    }
    
    public void setDateAdded(Date dateAdded) {
        this.dateAdded = dateAdded;
    }
    
    public Date getLastUpdated() {
        return lastUpdated;
    }
    
    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}