<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HelaBank - Add New Payee</title>
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
    padding: 90px 20px 20px; /* Add top padding to account for navbar height */
}
        
        .topnav {
    height: 80px;
    background-color: white;
    border-radius: 0; /* Remove border radius */
    display: flex;
    align-items: center;
    justify-content: flex-end;
    padding: 0 24px;
    margin: 0; /* Remove margin */
    width: 100%; /* Full width */
    position: fixed; /* Fix position */
    top: 0; /* Align to top */
    left: 0; /* Align to left */
    right: 0; /* Extend to right */
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

         /*MAIN CONTENT*/
        /* Main content styling */


/* Dashboard grid layout */
.dashboard-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-bottom: 24px;
}

/* Card styling */
.card {
    background: white;
    border-radius: 16px;
    padding: 20px;
}

/* Account summary card */
.account-summary {
    display: flex;
    flex-direction: column;
    justify-content:unset;
    gap: 16px;
    height: 100%; /* Ensures the card takes full height */
}

.card account-summary{
    display: flex;
    
}

.account-number {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
    font-weight:normal;
    font-size: 24px;
}

.status-badge {
    background-color: #25c16f;
    color: white;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 12px;
}

.account-type {
    color: #666;
    margin-bottom: 16px;
    font-size: 18px;
}

.balance-section {
    margin-bottom: 20px;
}

.balance-label {
    color: #666;
    font-size: 14px;
}

.balance-amount {
    font-size: 56px;
    font-weight: 600;
    color: #333;
    margin: 4px 0;
}

.available-text {
    color: #999;
    font-size: 12px;
}

.recent-transactions {
    margin-top: 30px;
}



.transaction-list {
    display: flex;
    justify-content: space-between;
    gap: 16px; /* Adds spacing between transactions */
}

.transaction {
    font-weight: 400;
    flex: 1; /* Makes each transaction take equal space */
    text-align: center; /* Centers the text horizontally */
}

.transaction.debit {
    color: #f44336;
}

.transaction.credit {
    color: #25c16f;
}

/* Quick Transfer section */
.quick-transfer h3 {
    margin-bottom: 16px;
    font-weight: 500;
}

