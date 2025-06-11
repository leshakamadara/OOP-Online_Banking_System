package com.banking.servlet;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.banking.model.loanModel;
import com.banking.utility.DBConnect;

public class loanController {

	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	
	
//insert data	
	public static boolean InsertLoanData(String Name, String Birth_Date, String NIC, String Phone, String Email, String docs_link, String Loan_Status) {
		
		isSuccess= false;
		
		try {
			
			
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			
			String sql= "insert into loan values(0, '"+Name+"','" +Birth_Date+"','"+NIC+"', '"+Phone+"', '"+Email+"', '" +docs_link+"', '"+ Loan_Status+"')";
			
			int rs =stmt.executeUpdate(sql);
			
			
			if(rs>0) {
				
				isSuccess = true;
				
			}
			else {
				
				isSuccess = false;
			}
			
		}
		
		catch(Exception e){
			
			e.printStackTrace();
			
			
		}
		return isSuccess;
		
	}
	
	
	
	//read data
	
	
	public static List<loanModel> getThroughID(String user){
		
		
		
		ArrayList<loanModel> loan =new ArrayList<>();
		
		
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql= "SELECT * FROM loan WHERE Loan_Status= '"+user+"'";
			
			rs =stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int ID= rs.getInt(1);
				String Name=rs.getString(2);
				String Birth_Date=rs.getString(3);
				String NIC=rs.getString(4);
				String Phone=rs.getString(5);
				String Email=rs.getString(6);
				String docs_link=rs.getString(7);
				String Loan_Status=rs.getString(8);
				
				loanModel rd= new loanModel(ID,Name,Birth_Date,NIC,Phone,Email,docs_link,Loan_Status );
				
				loan.add(rd);
				
			}
			
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		return loan;
	}
	
	
	
	//update data
	
	
	public static boolean updateData(String ID,String Name, String Birth_Date, String NIC, String Phone, String Email, String docs_link, String Loan_Status) {
		
		int CID=Integer.parseInt(ID);
		
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			
			String sql="update loan set Name='"+Name+"', Birth_Date='"+Birth_Date+"', NIC='"+NIC+"', Phone='"+Phone+"', Email='"+Email+"', docs_link='"+docs_link+"', Loan_Status='"+Loan_Status+"' where ID="+CID+"";
		
			int rs =stmt.executeUpdate(sql);
			
			
			if(rs>0) {
				
				isSuccess=true;
				
			}
			else {
				
				isSuccess=false;
			}
		
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
		
	}
	
	
	//delete data
	
	
	public static boolean deleteData(String ID){
		
		int CID=Integer.parseInt(ID);
		
		try {
			
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			
			String sql="delete from loan where ID ="+CID+"";
			int rs=stmt.executeUpdate(sql);
			if(rs>0) {
				
				isSuccess=true;
				
			}
			else {
				isSuccess=false;
			}
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
			
			
			
		}
		
		
		
		return isSuccess;
		
	}
	
	
	
	
	
	
	
}
