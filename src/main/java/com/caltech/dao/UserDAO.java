package com.caltech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.caltech.dbUtil.DbUtil;
import com.caltech.pojo.User;
import com.caltech.pojo.Slot;
import com.caltech.pojo.Participant;
import java.util.List;
import java.util.ArrayList;

public class UserDAO {

    // Insert new user into the database
    public int insertUser(User user) throws ClassNotFoundException, SQLException {
        Connection con = DbUtil.getConn();
        if (con != null) {
            System.out.println("Connection is working ...");
        } else {
            System.out.println("Connection failed ..");
        }

        // Prepare statement for DB insertion
        String sql = "INSERT INTO users (name, age, weight, address, email, tel_number, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, user.getName());
        ps.setInt(2, user.getAge());
        ps.setDouble(3, user.getWeight());
        ps.setString(4, user.getAddress());
        ps.setString(5, user.getEmail());
        ps.setString(6, user.getTelNumber());
        ps.setString(7, user.getPassword());
        
        int i = ps.executeUpdate(); // Execute insert operation
        return i; // Return the number of rows affected
    }

    // Check if a user with the same email already exists
    public boolean checkEmailExists(String email) throws SQLException, ClassNotFoundException {
        Connection con = DbUtil.getConn();
        String sql = "SELECT * FROM users WHERE email = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        return rs.next(); // If a record is found, email already exists
    }
    
    public User authenticateUser(String email, String password) throws SQLException, ClassNotFoundException {
        Connection con = DbUtil.getConn();
        if (con != null) {
            System.out.println("Connection is working ...");
        } else {
            System.out.println("Connection failed ..");
        }

        // SQL query to find the user by email and password
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        // If a user is found, return a User object with the retrieved data
        if (rs.next()) {
            User user = new User();
            user.setName(rs.getString("name"));
            user.setAge(rs.getInt("age"));
            user.setWeight(rs.getDouble("weight"));
            user.setAddress(rs.getString("address"));
            user.setEmail(rs.getString("email"));
            user.setTelNumber(rs.getString("tel_number"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role")); // Add role field to User object
            return user; // Return the authenticated user object
        }

        // Return null if no matching user is found
        return null;
    }
    
    public List<Slot> getAllSlots() throws SQLException, ClassNotFoundException {
        List<Slot> slotsList = new ArrayList<>();
        Connection con = DbUtil.getConn();
        String sql = "SELECT date, time, count FROM slots ORDER BY date";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Slot slot = new Slot();
            slot.setDate(rs.getDate("date"));
            slot.setTime(rs.getTime("time"));
            slot.setCount(rs.getInt("count"));
            slotsList.add(slot);
        }

        return slotsList;
    }
    
    public int getSlotCount(String date, String time) throws SQLException, ClassNotFoundException {
        int remainingSlots = 0;
        Connection con = DbUtil.getConn();
        String sql = "SELECT count FROM slots WHERE date = ? AND time = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, date);
        ps.setString(2, time);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            remainingSlots = rs.getInt("count");
        }

        return remainingSlots;
    }

    public boolean bookSlot(String date, String time, String email) throws SQLException, ClassNotFoundException {
        Connection con = DbUtil.getConn();

        // Start a transaction to ensure atomicity
        con.setAutoCommit(false);

        try {
            // Step 1: Decrease the slot count by 1 in the 'slots' table
            String updateSlotSql = "UPDATE slots SET count = count - 1 WHERE date = ? AND time = ?";
            PreparedStatement psUpdate = con.prepareStatement(updateSlotSql);
            psUpdate.setString(1, date);
            psUpdate.setString(2, time);
            int updated = psUpdate.executeUpdate();

            if (updated == 0) {
                // If no rows were updated, the slot was not available
                con.rollback();
                return false;
            }

            // Step 2: Insert the registration into the 'slots_registered' table
            String insertSql = "INSERT INTO slots_registered (date, time, emailid) VALUES (?, ?, ?)";
            PreparedStatement psInsert = con.prepareStatement(insertSql);
            psInsert.setString(1, date);
            psInsert.setString(2, time);
            psInsert.setString(3, email);
            psInsert.executeUpdate();

            // Commit the transaction
            con.commit();
            return true;
        } catch (SQLException e) {
            // If there is any error, rollback the transaction
            con.rollback();
            e.printStackTrace();
            return false;
        } finally {
            // Restore default commit behavior
            con.setAutoCommit(true);
        }
    }

    
    public boolean isSlotBookedByUser(String email, String date, String time) throws SQLException, ClassNotFoundException {
        Connection con = DbUtil.getConn();
        String sql = "SELECT * FROM slots_registered WHERE emailid = ? AND date = ? AND time = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, date);
        ps.setString(3, time);
        
        ResultSet rs = ps.executeQuery();
        
        // If the user has already booked the slot, return true
        return rs.next(); // If a record is found, the user has already booked this slot
    }
    
    public List<Participant> getParticipantsForSlot(String date, String time) throws SQLException, ClassNotFoundException {
        List<Participant> participants = new ArrayList<>();
        String sql = "SELECT u.name, u.email, u.tel_number, u.age, u.weight, sr.date AS slot_date, sr.time AS slot_time " +
                     "FROM slots_registered sr " +
                     "JOIN users u ON sr.emailid = u.email " +
                     "WHERE sr.date = ? AND sr.time = ?";

        Connection con = DbUtil.getConn();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, date);
        ps.setString(2, time);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Participant participant = new Participant();
            participant.setName(rs.getString("name"));
            participant.setEmail(rs.getString("email"));
            participant.setPhone(rs.getString("tel_number"));
            participant.setAge(rs.getInt("age"));
            participant.setWeight(rs.getDouble("weight"));
            participant.setSlotDate(rs.getString("slot_date"));
            participant.setSlotTime(rs.getString("slot_time"));
            participants.add(participant);
        }

        return participants;
    }


    
    



}
