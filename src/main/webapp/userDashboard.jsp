<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HelaBank Dashboard</title>
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

        .user-logout{
            cursor: pointer;
        }

        .user-logout:hover{
            color: #25c16f;
        }

         /*MAIN CONTENT*/
        /* Main content styling */

        
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

.section-title {
    color: #666;
    font-size: 14px;
    margin-bottom: 12px;
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
        
        <!-- Main content area  -->
        <div class="dashboard-content">
           <h1 class="welcome-text">Welcome, ${customer.fullname}!</h1>
            
            <div class="dashboard-grid">
<!-- Account Summary Card -->
<c:choose>
    <c:when test="${not empty primaryAccount}">
        <div class="card account-summary">
            <div class="account-number">
                <span>${primaryAccount.accountNumber}</span>
                <span class="status-badge">${primaryAccount.active ? 'Active' : 'Inactive'}</span>
            </div>
            <div class="account-type">${primaryAccount.accountType}</div>
            <div class="balance-section">
                <div class="balance-label">Balance</div>
                <div class="balance-amount">LKR <fmt:formatNumber value="${primaryAccount.balance}" pattern="#,##0.00" /></div>
                <div class="available-text">Available</div>
            </div>
            <div class="recent-transactions">
                <div class="section-title">Recent Transactions</div>
                <div class="transaction-list">
                    <c:choose>
                        <c:when test="${not empty recentTransactions}">
                            <c:forEach items="${recentTransactions}" var="transaction">
                                <div class="transaction ${transaction.transactionType == 'CREDIT' ? 'credit' : 'debit'}">
                                    ${transaction.transactionType == 'CREDIT' ? '↓' : '↑'} 
                                    <fmt:formatNumber value="${transaction.amount}" pattern="#,##0.00" />
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="transaction">No recent transactions</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
                        <div class="card account-summary">
                            <div class="account-number">
                                <span>No Primary Account</span>
                                <span class="status-badge">Inactive</span>
                            </div>
                            <div class="account-type">No Account</div>
                            <div class="balance-section">
                                <div class="balance-label">Balance</div>
                                <div class="balance-amount">LKR 0.00</div>
                                <div class="available-text">Available</div>
                            </div>
                            <div class="recent-transactions">
                                <div class="section-title">Recent Transactions</div>
                                <div class="transaction-list">
                                    <div class="transaction">No recent transactions</div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                
					<!-- Quick Transfer Card -->
				<div class="card quick-transfer">
				    <h3></h3>
				    <div class="transfer-form">
				        <div class="form-group">
				            <div class="notice-message"
				                 style="display: flex; flex-direction: column; align-items: center; justify-content: center; background: transparent; color: #333; padding: 32px 16px; border-radius: 12px; margin-bottom: 16px;">
				                <!-- Large centered image -->
				                <img src="images/maintaince.png"
				                     alt="Maintenance"
				                     style="width: 120px; height: 120px; object-fit: contain; margin-bottom: 20px;">
				                <!-- Notice text below image -->
				                <span style="font-size: 1.2em; font-weight: 500; text-align: center; display: block;">
				                    <strong>Under Maintenance</strong><br>
				                    Quick Transfer is temporarily unavailable.<br>
				                    Please try again later.
				                </span>
				            </div>
				        </div>
				        <div class="form-group"></div>
				        <div class="form-group"></div>
				    </div>
				</div>



                </div>
            </div>
            
            <!-- Quick Actions Section -->
            <div class="quick-actions">
                <h3>Quick Actions</h3>
                <div class="action-buttons">
                    <div class="action-button">
                        <div class="icon" id="icon1">
                            <span class="material-icons">account_balance</span>
                        </div>
                        <span class="labelquickActions">Open Acc</span>
                    </div>
                    <div class="action-button">
                        <div class="icon" id="icon2">
                            <span class="material-icons">credit_card</span>
                        </div>
                        <span class="labelquickActions">New Loan</span>
                    </div>
                    <div class="action-button">
                        <div class="icon" id="icon3">
                            <span class="material-icons">smartphone</span>
                        </div>
                        <span class="labelquickActions">Reloads</span>
                    </div>
                    <div class="action-button">
                        <div class="icon" id="icon4">
                            <span class="material-icons">add</span>
                        </div>
                        <span class="labelquickActions">Add</span>
                    </div>
                    <div class="action-button">
                        <div class="icon" id="icon5">
                            <span class="material-icons">add</span>
                        </div>
                        <span class="labelquickActions">Add</span>
                    </div>
                    <div class="action-button">
                        <div class="icon" id="icon6">
                            <span class="material-icons">add</span>
                        </div>
                        <span class="labelquickActions">Add</span>
                    </div>
                </div>                
            </div>
            
            <!-- Special Notice Banner -->
            <div class="special-notice">
                <div class="mockup-image">
                    <!-- Add your mockup image here, for example: -->
                    <img src="./images/unnamed.png" alt="Mobile App Mockup">
                </div>
                <div class="notice-content">
                    <h2>Get our mobile App</h2>
                    <p>Download our mobile banking app for convenient access to your accounts anytime, anywhere. Enjoy secure transactions, account monitoring, and exclusive mobile features.</p>
                    <div class="app-buttons">
                        <button class="app-button" id="appGoogleplay">Google Play</button>
                        <button class="app-button" id="appAppstore">App Store</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
// Quick Actions redirection
document.querySelectorAll('.icon').forEach(function(item, index) {
    item.addEventListener('click', function() {
        switch(index) {
            case 0: window.location.href = '${pageContext.request.contextPath}/account/create'; break;
            case 1: window.location.href = '${pageContext.request.contextPath}/loans/new'; break;
            case 2: window.location.href = '${pageContext.request.contextPath}/reloads'; break;
            case 3: window.location.href = '${pageContext.request.contextPath}/other1'; break;
            case 4: window.location.href = '${pageContext.request.contextPath}/other2'; break;
            case 5: window.location.href = '${pageContext.request.contextPath}/other3'; break;
            default: window.location.href = '${pageContext.request.contextPath}/dashboard'; break;
        }
    });
});

// App store buttons
document.getElementById('appGoogleplay').addEventListener('click', function() {
    window.open('https://play.google.com/store/', '_blank');
});

document.getElementById('appAppstore').addEventListener('click', function() {
    window.open('https://apps.apple.com/lk/app/asphalt-legends-unite/id1491129197?mt=12', '_blank');
});

// Logout functionality
document.getElementById('logout').addEventListener('click', function() {
    window.location.href='${pageContext.request.contextPath}/Logout';
});

document.getElementById('logoutTop').addEventListener('click', function() {
    window.location.href='${pageContext.request.contextPath}/Logout';
});


document.getElementById('settings').addEventListener('click', function() {
    window.location.href='${pageContext.request.contextPath}/Profile.jsp';
});


</script>
</html>