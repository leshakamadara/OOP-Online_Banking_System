<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleted</title>
</head>
<body>

		<% 	String Loan_Status= request.getParameter("Loan_Status");	
			String ID= request.getParameter("ID");	
			 %>	

	<form id="aForm" action="deleteServlet" method="post">
			
    			
				<input type="hidden" name="Loan_Status" value="<%=Loan_Status%>"  readonly>  	
				 <input type="hidden" name="ID" value="<%=ID%>"  readonly>
   			
	
	</form>
	
	
	<script>
   				 window.onload = function() {
       			 document.getElementById("aForm").submit();
  					  };
	</script>

</body>
</html>