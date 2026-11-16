
package org.techhub.repository;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Total number of employees
    public int getTotalEmployees() {

        String sql = "SELECT COUNT(*) FROM employees";

        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    // Total active employees
    public int getActiveEmployees() {

        String sql =
                "SELECT COUNT(*) FROM employees "
                + "WHERE employee_status = 'Active'";

        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    // Total payroll records
    public int getTotalPayroll() {

        String sql = "SELECT COUNT(*) FROM payroll";

        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    // Total paid payroll records
    public int getPaidPayroll() {

        String sql =
                "SELECT COUNT(*) FROM payroll "
                + "WHERE payment_status = 'Paid'";

        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    // Total pending payroll records
    public int getPendingPayroll() {

        String sql =
                "SELECT COUNT(*) FROM payroll "
                + "WHERE payment_status = 'Pending'";

        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    // Total net payroll amount
    public BigDecimal getTotalNetPayroll() {

        String sql =
                "SELECT COALESCE(SUM(net_salary), 0) FROM payroll";

        return jdbcTemplate.queryForObject(sql, BigDecimal.class);
    }
}
