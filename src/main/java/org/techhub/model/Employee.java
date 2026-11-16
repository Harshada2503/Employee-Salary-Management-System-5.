
package org.techhub.model;

import java.sql.Date;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

public class Employee {

    private int employee_id;

    @NotBlank(message = "Employee name is required")
    private String employee_name;

    @NotBlank(message = "Email is required")
    @Email(message = "Enter a valid email address")
    private String email;

    @NotBlank(message = "Phone number is required")
    @Pattern(
        regexp = "[6-9][0-9]{9}",
        message = "Phone number must contain 10 digits and start with 6, 7, 8 or 9"
    )
    private String phone;

    @NotBlank(message = "Gender is required")
    private String gender;

    @NotBlank(message = "Department is required")
    private String department;

    @NotBlank(message = "Designation is required")
    private String designation;

    @NotNull(message = "Joining date is required")
    private Date joining_date;

    @DecimalMin(
        value = "0.01",
        message = "Basic salary must be greater than zero"
    )
    private double basic_salary;

    private String employee_status;

    // Default Constructor
    public Employee() {
    }

    // Parameterized Constructor
    public Employee(int employee_id, String employee_name,
            String email, String phone, String gender,
            String department, String designation,
            Date joining_date, double basic_salary,
            String employee_status) {

        this.employee_id = employee_id;
        this.employee_name = employee_name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.department = department;
        this.designation = designation;
        this.joining_date = joining_date;
        this.basic_salary = basic_salary;
        this.employee_status = employee_status;
    }

    // Getters and Setters

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Date getJoining_date() {
        return joining_date;
    }

    public void setJoining_date(Date joining_date) {
        this.joining_date = joining_date;
    }

    public double getBasic_salary() {
        return basic_salary;
    }

    public void setBasic_salary(double basic_salary) {
        this.basic_salary = basic_salary;
    }

    public String getEmployee_status() {
        return employee_status;
    }

    public void setEmployee_status(String employee_status) {
        this.employee_status = employee_status;
    }
}
