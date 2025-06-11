<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.banking.model.Customer" %>
<%
    response.setDateHeader("Expires", 0);
    
    // Get the customer object from session
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    
    String username = customer.getUsername();
    String fullname = customer.getFullname();
    String email = customer.getEmail();
    String contact = customer.getContact();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HelaBank - Update Profile</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <script src="js/sidenav.js"></script>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            display: flex;
            background-color: #f5f5f5;
        }
        
        .sidenav {
            z-index: 10;
            height: 100vh;
            width: 240px;
            position: fixed;
            background-color: white;
            border-radius: 0 24px 24px 0;
            padding: 20px 0;
            display: flex;
            flex-direction: column;
        }
        
        .logo {
            display: flex;
            align-items: center;
            padding: 0 0 50px;
        }
        
        .logo img {
            height: 48px;
        }
        
        .menu-label {
            color: #9e9e9e;
            font-size: 12px;
            padding: 0 24px 10px;
            font-weight: 500;
        }
        
        .menu {
            display: flex;
            flex-direction: column;
            gap: 8px;
            padding: 0 12px;
        }

        .icon {
            transition: transform 0.2s ease, background-color 0.2s ease;
        }

        .icon:hover {
            cursor: pointer;
            transform: scale(1.1);
            background-color: #e8f8f0;
        }
        
        .menu-item {
            padding: 12px;
            display: flex;
            align-items: center;
            color: #9e9e9e;
            text-decoration: none;
            border-radius: 12px;
            transition: all 0.2s;
        }
        
        .menu-item .icon {
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            border-radius: 8px;
            font-size: 18px;
        }
        
        .menu-item.active {
            color: #25c16f;
            background-color: #f0f7f4;
        }
        
        .menu-item.active .icon {
            color: #25c16f;
        }
        
        .menu-item:hover:not(.active) {
            background-color: #f5f5f5;
        }
        
        .menu-footer {
            margin-top: auto;
            font-size: 12px;
            color: #9e9e9e;
            padding: 16px 24px;
        }
        
        .main-content {
            margin-left: 240px;
            width: calc(100% - 240px);
            padding: 90px 20px 20px;
        }
        
        .topnav {
            height: 80px;
            background-color: white;
            border-radius: 0;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding: 0 24px;
            margin: 0;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 5;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            padding-right: 20px;
        }
        
        .user-photo {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f0f0f0;
            margin-right: 12px;
            overflow: hidden;
            cursor: pointer;
        }
        
        .user-name {
            font-weight: 500;
            margin-right: 8px;
        }

        .user-logout {
            cursor: pointer;
        }

        .user-logout:hover {
            color: #25c16f;
        }
        
        /* Update form specific styles */
        .update-container {
            max-width: 500px;
            margin: 0 auto;
            background-color: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            margin-top: 60px;
        }
        
        .update-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .update-header h2 {
            color: #333;
            font-size: 28px;
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-weight: 500;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border 0.2s;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #25c16f;
        }
        
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .save-btn, .cancel-btn {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            font-size: 14px;
        }
        
        .save-btn {
            background-color: #25c16f;
            color: white;
        }
        
        .save-btn:hover {
            background-color: #1ea15d;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .cancel-btn {
            background-color: #f5f5f5;
            color: #666;
        }
        
        .cancel-btn:hover {
            background-color: #e0e0e0;
        }
        
        .alert {
    padding: 12px;
    margin-bottom: 20px;
    border-radius: 8px;
    font-size: 14px;
}

.alert-error {
    background-color: #ffebee;
    color: #c62828;
    border: 1px solid #ef9a9a;
}

.alert-success {
    background-color: #e8f5e9;
    color: #2e7d32;
    border: 1px solid #a5d6a7;
}
    </style>
