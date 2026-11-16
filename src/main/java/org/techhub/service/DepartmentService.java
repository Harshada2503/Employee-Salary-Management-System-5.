
package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Department;
import org.techhub.repository.DepartmentRepository;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;

    // 1. Add Department
    public int addDepartment(Department department) {
        return departmentRepository.addDepartment(department);
    }

    // 2. View All Departments
    public List<Department> getAllDepartments() {
        return departmentRepository.getAllDepartments();
    }

    // 3. Get Department By ID
    public Department getDepartmentById(int department_id) {
        return departmentRepository.getDepartmentById(department_id);
    }

    // 4. Update Department
    public int updateDepartment(Department department) {
        return departmentRepository.updateDepartment(department);
    }

    // 5. Delete Department
    public int deleteDepartment(int department_id) {
        return departmentRepository.deleteDepartment(department_id);
    }
    
    public boolean isDepartmentAssignedToEmployees(String department_name) {
        return departmentRepository.isDepartmentAssignedToEmployees(department_name);
    }

}
