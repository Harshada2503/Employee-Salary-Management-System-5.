
package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.Department;

@Repository
public class DepartmentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper
    private RowMapper<Department> rowMapper = (rs, rowNum) -> {

        Department department = new Department();

        department.setDepartment_id(rs.getInt("department_id"));
        department.setDepartment_name(rs.getString("department_name"));
        department.setDescription(rs.getString("description"));
        department.setDepartment_status(rs.getString("department_status"));

        return department;
    };

    // 1. Add Department
    public int addDepartment(Department department) {

        String sql = "INSERT INTO departments "
                + "(department_name, description, department_status) "
                + "VALUES (?, ?, ?)";

        return jdbcTemplate.update(sql,
                department.getDepartment_name(),
                department.getDescription(),
                department.getDepartment_status());
    }

    // 2. View All Departments
    public List<Department> getAllDepartments() {

        String sql = "SELECT * FROM departments "
                + "ORDER BY department_id DESC";

        return jdbcTemplate.query(sql, rowMapper);
    }

    // 3. Get Department By ID
    public Department getDepartmentById(int department_id) {

        String sql = "SELECT * FROM departments "
                + "WHERE department_id = ?";

        List<Department> departments =
                jdbcTemplate.query(sql, rowMapper, department_id);

        return departments.isEmpty() ? null : departments.get(0);
    }

    // 4. Update Department
    public int updateDepartment(Department department) {

        String sql = "UPDATE departments SET "
                + "department_name = ?, "
                + "description = ?, "
                + "department_status = ? "
                + "WHERE department_id = ?";

        return jdbcTemplate.update(sql,
                department.getDepartment_name(),
                department.getDescription(),
                department.getDepartment_status(),
                department.getDepartment_id());
    }

    // 5. Delete Department
    public int deleteDepartment(int department_id) {

        String sql = "DELETE FROM departments "
                + "WHERE department_id = ?";

        return jdbcTemplate.update(sql, department_id);
    }
    public boolean isDepartmentAssignedToEmployees(String department_name) {

        String sql = "SELECT COUNT(*) FROM employees WHERE department = ?";

        Integer count = jdbcTemplate.queryForObject(
                sql,
                Integer.class,
                department_name
        );

        return count != null && count > 0;
    }

}
