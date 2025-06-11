<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.banking.model.Customer" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hela Bank Complaint System</title>
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
        
        /* Welcome page specific styles */
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
            margin-bottom: 20px;
            text-align: center;
        }
        
        p {
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 30px 0;
        }
        
        .btn {
            padding: 12px 24px;
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
        }
        
        .btn:hover {
            background-color: #1ea15d;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .contact-info {
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
        }
        
        .contact-info h2 {
            color: #333;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            text-align: center;
        }
        
        .contact-info p {
            color: #666;
            margin-bottom: 10px;
            text-align: left;
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
        
        <!-- Welcome page content -->
        <div class="container">
            <h1>Welcome to Hela Bank Complaint System</h1>
            <p>Your feedback is valuable to us. If our services do not rise up to your needs, just tell us.</p>
            
            <div class="actions">
                <a href="${pageContext.request.contextPath}/add-complaint" class="btn">Submit a Complaint</a>
                <a href="${pageContext.request.contextPath}/list-complaints" class="btn">View Complaints</a>
            </div>
            
            <div class="contact-info">
                <h2>How to Get in Touch With Us</h2>
                <p><strong>By Email:</strong> customer.care@helabank.com</p>
                <p><strong>By Phone:</strong> +94 11 2 555 555</p>
                <p><strong>By Post:</strong> Head of Customer Care Centre, Hela Bank PLC, Customer Care Center, No 123, Banking Square, Colombo 01, Sri Lanka.</p>
                <p><strong>Customer Care Center Hours:</strong> Weekdays 8.30 a.m. - 4.30 p.m.</p>
            </div>
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
            } else if (currentPath.includes('/contact') || currentPath.includes('/index.jsp')) {
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
