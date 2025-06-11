<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>User edit Payee</title>
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

/* Dashboard Accounts Page Styling */
.dashboard-content {
    padding: 24px;
    background-color: #f5f5f5;
    border-radius: 16px;
    min-height: calc(100vh - 100px);
}

.page-title {
    font-size: 24px;
    font-weight: 600;
    color: #3a3f5c;
    margin-bottom: 20px;
}

.divider {
    height: 1px;
    background-color: #e0e0e0;
    margin: 20px 0;
}

.section-title {
    font-size: 20px;
    font-weight: 600;
    color: #3a3f5c;
    margin: 30px 0 20px 0;
}

.primary-account {
    display: flex;
    align-items: center;
    margin-bottom: 30px;
}

.account-label {
    font-size: 18px;
    font-weight: 500;
    color: #3a3f5c;
    width: 180px;
}

.primary-account-display {
    background-color: #25c16f;
    color: white;
    padding: 12px 24px;
    border-radius: 30px;
    font-size: 16px;
    font-weight: 500;
}

.accounts-table-container {
    background-color: white;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    margin-bottom: 30px;
}

.accounts-table {
    width: 100%;
    border-collapse: collapse;
}

.accounts-table th {
    text-align: left;
    padding: 16px 24px;
    color: #6b7280;
    font-weight: 500;
    font-size: 14px;
    border-bottom: 1px solid #e5e7eb;
}

.accounts-table td {
    padding: 16px 24px;
    font-size: 14px;
    color: #111827;
}

.update-button {
    background-color: #25c16f;
    color: white;
    border: none;
    border-radius: 6px;
    padding: 8px 16px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.2s;
}

.update-button:hover {
    background-color: #1ea65d;
}

.new-account-button-container {
    display: flex;
    justify-content: flex-end;
    margin-top: 20px;
}

.new-account-button {
    background-color: #25c16f;
    color: white;
    border: none;
    border-radius: 30px;
    padding: 12px 24px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: background-color 0.2s;
}

.new-account-button:hover {
    background-color: #1ea65d;
}

