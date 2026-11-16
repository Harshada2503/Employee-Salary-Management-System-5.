
package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.model.Salary;

@Repository
public class SalaryRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Map database records to Salary object
    private RowMapper<Salary> salaryRowMapper = (rs, rowNum) -> {

        Salary salary = new Salary();

        salary.setSalary_id(rs.getInt("salary_id"));
        salary.setEmployee_id(rs.getInt("employee_id"));
        salary.setBasic_salary(rs.getBigDecimal("basic_salary"));
        salary.setHra(rs.getBigDecimal("hra"));
        salary.setDa(rs.getBigDecimal("da"));
        salary.setMedical_allowance(rs.getBigDecimal("medical_allowance"));
        salary.setPf(rs.getBigDecimal("pf"));
        salary.setProfessional_tax(rs.getBigDecimal("professional_tax"));
        salary.setOther_deductions(rs.getBigDecimal("other_deductions"));

        return salary;
    };

    // Save Salary Structure
    public int addSalary(Salary salary) {

        String sql = "INSERT INTO salary "
                + "(employee_id, basic_salary, hra, da, medical_allowance, "
                + "pf, professional_tax, other_deductions) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(sql,
                salary.getEmployee_id(),
                salary.getBasic_salary(),
                salary.getHra(),
                salary.getDa(),
                salary.getMedical_allowance(),
                salary.getPf(),
                salary.getProfessional_tax(),
                salary.getOther_deductions());
    }

    // Get All Salary Records

public List<Salary> getAllSalary() {

    String sql = "SELECT s.*, e.employee_name, e.department, "
            + "e.designation FROM salary s "
            + "INNER JOIN employees e "
            + "ON s.employee_id = e.employee_id";

    return jdbcTemplate.query(sql, (rs, rowNum) -> {

        Salary salary = new Salary();

        salary.setSalary_id(rs.getInt("salary_id"));
        salary.setEmployee_id(rs.getInt("employee_id"));
        salary.setEmployee_name(rs.getString("employee_name"));
        salary.setDepartment(rs.getString("department"));
        salary.setDesignation(rs.getString("designation"));

        salary.setBasic_salary(rs.getBigDecimal("basic_salary"));
        salary.setHra(rs.getBigDecimal("hra"));
        salary.setDa(rs.getBigDecimal("da"));
        salary.setMedical_allowance(rs.getBigDecimal("medical_allowance"));
        salary.setPf(rs.getBigDecimal("pf"));
        salary.setProfessional_tax(rs.getBigDecimal("professional_tax"));
        salary.setOther_deductions(rs.getBigDecimal("other_deductions"));

        return salary;
    });
}


    // Get Salary By Employee ID
    public Salary getSalaryByEmployeeId(int employee_id) {

        String sql = "SELECT * FROM salary WHERE employee_id = ?";

        List<Salary> salaries = jdbcTemplate.query(
                sql, salaryRowMapper, employee_id);

        return salaries.isEmpty() ? null : salaries.get(0);
    }

    // Update Salary Structure
    public int updateSalary(Salary salary) {

        String sql = "UPDATE salary SET "
                + "basic_salary = ?, hra = ?, da = ?, "
                + "medical_allowance = ?, pf = ?, "
                + "professional_tax = ?, other_deductions = ? "
                + "WHERE employee_id = ?";

        return jdbcTemplate.update(sql,
                salary.getBasic_salary(),
                salary.getHra(),
                salary.getDa(),
                salary.getMedical_allowance(),
                salary.getPf(),
                salary.getProfessional_tax(),
                salary.getOther_deductions(),
                salary.getEmployee_id());
    }

    // Delete Salary Structure
    public int deleteSalary(int employee_id) {

        String sql = "DELETE FROM salary WHERE employee_id = ?";

        return jdbcTemplate.update(sql, employee_id);
    }

    // Get Employees for Salary Dropdown
    public List<Salary> getEmployeesForSalary() {

        String sql = "SELECT employee_id, employee_name, department, "
                + "designation, basic_salary FROM employees "
                + "WHERE employee_status = 'Active'";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            Salary salary = new Salary();

            salary.setEmployee_id(rs.getInt("employee_id"));
            salary.setEmployee_name(rs.getString("employee_name"));
            salary.setDepartment(rs.getString("department"));
            salary.setDesignation(rs.getString("designation"));
            salary.setBasic_salary(rs.getBigDecimal("basic_salary"));

            return salary;
        });
    }
}
