package com.banking.service;
import java.sql.SQLException;
import java.util.List;

import com.banking.dao.ComplaintDao;
import com.banking.model.Complaint;



public class ComplaintService {
    private ComplaintDao complaintDao;
    
    public ComplaintService() {
        this.complaintDao = new ComplaintDao();
    }
    
    public int submitComplaint(Complaint complaint) throws SQLException {
        return complaintDao.addComplaint(complaint);
    }
    
    public List<Complaint> getAllComplaints() throws SQLException {
        return complaintDao.getAllComplaints();
    }
    
    public Complaint getComplaintById(int id) throws SQLException {
        return complaintDao.getComplaintById(id);
    }
    
    public boolean updateComplaint(Complaint complaint) throws SQLException {
        return complaintDao.updateComplaint(complaint);
    }
    
    public boolean deleteComplaint(int id) throws SQLException {
        return complaintDao.deleteComplaint(id);
    }
}