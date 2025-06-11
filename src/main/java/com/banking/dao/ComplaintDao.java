package com.banking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.banking.model.Complaint;
import com.banking.utility.DBConnect;

public class ComplaintDao {
    private static final String INSERT_SQL = "INSERT INTO complaints " +
            "(first_name, surname, address, email, account_or_nic, phone_number, " +
            "preferred_contact_time, complaint_details, submission_date, status) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static final String SELECT_ALL = "SELECT * FROM complaints ORDER BY submission_date DESC";
    private static final String SELECT_BY_ID = "SELECT * FROM complaints WHERE id = ?";
    private static final String UPDATE_SQL = "UPDATE complaints SET " +
            "first_name = ?, surname = ?, address = ?, email = ?, account_or_nic = ?, " +
            "phone_number = ?, preferred_contact_time = ?, complaint_details = ?, status = ? " +
            "WHERE id = ?";
    private static final String DELETE_SQL = "DELETE FROM complaints WHERE id = ?";
    
    public int addComplaint(Complaint complaint) throws SQLException {
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {
            
            setComplaintParameters(statement, complaint);
            statement.setTimestamp(9, new Timestamp(complaint.getSubmissionDate().getTime()));
            statement.setString(10, complaint.getStatus());
            
            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating complaint failed, no rows affected.");
            }
            
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating complaint failed, no ID obtained.");
                }
            }
        }
    }
    
    public List<Complaint> getAllComplaints() throws SQLException {
        List<Complaint> complaints = new ArrayList<>();
        
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                complaints.add(mapResultSetToComplaint(resultSet));
            }
        }
        return complaints;
    }
    
    public Complaint getComplaintById(int id) throws SQLException {
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_BY_ID)) {
            
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToComplaint(resultSet);
                }
            }
        }
        return null;
    }
    
    public boolean updateComplaint(Complaint complaint) throws SQLException {
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_SQL)) {
            
            setComplaintParameters(statement, complaint);
            statement.setString(9, complaint.getStatus());
            statement.setInt(10, complaint.getId());
            
            return statement.executeUpdate() > 0;
        }
    }
    
    public boolean deleteComplaint(int id) throws SQLException {
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_SQL)) {
            
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        }
    }
    
    private void setComplaintParameters(PreparedStatement statement, Complaint complaint) throws SQLException {
        statement.setString(1, complaint.getFirstName());
        statement.setString(2, complaint.getSurname());
        statement.setString(3, complaint.getAddress());
        statement.setString(4, complaint.getEmail());
        statement.setString(5, complaint.getAccountOrNic());
        statement.setString(6, complaint.getPhoneNumber());
        statement.setString(7, complaint.getPreferredContactTime());
        statement.setString(8, complaint.getComplaintDetails());
    }
    
    private Complaint mapResultSetToComplaint(ResultSet resultSet) throws SQLException {
        Complaint complaint = new Complaint();
        complaint.setId(resultSet.getInt("id"));
        complaint.setFirstName(resultSet.getString("first_name"));
        complaint.setSurname(resultSet.getString("surname"));
        complaint.setAddress(resultSet.getString("address"));
        complaint.setEmail(resultSet.getString("email"));
        complaint.setAccountOrNic(resultSet.getString("account_or_nic"));
        complaint.setPhoneNumber(resultSet.getString("phone_number"));
        complaint.setPreferredContactTime(resultSet.getString("preferred_contact_time"));
        complaint.setComplaintDetails(resultSet.getString("complaint_details"));
        complaint.setSubmissionDate(resultSet.getTimestamp("submission_date"));
        complaint.setStatus(resultSet.getString("status"));
        return complaint;
    }
}