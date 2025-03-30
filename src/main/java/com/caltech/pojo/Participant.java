package com.caltech.pojo;
public class Participant {

    private String name;
    private String email;
    private String phone;
    private int age;
    private double weight;
    private String slotDate;
    private String slotTime;

    // Default constructor
    public Participant() {
    }

    // Parameterized constructor
    public Participant(String name, String email, String phone, int age, double weight, String slotDate, String slotTime) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.age = age;
        this.weight = weight;
        this.slotDate = slotDate;
        this.slotTime = slotTime;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getSlotDate() {
        return slotDate;
    }

    public void setSlotDate(String slotDate) {
        this.slotDate = slotDate;
    }

    public String getSlotTime() {
        return slotTime;
    }

    public void setSlotTime(String slotTime) {
        this.slotTime = slotTime;
    }

    // Override toString method for better readability
    @Override
    public String toString() {
        return "Participant [name=" + name + ", email=" + email + ", phone=" + phone + ", age=" + age + ", weight=" + weight
                + ", slotDate=" + slotDate + ", slotTime=" + slotTime + "]";
    }
}
