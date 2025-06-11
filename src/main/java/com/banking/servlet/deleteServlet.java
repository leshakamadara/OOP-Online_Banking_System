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


@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ID=request.getParameter("ID");
		String Loan_Status= request.getParameter("Loan_Status");
		
		
		boolean isTrue;
		isTrue=loanController.deleteData(ID);
		
		if(isTrue==true) {
			RequestDispatcher dis2=request.getRequestDispatcher("readservlet");
			dis2.forward(request,response);
			response.getWriter().println("<script> alert('Application deleted Successfully');</script>" );
			
		}
		else {
			
			List<loanModel> loandetails= loanController.getThroughID(ID);
			request.setAttribute("loandetails", loandetails);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("deleteError.jsp");
			dispatcher.forward(request, response);
			
		}
		
		
	}

}