</head>
<body>
    <div class="sidenav">
        <a style="text-decoration: none;" href="#" class="logo-link">
            <div class="logo">
                <img src="./images/unnamed.png" alt="HelaBank"> 
                <h2 style="color: black;">HelaBank</h2>
            </div>
        </a>
        
        <div class="menu-label">MENU</div>
        
        <div class="menu">
            <a href="${pageContext.request.contextPath}/dashboard" class="menu-item" id="navop1">
                <div class="icon">
                    <span class="material-icons">apps</span>
                </div>
                <span>Home</span>
            </a>
            <a href="${pageContext.request.contextPath}/transfer" class="menu-item" id="navop2">
                <div class="icon">
                    <span class="material-icons">swap_horiz</span>
                </div>
                <span>Transfer</span>
            </a>
            <a href="${pageContext.request.contextPath}/account" class="menu-item" id="navop3">
                <div class="icon">
                    <span class="material-icons">credit_card</span>
                </div>
                <span>Accounts</span>
            </a>
            <a href="${pageContext.request.contextPath}/transaction" class="menu-item" id="navop4">
                <div class="icon">
                    <span class="material-icons">receipt_long</span>
                </div>
                <span>Transactions</span>
            </a>
            <a href="${pageContext.request.contextPath}/payees" class="menu-item" id="navop5">
                <div class="icon">
                    <span class="material-icons">payments</span>
                </div>
                <span>Payees</span>
            </a>
            <a href="${pageContext.request.contextPath}/readservlet?Loan_Status=${customer.username}" class="menu-item" id="navop6">
                <div class="icon">
                    <span class="material-icons">account_balance</span>
                </div>
                <span>Loans</span>
            </a>
            <a href="${pageContext.request.contextPath}/index.jsp" class="menu-item" id="navop7">
                <div class="icon">
                    <span class="material-icons">contact_support</span>
                </div>
                <span>Contact Us</span>
            </a>
        </div>
        
        <div class="menu" id="settings" style="margin-top: auto;">
            <a href="${pageContext.request.contextPath}/Profile.jsp" class="menu-item active" id="profile">
                <div class="icon">
                    <span class="material-icons">person</span>
                </div>
                <span>Profile</span>
            </a>
            <a href="${pageContext.request.contextPath}/Logout" class="menu-item" id="logout">
                <div class="icon">
                    <span class="material-icons">logout</span>
                </div>
                <span>Logout</span>
            </a>
        </div>
        
        <div class="menu-footer">
            
        </div>
    </div>
    
   <div class="main-content">
        <div class="topnav">
        <% if (session.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-error">
        <%= session.getAttribute("errorMessage") %>
        <% session.removeAttribute("errorMessage"); %>
    </div>
<% } %>

<% if (session.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success">
        <%= session.getAttribute("successMessage") %>
        <% session.removeAttribute("successMessage"); %>
    </div>
<% } %>
            <div class="user-profile">
                <div class="user-photo" >
                    <img style="height: 44px;" src="images/usrlogo.jpg" alt="User Photo">
                </div>
                <div class="user-name">${customer.fullname}</div>
                <span class="material-icons" id="user-profile-dropdown">arrow_drop_down</span>
            </div>
            <div class="user-logout" id="logoutTop">
                <span class="material-icons">logout</span>
            </div>
        </div>
        
        <!-- Update form content -->
        <div class="update-container">
            <div class="update-header">
                <h2>Update Profile</h2>
            </div>
            
            <form method="post" action="UpdateCustomerServlet">
                <input type="hidden" name="userId" value="${customer.userId}">
                <input type="hidden" name="username" value="${customer.username}">
                
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" value="${customer.fullname}" required>
                </div>
                
                <div class="form-group">
                    <label for="contact">Contact</label>
                    <input type="text" id="contact" name="contact" value="${customer.contact}" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${customer.email}" required>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="save-btn">Save Changes</button>
                    <button type="button" class="cancel-btn" onclick="window.location.href='Profile.jsp'">Cancel</button>
                </div>
            </form>
        </div>
        
        <!-- Password Change Container -->
<div class="update-container" style="margin-top: 30px;">
    <div class="update-header">
        <h2>Change Password</h2>
    </div>
    
    <form method="post" action="ChangePasswordServlet">
        <input type="hidden" name="userId" value="${customer.userId}">
        <input type="hidden" name="username" value="${customer.username}">
        
        <div class="form-group">
            <label for="currentPassword">Current Password</label>
            <input type="password" id="currentPassword" name="currentPassword" placeholder="*******" required>
        </div>
        
        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword"  placeholder="New Password" required>
        </div>
        
        <div class="form-group">
            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re Enter New Password" required>
        </div>
        
        <div class="button-group">
            <button type="submit" class="save-btn">Change Password</button>
            <button type="reset" class="cancel-btn">Clear</button>
        </div>
    </form>
</div>
        
    </div>
    
    <script>
        // Quick Actions redirection
        document.querySelectorAll('.icon').forEach(function(item) {
            item.addEventListener('click', function() {
                // Handle icon clicks if needed
            });
        });

        // Logout functionality
        document.getElementById('logout').addEventListener('click', function() {
            window.location.href='${pageContext.request.contextPath}/Logout';
        });

        document.getElementById('logoutTop').addEventListener('click', function() {
            window.location.href='${pageContext.request.contextPath}/Logout';
        });

        // Script for active theme buttons in side nav
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => {
            item.addEventListener('click', function(e) {
                menuItems.forEach(menuItem => {
                    menuItem.classList.remove('active');
                });
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>
