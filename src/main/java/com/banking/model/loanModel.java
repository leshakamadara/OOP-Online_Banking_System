package com.banking.model;

public class loanModel {

	private int ID;  
	private String Name;
	private String Birth_Date;
	private String NIC;
	private String Phone; 
	private String Email;
	private String docs_link ; 
	private String Loan_Status;
	
	
	
	
	public loanModel(int ID, String Name, String Birth_Date, String NIC, String Phone, String Email, String docs_link, String Loan_Status) {
		
		super();
		this.ID = ID;
		this.Name = Name;
		this.Birth_Date = Birth_Date;
		this.NIC = NIC;
		this.Phone = Phone;
		this.Email = Email;
		this.docs_link = docs_link;
		this.Loan_Status = Loan_Status;
	}




	public int getID() {
		return ID;
	}




	public void setID(int iD) {
		ID = iD;
	}




	public String getName() {
		return Name;
	}




	public void setName(String name) {
		Name = name;
	}




	public String getBirth_Date() {
		return Birth_Date;
	}




	public void setBirth_Date(String birth_Date) {
		Birth_Date = birth_Date;
	}




	public String getNIC() {
		return NIC;
	}




	public void setNIC(String nIC) {
		NIC = nIC;
	}




	public String getPhone() {
		return Phone;
	}




	public void setPhone(String phone) {
		Phone = phone;
	}




	public String getEmail() {
		return Email;
	}




	public void setEmail(String email) {
		Email = email;
	}




	public String getDocs_link() {
		return docs_link;
	}




	public void setDocs_link(String docs_link) {
		this.docs_link = docs_link;
	}




	public String getLoan_Status() {
		return Loan_Status;
	}




	public void setLoan_Status(String loan_Status) {
		Loan_Status = loan_Status;
	}	
	
	
	
	

	
	
}
