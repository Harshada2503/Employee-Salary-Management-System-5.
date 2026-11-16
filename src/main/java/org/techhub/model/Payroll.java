
package org.techhub.model;

import java.math.BigDecimal;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;

public class Payroll {

    private int payroll_id;

    @Positive(message = "Please select a valid employee")
    private int employee_id;

    private String employee_name;

    @NotBlank(message = "Salary month is required")
    @Pattern(
        regexp = "January|February|March|April|May|June|July|August|September|October|November|December",
        message = "Please select a valid salary month"
    )
    private String salary_month;

    @Min(value = 2020, message = "Salary year must be 2020 or later")
    private int salary_year;

    private BigDecimal gross_salary;

    private BigDecimal total_deductions;

    private BigDecimal net_salary;

    private String payment_date;

    private String payment_status;

    // Getters and Setters

    public int getPayroll_id() {
        return payroll_id;
    }

    public void setPayroll_id(int payroll_id) {
        this.payroll_id = payroll_id;
    }

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

    public String getSalary_month() {
        return salary_month;
    }

    public void setSalary_month(String salary_month) {
        this.salary_month = salary_month;
    }

    public int getSalary_year() {
        return salary_year;
    }

    public void setSalary_year(int salary_year) {
        this.salary_year = salary_year;
    }

    public BigDecimal getGross_salary() {
        return gross_salary;
    }

    public void setGross_salary(BigDecimal gross_salary) {
        this.gross_salary = gross_salary;
    }

    public BigDecimal getTotal_deductions() {
        return total_deductions;
    }

    public void setTotal_deductions(BigDecimal total_deductions) {
        this.total_deductions = total_deductions;
    }

    public BigDecimal getNet_salary() {
        return net_salary;
    }

    public void setNet_salary(BigDecimal net_salary) {
        this.net_salary = net_salary;
    }

    public String getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(String payment_date) {
        this.payment_date = payment_date;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }
}
