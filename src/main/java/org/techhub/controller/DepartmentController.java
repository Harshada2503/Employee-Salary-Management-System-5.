
package org.techhub.controller;

import java.util.List;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.techhub.model.Department;
import org.techhub.service.DepartmentService;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    // 1. Open Add Department Page
    @GetMapping("/department/add")
    public String showAddDepartmentForm(Model model) {

        model.addAttribute("department", new Department());

        return "department/add-department";
    }

    // 2. Save Department
    @PostMapping("/department/save")
    public String saveDepartment(
            @Valid @ModelAttribute("department") Department department,
            BindingResult result,
            Model model) {

        if (result.hasErrors()) {
            return "department/add-department";
        }

        try {

            departmentService.addDepartment(department);

        } catch (DuplicateKeyException e) {

            model.addAttribute(
                    "duplicateError",
                    "Department name already exists!");

            return "department/add-department";
        }

        return "redirect:/department/list";
    }

    // 3. View All Departments
    @GetMapping("/department/list")
    public String getAllDepartments(Model model) {

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute("departments", departments);

        return "department/department-list";
    }

    // 4. Open Edit Department Page
    @GetMapping("/department/edit/{id}")
    public String showEditDepartmentForm(
            @PathVariable("id") int department_id,
            Model model) {

        Department department =
                departmentService.getDepartmentById(department_id);

        if (department == null) {
            return "redirect:/department/list";
        }

        model.addAttribute("department", department);

        return "department/edit-department";
    }

    // 5. Update Department
    @PostMapping("/department/update")
    public String updateDepartment(
            @Valid @ModelAttribute("department") Department department,
            BindingResult result,
            Model model) {

        if (result.hasErrors()) {
            return "department/edit-department";
        }

        try {

            departmentService.updateDepartment(department);

        } catch (DuplicateKeyException e) {

            model.addAttribute(
                    "duplicateError",
                    "Department name already exists!");

            return "department/edit-department";
        }

        return "redirect:/department/list";
    }

    // 6. Delete Department
    @PostMapping("/department/delete/{id}")
    public String deleteDepartment(
            @PathVariable("id") int department_id) {

        if (department_id <= 0) {
            return "redirect:/department/list";
        }

        Department department =
                departmentService.getDepartmentById(department_id);

        if (department == null) {
            return "redirect:/department/list";
        }

        boolean assigned =
                departmentService.isDepartmentAssignedToEmployees(
                        department.getDepartment_name());

        if (assigned) {
            return "redirect:/department/list?error=assigned";
        }

        departmentService.deleteDepartment(department_id);

        return "redirect:/department/list?deleted=true";
    }

}
