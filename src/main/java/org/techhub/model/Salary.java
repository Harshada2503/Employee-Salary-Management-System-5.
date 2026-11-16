
package org.techhub.model;

import java.math.BigDecimal;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

public class Salary {

    private int salary_id;

    @Positive(message = "Please select a valid employee")
    private int employee_id;

    @NotNull(message = "Basic salary is required")
    @DecimalMin(value = "0.01",
            message = "Basic salary must be greater than zero")
    private BigDecimal basic_salary;

    @NotNull(message = "HRA is required")
    @DecimalMin(value = "0.00",
            message = "HRA cannot be negative")
    private BigDecimal hra;

    @NotNull(message = "DA is required")
    @DecimalMin(value = "0.00",
            message = "DA cannot be negative")
    private BigDecimal da;

    @NotNull(message = "Medical allowance is required")
    @DecimalMin(value = "0.00",
            message = "Medical allowance cannot be negative")
    private BigDecimal medical_allowance;

    @NotNull(message = "PF is required")
    @DecimalMin(value = "0.00",
            message = "PF cannot be negative")
    private BigDecimal pf;

    @NotNull(message = "Professional tax is required")
    @DecimalMin(value = "0.00",
            message = "Professional tax cannot be negative")
    private BigDecimal professional_tax;

    @NotNull(message = "Other deductions are required")
    @DecimalMin(value = "0.00",
            message = "Other deductions cannot be negative")
    private BigDecimal other_deductions;

    private String employee_name;
    private String department;
    private String designation;

    public Salary() {
    }

	public int getSalary_id() {
		return salary_id;
	}

	public void setSalary_id(int salary_id) {
		this.salary_id = salary_id;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public BigDecimal getBasic_salary() {
		return basic_salary;
	}

	public void setBasic_salary(BigDecimal basic_salary) {
		this.basic_salary = basic_salary;
	}

	public BigDecimal getHra() {
		return hra;
	}

	public void setHra(BigDecimal hra) {
		this.hra = hra;
	}

	public BigDecimal getDa() {
		return da;
	}

	public void setDa(BigDecimal da) {
		this.da = da;
	}

	public BigDecimal getMedical_allowance() {
		return medical_allowance;
	}

	public void setMedical_allowance(BigDecimal medical_allowance) {
		this.medical_allowance = medical_allowance;
	}

	public BigDecimal getPf() {
		return pf;
	}

	public void setPf(BigDecimal pf) {
		this.pf = pf;
	}

	public BigDecimal getProfessional_tax() {
		return professional_tax;
	}

	public void setProfessional_tax(BigDecimal professional_tax) {
		this.professional_tax = professional_tax;
	}

	public BigDecimal getOther_deductions() {
		return other_deductions;
	}

	public void setOther_deductions(BigDecimal other_deductions) {
		this.other_deductions = other_deductions;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
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

    // Generate getters and setters for all fields in STS

	// Calculate Gross Salary
	public BigDecimal getGrossSalary() {

	    BigDecimal basic = basic_salary == null
	            ? BigDecimal.ZERO : basic_salary;

	    BigDecimal house = hra == null
	            ? BigDecimal.ZERO : hra;

	    BigDecimal dearness = da == null
	            ? BigDecimal.ZERO : da;

	    BigDecimal medical = medical_allowance == null
	            ? BigDecimal.ZERO : medical_allowance;

	    return basic.add(house).add(dearness).add(medical);
	}

	// Calculate Total Deductions
	public BigDecimal getTotalDeductions() {

	    BigDecimal providentFund = pf == null
	            ? BigDecimal.ZERO : pf;

	    BigDecimal tax = professional_tax == null
	            ? BigDecimal.ZERO : professional_tax;

	    BigDecimal other = other_deductions == null
	            ? BigDecimal.ZERO : other_deductions;

	    return providentFund.add(tax).add(other);
	}

	// Calculate Net Salary
	public BigDecimal getNetSalary() {

	    return getGrossSalary().subtract(getTotalDeductions());
	}
}


