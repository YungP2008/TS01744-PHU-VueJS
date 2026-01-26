package com.poly.model;

import java.util.Date;
import java.util.Arrays;

public class Staff {
    private String fullname;
    private Date birthday;
    private boolean gender;
    private String[] hobbies;
    private String country;
    private double salary;

    // Constructor
    public Staff() {
    }

    // Getters and Setters
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String[] getHobbies() {
        return hobbies;
    }

    public void setHobbies(String[] hobbies) {
        this.hobbies = hobbies;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "fullname='" + fullname + '\'' +
                ", birthday=" + birthday +
                ", gender=" + (gender ? "Male" : "Female") +
                ", hobbies=" + Arrays.toString(hobbies) +
                ", country='" + country + '\'' +
                ", salary=" + salary +
                '}';
    }
}