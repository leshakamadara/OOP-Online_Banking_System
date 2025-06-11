package com.banking.model;

import java.util.Date;

public class Complaint {
    private int id;
    private String firstName;
    private String surname;
    private String address;
    private String email;
    private String accountOrNic;
    private String phoneNumber;
    private String preferredContactTime;
    private String complaintDetails;
    private Date submissionDate;
    private String status;
    
    public Complaint() {}

    public Complaint(String firstName, String surname, String address, String email, 
            String accountOrNic, String phoneNumber, String preferredContactTime, 
            String complaintDetails) {
        this.firstName = firstName;
        this.surname = surname;
        this.address = address;
        this.email = email;
        this.accountOrNic = accountOrNic;
        this.phoneNumber = phoneNumber;
        this.preferredContactTime = preferredContactTime;
        this.complaintDetails = complaintDetails;
        this.submissionDate = new Date();
        this.status = "Submitted";
    }
    // Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccountOrNic() {
		return accountOrNic;
	}

	public void setAccountOrNic(String accountOrNic) {
		this.accountOrNic = accountOrNic;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPreferredContactTime() {
		return preferredContactTime;
	}

	public void setPreferredContactTime(String preferredContactTime) {
		this.preferredContactTime = preferredContactTime;
	}

	public String getComplaintDetails() {
		return complaintDetails;
	}

	public void setComplaintDetails(String complaintDetails) {
		this.complaintDetails = complaintDetails;
	}

	public Date getSubmissionDate() {
		return submissionDate;
	}

	public void setSubmissionDate(Date submissionDate) {
		this.submissionDate = submissionDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
    
}




















