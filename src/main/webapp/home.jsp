<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>form</title>
	<link rel="stylesheet" href="css/loanhome.css">
	<link rel="stylesheet" href="css/HF.css">
	<script src="js/loanRe.js"></script>
	<script src="js/sidenav.js"></script>
	
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	

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
            <a href="${pageContext.request.contextPath}/contact" class="menu-item" id="navop7">
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
            <a href="${pageContext.request.contextPath}/logout" class="menu-item" id="logout">
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





	





	


	
<div id="table1"">

<div class="new"> <h3 >Loan Request </h3> </div>

    <form  method="post"  action="insertServlet" onsubmit="return confirmAdd()">
    	
    	<table id="formcolor22">
    	
    	
    	
    	
    		
    		
    		
    	
    	
    	
    		<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>


			<tr>
    			<td></td>
				<td class="space1"><input type="hidden" name="Loan_Status" value="${customer.username}" style="text-align:center;" class="space3" ></td>    	
			</tr>	
			 	
    	
    	
    		<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
    	
    	
    		
    		<tr>
    			<td >Name</td>
				<td class="space1"><input type="text" name="Name" style="text-align:center;" class="space3" required></td>    	
			</tr>		
			
			
			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
    	



    		<tr>
    			<td>Birth Date</td>
				<td class="space1"><input type="text" name="Birth_Date" style="text-align:center;" class="space3" required></td>    	
			</tr>
			
			
			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
		


			<tr>
    			<td>NIC</td>
				<td class="space1"><input type="text" name="NIC"  style="text-align:center;" class="space3" required></td>    	
			</tr>
			
			
			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
			
			
			
			
			<tr>
    			<td>Phone</td>
				<td class="space1"><input type="tel" pattern="[0-9]{10}"name="Phone" placeholder="Enter 10 digits"  style="text-align:center;" class="space3" required></td>    	
			</tr>
			
		

			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>



			
			<tr>
    			<td>Email</td>
				<td class="space1"><input type="text" name="Email" style="text-align:center;" class="space3" required></td>    	
			</tr>
			
	
	
			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
			
			
			
			<tr>
    			<td>Documents link</td>
				<td class="space1"><input type="text" name="docs_link" style="text-align:center;" class="space3" required></td>    	
			</tr>

			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5; "></td></tr>			
			

			<tr>
    			<td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"> <input type="checkbox"  id="chkbx" onclick="enablebox()" style="margin-left:65px; margin-top:15px; margin-bottom:15px; cursor: pointer; text-align:right;" >
    				  <label class="labelname">  Accept Privacy Policy and terms. </label>
    			</td>
				  	
			</tr>

			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>	



			
			
			
			
			
			
			
			
		




    		
    		<tr>
    			
				<td colspan="2" ><input type="submit" id="updatebutton1" value="SUBMIT" disabled></td>    	
			</tr>
    	
    	</table>
    	
    </form>  
 
</div>

    

    








</body>
</html>