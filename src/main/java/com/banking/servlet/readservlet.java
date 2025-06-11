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

@WebServlet("/readservlet")
public class readservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Loan_Status=request.getParameter("Loan_Status");
		List<loanModel> alldata= loanController.getThroughID(Loan_Status);
		request.setAttribute("alldata", alldata);
		
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("read.jsp");	
		dispatcher.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	
	}

}
