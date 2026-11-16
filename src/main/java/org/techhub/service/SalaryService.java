
package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.Salary;
import org.techhub.repository.SalaryRepository;

@Service
public class SalaryService {

    @Autowired
    private SalaryRepository salaryRepository;

    // Add Salary Structure
    public boolean addSalary(Salary salary) {

        return salaryRepository.addSalary(salary) > 0;
    }

    // Get All Salary Records
    public List<Salary> getAllSalary() {

        return salaryRepository.getAllSalary();
    }

    // Get Salary By Employee ID
    public Salary getSalaryByEmployeeId(int employee_id) {

        return salaryRepository.getSalaryByEmployeeId(employee_id);
    }

    // Update Salary Structure
    public boolean updateSalary(Salary salary) {

        return salaryRepository.updateSalary(salary) > 0;
    }

    // Delete Salary Structure
    public boolean deleteSalary(int employee_id) {

        return salaryRepository.deleteSalary(employee_id) > 0;
    }

    // Get Active Employees for Salary Dropdown
    public List<Salary> getEmployeesForSalary() {

        return salaryRepository.getEmployeesForSalary();
    }
}
