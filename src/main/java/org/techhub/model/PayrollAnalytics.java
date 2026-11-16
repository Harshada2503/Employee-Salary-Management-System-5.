
package org.techhub.model;

import java.math.BigDecimal;

public class PayrollAnalytics {

    private String salaryMonth;
    private int salaryYear;

    private int totalEmployees;

    private BigDecimal grossPayroll;
    private BigDecimal totalDeductions;
    private BigDecimal netPayroll;
    private BigDecimal averageNetSalary;

    private int paidCount;
    private int pendingCount;

    // Default constructor
    public PayrollAnalytics() {
    }

    // Getters and Setters

    public String getSalaryMonth() {
        return salaryMonth;
    }

    public void setSalaryMonth(String salaryMonth) {
        this.salaryMonth = salaryMonth;
    }

    public int getSalaryYear() {
        return salaryYear;
    }

    public void setSalaryYear(int salaryYear) {
        this.salaryYear = salaryYear;
    }

    public int getTotalEmployees() {
        return totalEmployees;
    }

    public void setTotalEmployees(int totalEmployees) {
        this.totalEmployees = totalEmployees;
    }

    public BigDecimal getGrossPayroll() {
        return grossPayroll;
    }

    public void setGrossPayroll(BigDecimal grossPayroll) {
        this.grossPayroll = grossPayroll;
    }

    public BigDecimal getTotalDeductions() {
        return totalDeductions;
    }

    public void setTotalDeductions(BigDecimal totalDeductions) {
        this.totalDeductions = totalDeductions;
    }

    public BigDecimal getNetPayroll() {
        return netPayroll;
    }

    public void setNetPayroll(BigDecimal netPayroll) {
        this.netPayroll = netPayroll;
    }

    public BigDecimal getAverageNetSalary() {
        return averageNetSalary;
    }

    public void setAverageNetSalary(BigDecimal averageNetSalary) {
        this.averageNetSalary = averageNetSalary;
    }

    public int getPaidCount() {
        return paidCount;
    }

    public void setPaidCount(int paidCount) {
        this.paidCount = paidCount;
    }

    public int getPendingCount() {
        return pendingCount;
    }

    public void setPendingCount(int pendingCount) {
        this.pendingCount = pendingCount;
    }
}
