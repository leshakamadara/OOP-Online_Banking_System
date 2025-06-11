<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.banking.model.Customer" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    
    String message = (String) session.getAttribute("message");
    String error = (String) session.getAttribute("error");
    if (message != null) {
        session.removeAttribute("message");
    }
    if (error != null) {
        session.removeAttribute("error");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hela Bank - Complaint List</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
        
        /* Complaint List specific styles */
        .container {
            width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        
        h1 {
            color: #333;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            text-align: center;
        }
        
        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .success, .alert-success {
            background-color: #e8f5e9;
            color: #2e7d32;
            border-left: 4px solid #2e7d32;
        }
        
        .error, .alert-danger {
            background-color: #ffebee;
            color: #c62828;
            border-left: 4px solid #c62828;
        }
        
        .button-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        
        .btn {
            padding: 8px 16px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            font-size: 14px;
            background-color: #25c16f;
            color: white;
            display: inline-block;
            text-decoration: none;
            margin-right: 10px;
        }
        
        .btn:hover {
            background-color: #1ea15d;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .btn.danger {
            background-color: #f44336;
        }
        
        .btn.danger:hover {
            background-color: #e53935;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            overflow: hidden;
        }
        
        thead {
            background-color: #f5f5f5;
        }
        
        th, td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            font-weight: 600;
            color: #666;
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        tr:hover {
            background-color: #f9f9f9;
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
            <a href="${pageContext.request.contextPath}/index.jsp" class="menu-item active" id="navop7">
                <div class="icon">
                    <span class="material-icons">contact_support</span>
                </div>
                <span>Contact Us</span>
            </a>
        </div>
        
        <div class="menu" id="settings" style="margin-top: auto;">
            <a href="${pageContext.request.contextPath}/Profile.jsp" class="menu-item" id="profile">
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
                <div class="user-photo">
                    <img style="height: 44px;" src="images/usrlogo.jpg" alt="User Photo">
                </div>
                <div class="user-name">${customer.fullname}</div>
                <span class="material-icons" id="user-profile-dropdown">arrow_drop_down</span>
            </div>
            <div class="user-logout" id="logoutTop">
                <span class="material-icons">logout</span>
            </div>
        </div>
        
        <!-- Complaint List content -->
        <div class="container">
            <h1>Complaint List</h1>
            
            <% if (message != null) { %>
                <div class="alert alert-success"><%= message %></div>
            <% } %>
            <% if (error != null) { %>
                <div class="alert alert-danger"><%= error %></div>
            <% } %>
            
            <c:if test="${not empty message}">
                <div class="alert success">${message}</div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert error">${error}</div>
            </c:if>
            
            <div class="button-bar">
                <a href="${pageContext.request.contextPath}/add-complaint" class="btn">Add New Complaint</a>
                <a href="${pageContext.request.contextPath}/dashboard" class="btn">Back to Dashboard</a>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Submission Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="complaint" items="${complaints}">
                        <tr>
                            <td>${complaint.id}</td>
                            <td>${complaint.firstName} ${complaint.surname}</td>
                            <td>${complaint.email}</td>
                            <td>${complaint.submissionDate}</td>
                            <td>${complaint.status}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view-complaint?id=${complaint.id}" class="btn">View</a>
                                <a href="${pageContext.request.contextPath}/update-complaint?id=${complaint.id}" class="btn">Update</a>
                                <form action="${pageContext.request.contextPath}/delete-complaint" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${complaint.id}">
                                    <button type="submit" class="btn danger" onclick="return confirm('Are you sure you want to delete this complaint?')">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <script>
        // Function to set active menu item based on current URL
        function setActiveMenuItem() {
            // Get the current URL path
            const currentPath = window.location.pathname;
            
            // Remove 'active' class from all menu items
            document.querySelectorAll('.menu-item').forEach(item => {
                item.classList.remove('active');
            });
            
            // Set active class based on current path
            if (currentPath.includes('/dashboard')) {
                document.getElementById('navop1').classList.add('active');
            } else if (currentPath.includes('/transfer')) {
                document.getElementById('navop2').classList.add('active');
            } else if (currentPath.includes('/account')) {
                document.getElementById('navop3').classList.add('active');
            } else if (currentPath.includes('/transaction')) {
                document.getElementById('navop4').classList.add('active');
            } else if (currentPath.includes('/payees')) {
                document.getElementById('navop5').classList.add('active');
            } else if (currentPath.includes('/readservlet')) {
                document.getElementById('navop6').classList.add('active');
            } else if (currentPath.includes('/contact') || currentPath.includes('/list-complaints')) {
                document.getElementById('navop7').classList.add('active');
            } else if (currentPath.includes('/Profile.jsp')) {
                document.getElementById('profile').classList.add('active');
            }
        }
        
        // Add click event listeners to menu items
        document.querySelectorAll('.menu-item').forEach(item => {
            item.addEventListener('click', function() {
                // Remove active class from all menu items
                document.querySelectorAll('.menu-item').forEach(menuItem => {
                    menuItem.classList.remove('active');
                });
                
                // Add active class to clicked item
                this.classList.add('active');
            });
        });
        
        // Logout functionality
        document.getElementById('logout').addEventListener('click', function() {
            window.location.href='${pageContext.request.contextPath}/Logout';
        });

        document.getElementById('logoutTop').addEventListener('click', function() {
            window.location.href='${pageContext.request.contextPath}/Logout';
        });
        
        // Set active menu item when page loads
        document.addEventListener('DOMContentLoaded', setActiveMenuItem);
    </script>
</body>
</html>
