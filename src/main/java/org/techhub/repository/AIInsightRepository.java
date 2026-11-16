
package org.techhub.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.PayrollAnalytics;

@Repository
public class AIInsightRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Get payroll analytics for a particular month and year
    public PayrollAnalytics getMonthlyPayrollAnalytics(
            String month, int year) {

        String sql = """
                SELECT
                    salary_month,
                    salary_year,
                    COUNT(*) AS total_employees,
                    COALESCE(SUM(gross_salary), 0) AS gross_payroll,
                    COALESCE(SUM(total_deductions), 0) AS total_deductions,
                    COALESCE(SUM(net_salary), 0) AS net_payroll,
                    COALESCE(AVG(net_salary), 0) AS average_net_salary,

                    SUM(CASE
                        WHEN payment_status = 'Paid' THEN 1
                        ELSE 0
                    END) AS paid_count,

                    SUM(CASE
                        WHEN payment_status = 'Pending' THEN 1
                        ELSE 0
                    END) AS pending_count

                FROM payroll

                WHERE salary_month = ?
                AND salary_year = ?

                GROUP BY salary_month, salary_year
                """;

        List<PayrollAnalytics> result = jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    PayrollAnalytics analytics =
                            new PayrollAnalytics();

                    analytics.setSalaryMonth(
                            rs.getString("salary_month"));

                    analytics.setSalaryYear(
                            rs.getInt("salary_year"));

                    analytics.setTotalEmployees(
                            rs.getInt("total_employees"));

                    analytics.setGrossPayroll(
                            rs.getBigDecimal("gross_payroll"));

                    analytics.setTotalDeductions(
                            rs.getBigDecimal("total_deductions"));

                    analytics.setNetPayroll(
                            rs.getBigDecimal("net_payroll"));

                    analytics.setAverageNetSalary(
                            rs.getBigDecimal("average_net_salary"));

                    analytics.setPaidCount(
                            rs.getInt("paid_count"));

                    analytics.setPendingCount(
                            rs.getInt("pending_count"));

                    return analytics;
                },
                month,
                year
        );

        if (result.isEmpty()) {
            return null;
        }

        return result.get(0);
    }

    // Get all available payroll months

public List<String> getAvailablePayrollMonths() {

    String sql = "SELECT CONCAT(salary_month, ' ', salary_year) AS payroll_period "
            + "FROM payroll "
            + "GROUP BY salary_year, salary_month "
            + "ORDER BY salary_year DESC, "
            + "FIELD(salary_month, "
            + "'January', 'February', 'March', 'April', "
            + "'May', 'June', 'July', 'August', "
            + "'September', 'October', 'November', 'December'"
            + ") DESC";

    return jdbcTemplate.queryForList(sql, String.class);
}

}
