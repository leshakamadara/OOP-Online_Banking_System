<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.banking.model.Customer" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        out.println("<p style='color:red;'>Error: Customer data is missing.</p>");
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HelaBank - Profile</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
        
        /* Profile specific styles */
        .profile-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            margin-top: 80px;
        }
        
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .profile-header h2 {
            color: #333;
            font-size: 28px;
            font-weight: 600;
        }
        
        .profile-box {
            margin-bottom: 30px;
        }
        
        .profile-box p {
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
            display: flex;
            justify-content: space-between;
        }
        
        .profile-box p strong {
            color: #666;
        }
        
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .update-btn, .delete-btn {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            font-size: 14px;
        }
        
        .update-btn {
            background-color: #25c16f;
            color: white;
        }
        
        .update-btn:hover {
            background-color: #1ea15d;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .delete-btn {
            background-color: #f44336;
            color: white;
        }
        
        .delete-btn:hover {
            background-color: #e53935;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
        
        <!-- Profile content -->
        <div class="profile-container">
            <div class="profile-header">
                <h2>Your Profile</h2>
            </div>
            
            <div class="profile-box">
                <p><strong>User Name:</strong> <%= customer.getUsername() %></p>
                <p><strong>Full Name:</strong> <%= customer.getFullname() %></p>
                <p><strong>Email:</strong> <%= customer.getEmail() %></p>
                <p><strong>Contact:</strong> <%= customer.getContact() %></p>
                <p><strong>Branch:</strong> <%= customer.getBranch() %></p>
                <p><strong>NIC:</strong> <%= customer.getNic() %></p>
            </div>
            
            <div class="button-group">
                <button class="update-btn" id="updateProfileBtn">Update Profile</button>
                <button class="delete-btn" id="deleteProfileBtn">Delete Profile</button>
            </div>
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

        // Update Profile button
        document.getElementById('updateProfileBtn').addEventListener('click', function() {
            // Create a form dynamically
            const form = document.createElement('form');
            form.method = 'post';
            form.action = 'Update.jsp';
            
            // Add hidden fields
            const fields = [
                { name: 'username', value: '<%= customer.getUsername() %>' },
                { name: 'fullname', value: '<%= customer.getFullname() %>' },
                { name: 'email', value: '<%= customer.getEmail() %>' },
                { name: 'contact', value: '<%= customer.getContact() %>' }
            ];
            
            fields.forEach(field => {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = field.name;
                input.value = field.value;
                form.appendChild(input);
            });
            
            // Append form to body and submit
            document.body.appendChild(form);
            form.submit();
        });
        
        document.getElementById('deleteProfileBtn').addEventListener('click', function() {
            if (confirm('Are you sure you want to delete your profile? This action cannot be undone.')) {
                const form = document.createElement('form');
                form.method = 'post';
                form.action = '<%=request.getContextPath()%>/DeleteAccount';
                
                const usernameInput = document.createElement('input');
                usernameInput.type = 'hidden';
                usernameInput.name = 'userId';
                usernameInput.value = '<%= customer.getUserId() %>';
                form.appendChild(usernameInput);
                
                document.body.appendChild(form);
                form.submit();
            }
        });

    </script>
</body>
</html>
