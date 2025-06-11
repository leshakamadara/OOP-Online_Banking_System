<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Requests</title>

	<link rel="stylesheet" href="css/LoanReq.css">
	<link rel="stylesheet" href="css/HF.css">
	<script src="js/loanRe.js"></script>
	
	
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

        .user-logout{
            cursor: pointer;
        }

        .user-logout:hover{
            color: #25c16f;
        }
</style>

</head>
<body> 





<!-- side navigation bar part starts here -->
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
<!-- side navigation bar part ends here -->













<!-- catch id using session -->

	<%
	
	String Loan_Statuss= request.getParameter("username");
	
	%>




	
<div id="adjustment1">
	
	
	
	
	<!-- title -->
	<div >
		<h3 id="head1">My Loan Requests</h3>
	</div>




	<!-- add -->
	<div >
		<a href="home.jsp?Loan_Status=${Loan_Statuss}">
		
		<button id=addbtn><p id="addlabel2">+</p><p id="addlabel">add</p>  </button>
		</a>
	</div>






	<!-- search -->
	<div id="sbox" >
		<input type="text" id="searchIn" class="searchInn" placeholder="Q   search requests">
	</div>




</div>


<!-- table content -->

<div id="table1">
	<table  >
	
		
		<tr>
			
			<th class="space2" >Name </th>
			<th class="space2" > Birth_Date</th>
			<th class="space2" > NIC</th>
			<th class="space2" > Phone</th>
			<th class="space2" > Email</th>
			<th class="space2" >Documents Link </th>
			<th class="space2" > User</th>
			<th > </th>
			<th > </th>
		
		</tr>
	
	<c:forEach var="loan" items="${alldata}" >
	<tr  >
	
			
			<td class="space1"> ${loan.name}</td>
			<td class="space1"> ${loan.birth_Date}</td>
			<td class="space1"> ${loan.NIC}</td>
			<td class="space1"> ${loan.phone} </td>
			<td class="space1"> ${loan.email} </td>
			
			
			
			<td class="space1"> <a href="${loan.docs_link}" id="linkcolor11" >Click here</a></td>
			
			
		
		
			<td class="space1"> ${loan.loan_Status}</td>
			
			
			
			<td class="fix1" id="space3"> 
				<a href="updateloan.jsp?ID=${loan.ID}&Name=${loan.name}&Birth_Date=${loan.birth_Date}&NIC=${loan.NIC}&Phone=${loan.phone}&Email=${loan.email}&docs_link=${loan.docs_link}&Loan_Status=${loan.loan_Status} " >
				<button id="updatebutton1">Edit</button>
				</a>
			</td>
		
		
			<td class="fix2" >		
				
				
					
				<a href="deletereq.jsp?ID=${loan.ID}&Loan_Status=${loan.loan_Status} " >
				<button onclick="return confirmdelete()" id="deletebutton1">Delete</button>
				</a>
			
			</td>
	
	</tr>
	
	
	<tr>
	
			<td colspan="9" style="height: 4px; right:20px; background-color:#f5f5f5;"></td>
	
	
	
	</tr> 

	</c:forEach>
	
	</table>	
</div> 
 

<script>
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

</body>
</html>



