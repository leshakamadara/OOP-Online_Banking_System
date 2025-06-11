package com.banking.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/insertServlet")
public class insertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Name= request.getParameter("Name");
		String Birth_Date= request.getParameter("Birth_Date");
		String NIC= request.getParameter("NIC");
		String Phone= request.getParameter("Phone");
		String Email = request.getParameter("Email");
		String docs_link= request.getParameter("docs_link");
		String Loan_Status= request.getParameter("Loan_Status");	
		
		
		boolean isTrue;
		
		isTrue= loanController.InsertLoanData(Name,Birth_Date,NIC,Phone,Email,docs_link,Loan_Status);
		
		
		if(isTrue== false) {
			response.getWriter().println("<script> alert('Application not sent Successfully'); </script>" );
			RequestDispatcher dis2=request.getRequestDispatcher("insertServlet");
			dis2.forward(request,response);
			
		}  
		else {
			
			response.getWriter().println("<script> alert('Application sent Successfully'); </script>" );
			RequestDispatcher dis2=request.getRequestDispatcher("readservlet");
			dis2.forward(request,response);
			
			
		}
		
	}

}