.transfer-form {
    display: flex;
    flex-direction: column;
    gap: 16px;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.form-group label {
    color: #666;
    font-size: 14px;
}

.form-group select,
.form-group input {
    padding: 12px;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
}

.transfer-button {
    background: linear-gradient(170deg, #25c16f, #ffeb3b);
    color: #e8f8f0;
    border: none;
    border-radius: 8px;
    padding: 12px;
    width: 200px;
    margin-left: auto;
    cursor: pointer;
    font-weight: 500;
    margin-top: 8px;
    transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.transfer-button:hover {
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.transfer-button:active {
    transform: scale(0.98);
}



/* Quick Actions section */
.quick-actions {
    margin-bottom: 24px;
}

.quick-actions h3 {
    margin-bottom: 16px;
    font-weight: 500;
}

.action-buttons {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 16px;
    background: white;
    padding: 24px;
    border-radius: 16px;
    
}

.action-button {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
}

.action-button .icon {
    width: 48px;
    height: 48px;
    background: #f0f0f0;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.action-button .labelquickActions {
    color: #1d1c1c;
    font-weight:300;
}



/* Special Notice section */
.special-notice {
    height: 320px;
    background-color: #25c16f;
    border-radius: 16px;
    padding: 24px;
    margin-top: 30px; 
    display: flex;
    align-items: center;
    gap: 24px;
    color: white;
}

.mockup-image {
    flex: 0 0 auto;
    margin-right: 24px;
}

.mockup-image img {
    max-height: 250px;
    border-radius: 12px;
}

.notice-icon {
    width: 48px;
    height: 48px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
}

.notice-content h3 {
    margin-bottom: 12px;
    font-weight: 500;
}

.special-notice h2 {
    font-size: 28px;
    margin-bottom: 16px;
    font-weight: 600;
}

.special-notice p {
    margin-bottom: 20px;
    line-height: 1.5;
}

.app-buttons {
    display: flex;
    gap: 12px;
}

.app-button {
    background: rgba(255, 255, 255, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.4);
    color: white;
    border-radius: 20px;
    padding: 8px 16px;
    cursor: pointer;
}

/* Dashboard content styling */
.dashboard-content {
    padding: 24px;
    background-color: #f5f5f5;
    border-radius: 16px;
}

.welcome-text {
    color: #333;
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 24px;
}

/* Tabs styling */
.tabs-container {
    display: flex;
    margin-bottom: 24px;
    border-bottom: 2px solid #e0e0e0;
}

.tab-link {
    padding: 12px 20px;
    color: #666;
    text-decoration: none;
    font-weight: 500;
    position: relative;
    transition: color 0.3s;
}

.tab-link.active {
    color: #25c16f;
}

.tab-link.active::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: #25c16f;
}

.tab-link:hover:not(.active) {
    color: #333;
}

/* Form container styling */
.form-container {
    margin-top: 24px;
}

.form-title {
    color: #333;
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 24px;
}

.form-layout {
    display: flex;
    gap: 24px;
}

.form-fields {
    flex: 1;
    background-color: white;
    border-radius: 16px;
    padding: 32px;
}

.form-banner {
    flex: 0 0 38%;
    background-color: white;
    border-radius: 16px;
    padding: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 400px;
}

.banner-content {
    text-align: center;
}

.banner-content h3 {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 12px;
}

/* Form section styling */
.form-section {
    margin-bottom: 24px;
}

.section-label {
    display: block;
    font-weight: 500;
    margin-bottom: 12px;
}

/* Radio buttons styling */
.radio-group {
    display: flex;
    gap: 24px;
}

.radio-option {
    display: flex;
    align-items: center;
    cursor: pointer;
    position: relative;
}

.radio-option input[type="radio"] {
    position: absolute;
    opacity: 0;
    width: 0;
    height: 0;
}

.radio-custom {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    border: 2px solid #ccc;
    display: inline-block;
    margin-right: 8px;
    position: relative;
}

.radio-option.active .radio-custom {
    border-color: #25c16f;
}

.radio-option.active .radio-custom::after {
    content: '';
    position: absolute;
    width: 12px;
    height: 12px;
    background-color: #25c16f;
    border-radius: 50%;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/* Form group styling */
.form-group {
    margin-bottom: 24px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
}

.form-control {
    width: 100%;
    padding: 12px 16px;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    font-size: 16px;
    transition: border-color 0.3s;
}

.form-control:focus {
    outline: none;
    border-color: #25c16f;
}

/* Select styling */
.select-wrapper {
    position: relative;
}

.select-arrow {
    position: absolute;
    right: 16px;
    top: 50%;
    transform: translateY(-50%);
    color: #666;
    font-size: 12px;
    pointer-events: none;
}

select.form-control {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    padding-right: 36px;
}

/* Button styling */
.form-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 32px;
}

.btn {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    border-radius: 24px;
    font-weight: 500;
    cursor: pointer;
    border: none;
    transition: all 0.2s;
}

.btn-primary {
    background-color: #25c16f;
    color: white;
}

.btn-primary:hover {
    background-color: #1ea05d;
}

.btn-secondary {
    background-color: #4c5760;
    color: white;
}

.btn-secondary:hover {
    background-color: #3a444b;
}

.material-icons {
    font-size: 18px;
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
   
        <!-- Seperated Main Area from Top and Side NavBar  -->
         
 <!-- Main content area  -->
    <div class="dashboard-content">
        <h1 class="welcome-text">Payees</h1>
        
        <div class="tabs-container">
           
        </div>
        
        <div class="form-container">
            <h2 class="form-title">Payee Details</h2>
            
            <div class="form-layout">
                <!-- Left Column - Form Fields -->
                <div class="form-fields">
                    <form action="${pageContext.request.contextPath}/payees" method="post">
                        <input type="hidden" name="action" value="add">
                        
                        <div class="form-section">
                            <label class="section-label">Transfer Type</label>
                            <div class="radio-group">
                                <label class="radio-option" id="helabankOption">
                                    <input type="radio" name="bankType" value="helabank">
                                    <span class="radio-custom"></span>
                                    Hela Bank Payee
                                </label>
                                <label class="radio-option active" id="otherbankOption">
                                    <input type="radio" name="bankType" value="otherbank" checked>
                                    <span class="radio-custom"></span>
                                    Other Bank Payee
                                </label>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="accountName">Account Name</label>
                            <input type="text" id="accountName" name="name" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="accountNumber">Account Number</label>
                            <input type="text" id="accountNumber" name="accountNumber" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="reAccountNumber">Re Enter Account Number</label>
                            <input type="text" id="reAccountNumber" name="confirmAccountNumber" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="nickname">Nickname</label>
                            <input type="text" id="nickname" name="nickname" class="form-control" required>
                        </div>
                        
                        <div class="form-group" id="bankSelection">
                            <label for="bank">Bank</label>
                            <div class="select-wrapper">
                                <select id="bank" name="bankName" class="form-control" required>
                                    <option value="" disabled selected>Please Select</option>
                                    <option value="HelaBank">HelaBank</option>
                                    <option value="Commercial Bank">Commercial Bank</option>
                                    <option value="Bank of Ceylon">Bank of Ceylon</option>
                                    <option value="People's Bank">People's Bank</option>
                                    <option value="Sampath Bank">Sampath Bank</option>
                                </select>
                                <span class="select-arrow">▼</span>
                            </div>
                        </div>
                        
                        <div class="form-group" id="branchSelection">
                            <label for="branch">Branch</label>
                            <div class="select-wrapper">
                                <select id="branch" name="branch" class="form-control">
                                    <option value="" disabled selected>Please Select</option>
                                    <option value="Main Branch">Main Branch</option>
                                    <option value="City Branch">City Branch</option>
                                    <option value="Suburban Branch">Suburban Branch</option>
                                </select>
                                <span class="select-arrow">▼</span>
                            </div>
                        </div>
                        
                        <div class="form-actions">
                            <button type="button" class="btn btn-secondary" id="backButton">
                                <span class="material-icons">arrow_back</span>
                                Back
                            </button>
                            <button type="submit" class="btn btn-primary">
                                Add
                                <span class="material-icons">add</span>
                            </button>
                        </div>
                    </form>
                </div>
                
                <!-- Right Column - Banner -->
                <div class="form-banner">
                    <div class="banner-content">
                        <div class="banner-image">
                            <span class="material-icons">people</span>
                        </div>
                        <h3>Add New Payee</h3>
                        <p>Save your frequent payment recipients as payees for faster transfers. Make sure to double-check the account details before adding.</p>
                    </div>
                </div>
            </div>
            
            <c:if test="${not empty error}">
                <div class="error-message" style="color: red; margin-top: 20px;">
                    ${error}
                </div>
            </c:if>
        </div>
    </div>

    <script>
    
    document.addEventListener('DOMContentLoaded', function() {
        const helabankOption = document.getElementById('helabankOption');
        const otherbankOption = document.getElementById('otherbankOption');
        const bankSelection = document.getElementById('bankSelection');
        const branchSelection = document.getElementById('branchSelection');
        const bankSelect = document.getElementById('bank');
        const backButton = document.getElementById('backButton');
        
        // Handle radio button selection
        helabankOption.addEventListener('click', function() {
            helabankOption.classList.add('active');
            otherbankOption.classList.remove('active');
            document.querySelector('input[name="bankType"][value="helabank"]').checked = true;
            
            // Set bank to HelaBank and hide selection (but don't disable)
            bankSelect.value = 'HelaBank';
            bankSelection.style.display = 'none';
        });
        
        otherbankOption.addEventListener('click', function() {
            otherbankOption.classList.add('active');
            helabankOption.classList.remove('active');
            document.querySelector('input[name="bankType"][value="otherbank"]').checked = true;
            
            // Show bank selection
            bankSelection.style.display = 'block';
            bankSelect.value = '';
        });
        
        // Handle back button
        backButton.addEventListener('click', function() {
            window.location.href = '${pageContext.request.contextPath}/payees';
        });
        
        // Form validation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(event) {
            const accountNumber = document.getElementById('accountNumber').value;
            const reAccountNumber = document.getElementById('reAccountNumber').value;
            
            if (accountNumber !== reAccountNumber) {
                event.preventDefault();
                alert('Account numbers do not match');
            }
        });
    });


    </script>
</body>
</html>