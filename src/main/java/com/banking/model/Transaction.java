package com.banking.model;

import java.math.BigDecimal;
import java.util.Date;

public class Transaction {
    private int transactionId;
    private int fromAccountId;
    private String toAccountNumber;
    private String fromAccountNumber;
    private String fromAccountName;
    private BigDecimal amount;
    private String transactionType;
    private String transferMode;
    private String bankName;
    private String remarks;
    private String purpose;
    private String status;
    private Date transactionDate;
    private Integer payeeId;
    
    // Default constructor
    public Transaction() {}
    
    // Constructor with essential fields
    public Transaction(int fromAccountId, String toAccountNumber, BigDecimal amount, 
                      String transactionType, String transferMode, String bankName,
                      String remarks, String purpose, String status) {
        this.fromAccountId = fromAccountId;
        this.toAccountNumber = toAccountNumber;
        this.amount = amount;
        this.transactionType = transactionType;
        this.transferMode = transferMode;
        this.bankName = bankName;
        this.remarks = remarks;
        this.purpose = purpose;
        this.status = status;
    }
    
    // Getters and Setters
    public int getTransactionId() {
        return transactionId;
    }
    
    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }
    
    public int getFromAccountId() {
        return fromAccountId;
    }
    
    public void setFromAccountId(int fromAccountId) {
        this.fromAccountId = fromAccountId;
    }
    
    public String getToAccountNumber() {
        return toAccountNumber;
    }
    
    public void setToAccountNumber(String toAccountNumber) {
        this.toAccountNumber = toAccountNumber;
    }
    
    public String getFromAccountNumber() {
        return fromAccountNumber;
    }
    
    public void setFromAccountNumber(String fromAccountNumber) {
        this.fromAccountNumber = fromAccountNumber;
    }
    
    public String getFromAccountName() {
        return fromAccountName;
    }
    
    public void setFromAccountName(String fromAccountName) {
        this.fromAccountName = fromAccountName;
    }
    
    public BigDecimal getAmount() {
        return amount;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
    public String getTransactionType() {
        return transactionType;
    }
    
    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }
    
    public String getTransferMode() {
        return transferMode;
    }
    
    public void setTransferMode(String transferMode) {
        this.transferMode = transferMode;
    }
    
    public String getBankName() {
        return bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
    
    public String getRemarks() {
        return remarks;
    }
    
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    public String getPurpose() {
        return purpose;
    }
    
    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Date getTransactionDate() {
        return transactionDate;
    }
    
    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }
    
    public Integer getPayeeId() {
        return payeeId;
    }
    
    public void setPayeeId(Integer payeeId) {
        this.payeeId = payeeId;
    }
}
