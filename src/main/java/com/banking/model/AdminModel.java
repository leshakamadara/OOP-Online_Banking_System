package com.banking.model;

public class AdminModel {
	private int id;
    private String username;
    private String password;
    private String fname;
    private String lname;
    private String email;
    private String phone;
    private String dpPath;
    private String adminRole;
    private String department;
    private String lastLogin;
    private String createdAt;
    
    public AdminModel(int id, String username, String password, String fname, String lname, 
                          String email, String phone, String dpPath, String adminRole, 
                          String department, String lastLogin, String createdAt) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.phone = phone;
        this.dpPath = dpPath;
        this.adminRole = adminRole;
        this.department = department;
        this.lastLogin = lastLogin;
        this.createdAt = createdAt;
    }
    
    // Constructor for login (just essential fields)
    public AdminModel(int id, String username, String fname, String lname, 
                          String email, String adminRole, String department) {
        this.id = id;
        this.username = username;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.adminRole = adminRole;
        this.department = department;
    }
    
    // Getters and setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getFname() {
        return fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    public String getLname() {
        return lname;
    }
    
    public void setLname(String lname) {
        this.lname = lname;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getDpPath() {
        return dpPath;
    }
    
    public void setDpPath(String dpPath) {
        this.dpPath = dpPath;
    }
    
    public String getAdminRole() {
        return adminRole;
    }
    
    public void setAdminRole(String adminRole) {
        this.adminRole = adminRole;
    }
    
    public String getDepartment() {
        return department;
    }
    
    public void setDepartment(String department) {
        this.department = department;
    }
    
    public String getLastLogin() {
        return lastLogin;
    }
    
    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }
    
    public String getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}