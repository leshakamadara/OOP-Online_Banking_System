<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HelaBank - Transfer to Payee</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon-16x16.png">

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

        .user-logout{
            cursor: pointer;
        }

        /* Dashboard Content */
        .dashboard-content {
            padding: 24px;
            background-color: #f5f5f5;
            border-radius: 16px;
        }

        /* Transfer Page Specific Styles */
        .transfer-title {
            color: #333;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 16px;
        }

        .transfer-tabs {
            display: flex;
            margin-bottom: 24px;
            border-bottom: 1px solid #e0e0e0;
        }

        .transfer-tab {
            padding: 12px 0;
            margin-right: 30px;
            font-size: 16px;
            color: #666;
            cursor: pointer;
            position: relative;
        }

        .transfer-tab.active {
            color: #25c16f;
            font-weight: 500;
        }

        .transfer-tab.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 3px;
            background-color: #25c16f;
            border-radius: 3px 3px 0 0;
        }

        .transfer-layout {
            display: grid;  
            grid-template-columns: 3fr 2fr;
            gap: 24px;
        }

        .transfer-form {
            background: white;
            border-radius: 16px;
            padding: 24px;
        }

        .transfer-banner {
            background: white;
            border-radius: 16px;
            padding: 24px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .transfer-banner h3 {
            margin-bottom: 16px;
            font-weight: 600;
        }

        .form-section {
            margin-bottom: 20px;
        }

        .form-section-title {
            font-weight: 500;
            margin-bottom: 12px;
            color: #333;
        }

        .radio-group {
            display: flex;
            gap: 30px;
            margin-bottom: 20px;
        }

        .radio-option {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .radio-circle {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            border: 2px solid #e0e0e0;
            margin-right: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .radio-circle.selected {
            border-color: #25c16f;
        }

        .radio-circle.selected::after {
            content: '';
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: #25c16f;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border 0.2s;
        }

        .form-control:focus {
            border-color: #25c16f;
            outline: none;
        }

        .select-wrapper {
            position: relative;
        }

        .select-wrapper::after {
            content: 'arrow_drop_down';
            font-family: 'Material Icons';
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
            color: #9e9e9e;
        }

        .send-button {
            background: linear-gradient(170deg, #25c16f, #1ea35f);
            color: white;
            border: none;
            border-radius: 24px;
            padding: 12px 24px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            margin-left: auto;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .send-button:hover {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .send-button:active {
            transform: scale(0.98);
        }

        .banner-image {
            width: 150px;
            height: 150px;
            background-color: #f0f7f4;
            border-radius: 12px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .banner-image .material-icons {
            font-size: 48px;
            color: #25c16f;
        }

        .add-payee-button {
        background-color: transparent;
        color: #25c16f;
        border: 1px solid #25c16f;
        border-radius: 24px;
        padding: 10px 20px;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 8px;
        cursor: pointer;
        margin-top: 24px;
        transition: all 0.2s ease;
    }

    .add-payee-button:hover {
        background-color: rgba(37, 193, 111, 0.1);
    }

    .add-payee-button .material-icons {
        font-size: 18px;
    }

    .payee-action {
        margin-top: 8px;
    }

    /* Schedule section - hidden by default */
    .schedule-section {
        display: none;
        margin-top: 16px;
        padding-top: 16px;
        border-top: 1px solid #e0e0e0;
    }
    
    .schedule-section.active {
        display: block;
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
            <a href="${pageContext.request.contextPath}/dashboard" class="menu-item active" id="navop1">
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
            <a href="${pageContext.request.contextPath}/payees" class="menu-item" id=navop5>
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
        
        <!-- Main content area -->
        <div class="dashboard-content">
            <h1 class="transfer-title">Transfer</h1>
            
            <div class="transfer-tabs">
                <div class="transfer-tab active">Make Transfers</div>
                <div class="transfer-tab">My Payees</div>
            </div>
            
            <div class="transfer-layout">
                <!-- Transfer Form -->
                <div class="transfer-form">
                    <form action="${pageContext.request.contextPath}/transfer" method="post">
                        <input type="hidden" name="action" value="transfer">
                        <input type="hidden" name="transferType" value="payee">
                        
                        <div class="form-section">
                            <div class="form-section-title">Transfer Type</div>
                            <div class="radio-group">
                                <div class="radio-option" id="quickTransfer">
                                    <div class="radio-circle"><div class="radio-dot"></div></div>
                                    <span>Quick Transfer</span>
                                </div>
                                <div class="radio-option" id="myPayee">
                                    <div class="radio-circle selected"><div class="radio-dot"></div></div>
                                    <span>My Payee</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>From Account</label>
                            <div class="select-wrapper">
                                <select class="form-control" name="fromAccount" required>
                                    <option value="">Please Select</option>
                                    <c:forEach items="${accounts}" var="account">
                                        <option value="${account.accountId}">
                                            ${account.accountNumber} - <fmt:formatNumber value="${account.balance}" pattern="#,##0.00"/> LKR
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>Payee Name</label>
                            <div class="select-wrapper">
                                <select class="form-control" id="payee-select" name="payeeId" required>
                                    <option value="">Please Select</option>
                                    <c:forEach items="${payees}" var="payee">
                                        <option value="${payee.payeeId}">
                                            ${payee.name} - ${payee.accountNumber} (${payee.bankName})
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-section">
                            <div class="form-section-title">Transfer Mode</div>
                            <div class="radio-group">
                                <div class="radio-option">
                                    <div class="radio-circle selected"><div class="radio-dot"></div></div>
                                    <span>Online</span>
                                    <input type="radio" name="transferMode" value="online" checked style="display:none;">
                                </div>
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label>Amount</label>
                            <input type="number" class="form-control" name="amount" placeholder="Enter Amount" min="1" step="0.01" required>
                        </div>
                        
                        <div class="form-group">
                            <label>Remarks</label>
                            <input type="text" class="form-control" name="remarks" placeholder="Enter remarks (optional)">
                        </div>
                        
                        <div class="form-group">
                            <label>Purpose of Transfer</label>
                            <div class="select-wrapper">
                                <select class="form-control" name="purpose" required>
                                    <option value="">Please Select</option>
                                    <option value="Utility Payment">Utility Payment</option>
                                    <option value="Education Fee">Education Fee</option>
                                    <option value="Personal Transfer">Personal Transfer</option>
                                    <option value="Business Payment">Business Payment</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <button type="submit" class="send-button">
                            Send
                            <span class="material-icons">send</span>
                        </button>
                    </form>
                </div>
                
                <!-- Banner Section -->
                <div class="transfer-banner">
                    <div class="banner-image">
                        <span class="material-icons">people</span>
                    </div>
                    <h3>My Payees</h3>
                    <p>Transfer money quickly to your saved payees without entering their details each time. For new payees, add them through the "My Payees" tab.</p>
                    <div class="payee-action">
                        <button class="add-payee-button" id="addPayeeButton">
                            <span class="material-icons">person_add</span>
                            Add New Payee
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    
    document.addEventListener('DOMContentLoaded', function() {
        // Radio button functionality
        document.querySelectorAll('.radio-option').forEach(option => {
            option.addEventListener('click', function() {
                // Find parent group
                const group = this.closest('.radio-group');
                
                // Remove selected class from all options in this group
                group.querySelectorAll('.radio-circle').forEach(circle => {
                    circle.classList.remove('selected');
                });
                
                // Add selected class to clicked option
                this.querySelector('.radio-circle').classList.add('selected');
                
                // Handle transfer type selection
                if (this.id === 'quickTransfer') {
                    window.location.href = '${pageContext.request.contextPath}/transfer';
                } else if (this.id === 'myPayee') {
                    window.location.href = '${pageContext.request.contextPath}/transfer/payee';
                }
            });
        });
        
        // Tab navigation
        document.querySelectorAll('.transfer-tab').forEach((tab, index) => {
            tab.addEventListener('click', function() {
                // Remove active class from all tabs
                document.querySelectorAll('.transfer-tab').forEach(t => {
                    t.classList.remove('active');
                });
                
                // Add active class to clicked tab
                this.classList.add('active');
                
                // If "My Payees" tab is clicked
                if (this.textContent.trim() === "My Payees") {
                    window.location.href = '${pageContext.request.contextPath}/payees';
                } else if (this.textContent.trim() === "Make Transfers") {
                    window.location.href = '${pageContext.request.contextPath}/transfer';
                }
            });
        });
        
        // Add payee button
        if (document.getElementById('addPayeeButton')) {
            document.getElementById('addPayeeButton').addEventListener('click', function() {
                window.location.href = '${pageContext.request.contextPath}/payees/add';
            });
        }
        
        // Form validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const fromAccount = document.querySelector('select[name="fromAccount"]').value;
            const payeeId = document.querySelector('select[name="payeeId"]').value;
            const amount = document.querySelector('input[name="amount"]').value;
            const purpose = document.querySelector('select[name="purpose"]').value;
            
            // Check if from account is selected
            if (!fromAccount) {
                e.preventDefault();
                alert('Please select an account to transfer from');
                return;
            }
            
            // Check if payee is selected
            if (!payeeId) {
                e.preventDefault();
                alert('Please select a payee');
                return;
            }
            
            // Check if amount is valid
            if (!amount || parseFloat(amount) <= 0) {
                e.preventDefault();
                alert('Please enter a valid amount');
                return;
            }
            
            // Check if purpose is selected
            if (!purpose) {
                e.preventDefault();
                alert('Please select a purpose for the transfer');
                return;
            }
        });
        
        // User profile dropdown functionality
        if (document.getElementById('user-profile-dropdown')) {
            document.getElementById('user-profile-dropdown').addEventListener('click', function() {
                // Add your dropdown menu functionality here
                console.log('Profile dropdown clicked');
            });
        }
        
        // Logout functionality
        if (document.getElementById('logoutTop')) {
            document.getElementById('logoutTop').addEventListener('click', function() {
                window.location.href = '${pageContext.request.contextPath}/Logout';
            });
        }
    });
    </script>
</body>
</html>