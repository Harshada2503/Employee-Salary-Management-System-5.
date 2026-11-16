
package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.Payroll;

@Repository
public class PayrollRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Map database records to Payroll object
    private RowMapper<Payroll> payrollRowMapper = (rs, rowNum) -> {

        Payroll payroll = new Payroll();

        payroll.setPayroll_id(rs.getInt("payroll_id"));
        payroll.setEmployee_id(rs.getInt("employee_id"));
        payroll.setEmployee_name(rs.getString("employee_name"));
        payroll.setSalary_month(rs.getString("salary_month"));
        payroll.setSalary_year(rs.getInt("salary_year"));
        payroll.setGross_salary(rs.getBigDecimal("gross_salary"));
        payroll.setTotal_deductions(rs.getBigDecimal("total_deductions"));
        payroll.setNet_salary(rs.getBigDecimal("net_salary"));
        payroll.setPayment_date(rs.getString("payment_date"));
        payroll.setPayment_status(rs.getString("payment_status"));

        return payroll;
    };

    // Generate Monthly Payroll for Active Employees
    public int generatePayroll(int employee_id,
                               String salary_month,
                               int salary_year) {

        String sql =
            "INSERT INTO payroll "
            + "(employee_id, salary_month, salary_year, "
            + "gross_salary, total_deductions, net_salary, "
            + "payment_status) "

            + "SELECT s.employee_id, ?, ?, "

            // Calculate Gross Salary
            + "(COALESCE(s.basic_salary, 0) "
            + "+ COALESCE(s.hra, 0) "
            + "+ COALESCE(s.da, 0) "
            + "+ COALESCE(s.medical_allowance, 0)), "

            // Calculate Total Deductions
            + "(COALESCE(s.pf, 0) "
            + "+ COALESCE(s.professional_tax, 0) "
            + "+ COALESCE(s.other_deductions, 0)), "

            // Calculate Net Salary
            + "((COALESCE(s.basic_salary, 0) "
            + "+ COALESCE(s.hra, 0) "
            + "+ COALESCE(s.da, 0) "
            + "+ COALESCE(s.medical_allowance, 0)) "
            + "- (COALESCE(s.pf, 0) "
            + "+ COALESCE(s.professional_tax, 0) "
            + "+ COALESCE(s.other_deductions, 0))), "

            + "'Pending' "

            // Allow only Active Employees
            + "FROM salary s "
            + "INNER JOIN employees e "
            + "ON s.employee_id = e.employee_id "
            + "WHERE s.employee_id = ? "
            + "AND e.employee_status = 'Active'";

        return jdbcTemplate.update(
            sql, salary_month, salary_year, employee_id);
    }

    // Display All Payroll Records
    public List<Payroll> getAllPayroll() {

        String sql =
            "SELECT p.*, e.employee_name "
            + "FROM payroll p "
            + "INNER JOIN employees e "
            + "ON p.employee_id = e.employee_id "
            + "ORDER BY p.salary_year DESC, p.payroll_id DESC";

        return jdbcTemplate.query(sql, payrollRowMapper);
    }

    // Get Payroll By ID
    public Payroll getPayrollById(int payroll_id) {

        String sql =
            "SELECT p.*, e.employee_name "
            + "FROM payroll p "
            + "INNER JOIN employees e "
            + "ON p.employee_id = e.employee_id "
            + "WHERE p.payroll_id = ?";

        try {

            return jdbcTemplate.queryForObject(
                sql, payrollRowMapper, payroll_id);

        } catch (EmptyResultDataAccessException e) {

            return null;
        }
    }

    // Update Payment Status
    public int updatePaymentStatus(int payroll_id,
                                   String payment_status) {

        String sql =
            "UPDATE payroll SET payment_status = ?, "
            + "payment_date = CASE "
            + "WHEN ? = 'Paid' THEN CURRENT_DATE "
            + "ELSE NULL END "
            + "WHERE payroll_id = ?";

        return jdbcTemplate.update(
            sql, payment_status, payment_status, payroll_id);
    }

    // Get Payroll History By Employee ID
    public List<Payroll> getPayrollByEmployeeId(int employee_id) {

        String sql =
            "SELECT p.*, e.employee_name "
            + "FROM payroll p "
            + "INNER JOIN employees e "
            + "ON p.employee_id = e.employee_id "
            + "WHERE p.employee_id = ? "
            + "ORDER BY p.salary_year DESC, p.payroll_id DESC";

        return jdbcTemplate.query(
            sql, payrollRowMapper, employee_id);
    }

}
