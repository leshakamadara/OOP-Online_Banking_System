package com.banking.model;

public class Customer {
    private int userId; // primary key field
    private String username;
    private String fullname;

    private String branch;
    private String contact;
    private String gender;
    private String nic;
    private String email;
    private String password;
    private String profilePicture;

    // Update constructor to include userId and remove accountNumber
    public Customer(int userId, String username, String fullname, String branch, String contact,
            String gender, String nic, String email, String password, String profilePicture) {
        super();
        this.userId = userId;
        this.username = username;
        this.fullname = fullname;
        this.branch = branch;
        this.contact = contact;
        this.gender = gender;
        this.nic = nic;
        this.email = email;
        this.password = password;
        this.profilePicture = profilePicture;
    }

    // Default constructor
    public Customer() {}

    // Add getter and setter for userId
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    // Getters and Setters

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	
    
}
