package com.banking.servlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.banking.model.loanModel;


@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ID= request.getParameter("ID");
		String Name= request.getParameter("Name");
		String Birth_Date= request.getParameter("Birth_Date");
		String NIC= request.getParameter("NIC");
		String Phone= request.getParameter("Phone");
		String Email = request.getParameter("Email");
		String docs_link= request.getParameter("docs_link");
		String Loan_Status= request.getParameter("Loan_Status");

		
		boolean isTrue;
		isTrue= loanController.updateData(ID,Name,Birth_Date,NIC,Phone,Email,docs_link,Loan_Status);
		
		if(isTrue==true) {
			List<loanModel> loandetails=loanController.getThroughID(ID);
			request.setAttribute("loandetails", loandetails);
			response.getWriter().println("<script> alert('Application sent Successfully');</script>" );
			RequestDispatcher dis2=request.getRequestDispatcher("readservlet");
			dis2.forward(request,response);

		}
		
		else {
			
			RequestDispatcher dis2=request.getRequestDispatcher("#");
			dis2.forward(request,response);
			
		}
		
		
		
	
		
		
		
	}

}
