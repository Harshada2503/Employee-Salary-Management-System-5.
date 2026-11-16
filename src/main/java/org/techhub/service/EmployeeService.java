
package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Employee;
import org.techhub.repository.EmployeeRepository;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	// 1. Add Employee
	public boolean addEmployee(Employee employee) {

		return employeeRepository.addEmployee(employee) > 0;
	}

	// 2. Get All Employees
	public List<Employee> getAllEmployees() {

		return employeeRepository.getAllEmployees();
	}

	// 3. Get Employee By ID
	public Employee getEmployeeById(int employee_id) {

		return employeeRepository.getEmployeeById(employee_id);
	}

	// 4. Update Employee
	public boolean updateEmployee(Employee employee) {

		return employeeRepository.updateEmployee(employee) > 0;
	}

	// 5. Delete Employee
	public boolean deleteEmployee(int employee_id) {

		return employeeRepository.deleteEmployee(employee_id) > 0;
	}

	// Search and filter employees
	public List<Employee> searchEmployees(String keyword, String department, String status) {

		return employeeRepository.searchEmployees(keyword, department, status);
	}

	public boolean updateEmployeeStatus(int employee_id, String status) {

		return employeeRepository.updateEmployeeStatus(employee_id, status);
	}
}