.new-account-button .material-icons {
    font-size: 18px;
}

 /* Edit Account Page Styling */
 .account-edit-container {
        background-color: white;
        border-radius: 16px;
        padding: 30px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        max-width: 600px;
        margin: 0 auto;
    }
    
    .account-form {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }
    
    .form-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    
    .form-group label {
        font-size: 14px;
        color: #666;
        font-weight: 500;
    }
    
    .account-number-display {
        background-color: #25c16f;
        color: white;
        padding: 12px 16px;
        border-radius: 30px;
        font-size: 16px;
        font-weight: 500;
        text-align: center;
        
    }
    
    .form-group input[type="text"] {
        padding: 12px 16px;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        font-size: 14px;
    }
    
    .form-group input[readonly] {
        background-color: #f5f5f5;
        color: #666;
    }
    
    .select-wrapper {
        position: relative;
    }
    
    .select-wrapper select {
        appearance: none;
        width: 100%;
        padding: 12px 16px;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        font-size: 14px;
        background-color: white;
        cursor: pointer;
    }
    
    .select-arrow {
        position: absolute;
        right: 16px;
        top: 50%;
        transform: translateY(-50%);
        color: #666;
        pointer-events: none;
        font-size: 12px;
    }
    
    .form-actions {
        display: flex;
        justify-content: flex-end;
        gap: 16px;
        margin-top: 16px;
    }
    
    .cancel-button, .update-account-button {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 12px 24px;
        border-radius: 30px;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.2s;
    }
    
    .cancel-button {
        background-color: #e0e0e0;
        color: #666;
        border: none;
    }
    
    .update-account-button {
        background-color: #25c16f;
        color: white;
        border: none;
    }
    
    .cancel-button:hover {
        background-color: #d0d0d0;
    }
    
    .update-account-button:hover {
        background-color: #1ea65d;
    }
    
    .cancel-button:active, .update-account-button:active {
        transform: scale(0.98);
    }
    
    .cancel-button .material-icons, .update-account-button .material-icons {
        font-size: 16px;
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
      <div class="dashboard-content">
    <h1 class="page-title">Accounts</h1>
    
    <div class="divider"></div>
    
    <div class="accounts-section">
        <h2 class="section-title">Edit Account</h2>
        
        <div class="account-edit-container">
            <form class="account-form" action="${pageContext.request.contextPath}/payees" method="post">
               <input type="hidden" name="action" value="update">
                    <input type="hidden" name="payeeId" value="${payee.payeeId}">
                    
                    <div class="form-section">
                        <label class="section-label">Transfer Type</label>
                        <div class="radio-group">
                            <label class="radio-option ${payee.payeeType eq 'helabank' ? 'active' : ''}" id="helabankOption">
                                <input type="radio" name="bankType" value="helabank" ${payee.payeeType eq 'helabank' ? 'checked' : ''}>
                                <span class="radio-custom"></span>
                                Hela Bank Payee
                            </label>
                            <label class="radio-option ${payee.payeeType eq 'otherbank' ? 'active' : ''}" id="otherbankOption">
                                <input type="radio" name="bankType" value="otherbank" ${payee.payeeType eq 'otherbank' ? 'checked' : ''}>
                                <span class="radio-custom"></span>
                                Other Bank Payee
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="accountName">Account Name</label>
                        <input type="text" id="accountName" name="name" class="form-control" value="${payee.name}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="accountNumber">Account Number</label>
                        <input type="text" id="accountNumber" name="accountNumber" class="form-control" value="${payee.accountNumber}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="nickname">Nickname</label>
                        <input type="text" id="nickname" name="nickname" class="form-control" value="${payee.nickname}" required>
                    </div>
                    
                    <div class="form-group" id="bankSelection">
                        <label for="bank">Bank</label>
                        <div class="select-wrapper">
                            <select id="bank" name="bankName" class="form-control" ${payee.payeeType eq 'helabank' ? 'disabled' : ''} required>
                                <option value="" disabled>Please Select</option>
                                <option value="HelaBank" ${payee.bankName eq 'HelaBank' ? 'selected' : ''}>HelaBank</option>
                                <option value="Commercial Bank" ${payee.bankName eq 'Commercial Bank' ? 'selected' : ''}>Commercial Bank</option>
                                <option value="Bank of Ceylon" ${payee.bankName eq 'Bank of Ceylon' ? 'selected' : ''}>Bank of Ceylon</option>
                                <option value="People's Bank" ${payee.bankName eq "People's Bank" ? 'selected' : ''}>People's Bank</option>
                                <option value="Sampath Bank" ${payee.bankName eq 'Sampath Bank' ? 'selected' : ''}>Sampath Bank</option>
                            </select>
                            <span class="select-arrow">▼</span>
                        </div>
                    </div>
                    
                    <div class="form-group" id="branchSelection">
                        <label for="branch">Branch</label>
                        <div class="select-wrapper">
                            <select id="branch" name="branch" class="form-control">
                                <option value="" disabled>Please Select</option>
                                <option value="Main Branch" ${payee.branch eq 'Main Branch' ? 'selected' : ''}>Main Branch</option>
                                <option value="City Branch" ${payee.branch eq 'City Branch' ? 'selected' : ''}>City Branch</option>
                                <option value="Suburban Branch" ${payee.branch eq 'Suburban Branch' ? 'selected' : ''}>Suburban Branch</option>
                            </select>
                            <span class="select-arrow">▼</span>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="cancel-button" id="backButton">
                            <span class="material-icons">arrow_back</span>
                            Back
                        </button>
                        <button type="submit" class="update-account-button">
                            Update
                            <span class="material-icons">save</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
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
        
        // Set bank to HelaBank and disable selection
        bankSelect.value = 'HelaBank';
        bankSelect.disabled = true;
    });
    
    otherbankOption.addEventListener('click', function() {
        otherbankOption.classList.add('active');
        helabankOption.classList.remove('active');
        document.querySelector('input[name="bankType"][value="otherbank"]').checked = true;
        
        // Enable bank selection
        bankSelect.disabled = false;
    });
    
    // Handle back button
    backButton.addEventListener('click', function() {
        window.location.href = '${pageContext.request.contextPath}/payees';
    });
    
    // Re-enable all disabled form fields before submission
    document.querySelector('form').addEventListener('submit', function() {
        // Enable all disabled selects before submitting
        document.querySelectorAll('select[disabled]').forEach(select => {
            select.disabled = false;
        });
        
        // Also enable any other disabled form elements if needed
        document.querySelectorAll('input[disabled]').forEach(input => {
            input.disabled = false;
        });
    });
});
</script>

</body>
</html>