<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>

	<link rel="stylesheet" href="css/loanupdate.css">
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
<!-- side navigati
<!-- side navigation bar part ends here -->















	<%
		String ID= request.getParameter("ID");
		String Name= request.getParameter("Name");
		String Birth_Date= request.getParameter("Birth_Date");
		String NIC= request.getParameter("NIC");
		String Phone= request.getParameter("Phone");
		String Email = request.getParameter("Email");
		String docs_link= request.getParameter("docs_link");
		String Loan_Status= request.getParameter("Loan_Status");	
%>






	




		<!-- title -->
		
	<div class="head1"> <h3 > Edit Request  </h3> </div>
	
	
	
	
	
	
	
	
    <form   method="post"  action="updateServlet"  onsubmit="return confirmEdit()" >
    <div id="table1">
    	<table id="formcolor22">
   			
   			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>


			<tr>
    			<td>User Name</td>
				<td class="space1"><input type="text" name="Loan_Status" value="<%=Loan_Status%>" class="space3" readonly></td>    	
			</tr>	 
   			
   			
   			
   			<tr>
    				<td class="space1"><input type="hidden" name="ID" value="<%=ID%>" class="space3" readonly></td>    	
			</tr>    	
    		
    		
    		<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
    		
    		
    	
    		<tr>
    			<td>Name</td>
				<td class="space1"><input type="text" name="Name" value="<%=Name%>" class="space3" required></td>    	
			</tr>		
    	
    	
    		<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
    	
    		
    		<tr>
    			<td>Birth Date</td>
				<td class="space1"><input type="text" name="Birth_Date" value="<%=Birth_Date%>"  class="space3" required></td>    	
			</tr>
			
			
			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
			
		

			<tr>
    			<td>NIC</td>
				<td class="space1"><input type="text" name="NIC" value="<%=NIC%>" class="space3" required></td>    	
			</tr>
			
			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
			
			
			
			<tr>
    			<td>Phone</td>
				<td class="space1"><input type="text" name="Phone" value="<%=Phone%>" class="space3" required></td>    	
			</tr>
			
			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
			
			
			
			<tr>
    			<td>Email</td>
				<td class="space1"><input type="text" name="Email" value="<%=Email%>"class="space3" required></td>    	
			</tr>
			
			
			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>
			
			
			<tr>
    			<td>Documents Link</td>
				<td class="space1"><input type="text" name="docs_link" value="<%=docs_link%>" class="space3" required></td>    	
			</tr>


	

			<tr><td colspan="2" style="height: 1px; right:20px; background-color:#f5f5f5;"></td></tr>


    		
    		<tr>
    			
				<td colspan="2" ><input type="submit" id="updatebutton1" value="UPDATE"></td>    	
			</tr>
    	
    	</table>
    </div>
    </form>  
    

</body>
</html>