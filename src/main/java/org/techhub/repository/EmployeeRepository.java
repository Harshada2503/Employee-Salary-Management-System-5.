
package org.techhub.repository;

import java.util.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.Employee;

@Repository
public class EmployeeRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// RowMapper: Convert database records into Employee objects
	private RowMapper<Employee> rowMapper = (rs, rowNum) -> {

		Employee employee = new Employee();

		employee.setEmployee_id(rs.getInt("employee_id"));
		employee.setEmployee_name(rs.getString("employee_name"));
		employee.setEmail(rs.getString("email"));
		employee.setPhone(rs.getString("phone"));
		employee.setGender(rs.getString("gender"));
		employee.setDepartment(rs.getString("department"));
		employee.setDesignation(rs.getString("designation"));
		employee.setJoining_date(rs.getDate("joining_date"));
		employee.setBasic_salary(rs.getDouble("basic_salary"));
		employee.setEmployee_status(rs.getString("employee_status"));

		return employee;
	};

	// 1. Add Employee
	public int addEmployee(Employee employee) {

		String sql = "INSERT INTO employees " + "(employee_name, email, phone, gender, department, "
				+ "designation, joining_date, basic_salary, employee_status) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		return jdbcTemplate.update(sql, employee.getEmployee_name(), employee.getEmail(), employee.getPhone(),
				employee.getGender(), employee.getDepartment(), employee.getDesignation(), employee.getJoining_date(),
				employee.getBasic_salary(), employee.getEmployee_status());
	}

	// 2. View All Employees
	public List<Employee> getAllEmployees() {

		String sql = "SELECT * FROM employees ORDER BY employee_id DESC";

		return jdbcTemplate.query(sql, rowMapper);
	}

	// 3. View Employee By ID
	public Employee getEmployeeById(int employee_id) {

		String sql = "SELECT * FROM employees WHERE employee_id = ?";

		List<Employee> employees = jdbcTemplate.query(sql, rowMapper, employee_id);

		return employees.isEmpty() ? null : employees.get(0);
	}

	// 4. Update Employee
	public int updateEmployee(Employee employee) {

		String sql = "UPDATE employees SET " + "employee_name = ?, email = ?, phone = ?, gender = ?, "
				+ "department = ?, designation = ?, joining_date = ?, " + "basic_salary = ?, employee_status = ? "
				+ "WHERE employee_id = ?";

		return jdbcTemplate.update(sql, employee.getEmployee_name(), employee.getEmail(), employee.getPhone(),
				employee.getGender(), employee.getDepartment(), employee.getDesignation(), employee.getJoining_date(),
				employee.getBasic_salary(), employee.getEmployee_status(), employee.getEmployee_id());
	}

	// 5. Delete Employee
	public int deleteEmployee(int employee_id) {

		String sql = "DELETE FROM employees WHERE employee_id = ?";

		return jdbcTemplate.update(sql, employee_id);
	}

	// 6. Search and Filter Employees
	public List<Employee> searchEmployees(String keyword, String department, String status) {

		String sql = "SELECT * FROM employees WHERE 1=1";

		List<Object> params = new ArrayList<>();

		// Search by employee name or employee ID
		if (keyword != null && !keyword.trim().isEmpty()) {

			sql += " AND (employee_name LIKE ? OR employee_id = ?)";

			params.add("%" + keyword.trim() + "%");

			try {
				params.add(Integer.parseInt(keyword.trim()));
			} catch (NumberFormatException e) {
				params.add(-1);
			}
		}

		// Filter by department
		if (department != null && !department.trim().isEmpty()) {

			sql += " AND department = ?";

			params.add(department);
		}

		// Filter by employee status
		if (status != null && !status.trim().isEmpty()) {

			sql += " AND employee_status = ?";

			params.add(status);
		}

		sql += " ORDER BY employee_id DESC";

		return jdbcTemplate.query(sql, rowMapper, params.toArray());
	}

	public boolean updateEmployeeStatus(int employee_id, String status) {

		String sql = "UPDATE employees SET employee_status = ? WHERE employee_id = ?";

		int result = jdbcTemplate.update(sql, status, employee_id);

		return result > 0;
	}
}
