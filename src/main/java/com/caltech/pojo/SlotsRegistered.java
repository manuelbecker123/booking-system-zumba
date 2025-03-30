package com.caltech.pojo;

import java.sql.Date;
import java.sql.Time;

public class SlotsRegistered {

    private Date date;        // Date of the slot
    private Time time;        // Time of the slot
    private String emailid;   // Email ID of the user who registered

    // Constructor
    public SlotsRegistered() {}

    // Getters and Setters
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    @Override
    public String toString() {
        return "SlotsRegistered{" +
                "date=" + date +
                ", time=" + time +
                ", emailid='" + emailid + '\'' +
                '}';
    }
}
