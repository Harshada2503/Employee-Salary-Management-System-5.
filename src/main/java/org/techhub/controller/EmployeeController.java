
package org.techhub.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.techhub.model.Employee;
import org.techhub.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    // 1. Display Add Employee Form
    @GetMapping("/add")
    public String showAddEmployeeForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "employee/add-employee";
    }

    // 2. Save Employee with Validation
    @PostMapping("/save")
    public String saveEmployee(
            @Valid @ModelAttribute("employee") Employee employee,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {

        // Check validation errors
        if (bindingResult.hasErrors()) {
            return "employee/add-employee";
        }

        boolean status = employeeService.addEmployee(employee);

        if (status) {
            redirectAttributes.addFlashAttribute(
                    "success", "Employee added successfully!");
        } else {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to add employee!");
        }

        return "redirect:/employee/list";
    }

    // 3. Display All Employees
    @GetMapping("/list")
    public String getAllEmployees(Model model) {

        List<Employee> employees =
                employeeService.getAllEmployees();

        model.addAttribute("employees", employees);

        return "employee/employee-list";
    }

    // 4. Display Edit Employee Form
    @GetMapping("/edit/{id}")
    public String editEmployee(
            @PathVariable("id") int employee_id,
            Model model) {

        Employee employee =
                employeeService.getEmployeeById(employee_id);

        if (employee == null) {
            return "redirect:/employee/list";
        }

        model.addAttribute("employee", employee);

        return "employee/edit-employee";
    }

    // 5. Update Employee with Validation
    @PostMapping("/update")
    public String updateEmployee(
            @Valid @ModelAttribute("employee") Employee employee,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {

        // Check validation errors
        if (bindingResult.hasErrors()) {
            return "employee/edit-employee";
        }

        boolean status = employeeService.updateEmployee(employee);

        if (status) {
            redirectAttributes.addFlashAttribute(
                    "success", "Employee updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to update employee!");
        }

        return "redirect:/employee/list";
    }

    // 6. Delete Employee
    @PostMapping("/delete/{id}")
    public String deleteEmployee(
            @PathVariable("id") int employee_id,
            RedirectAttributes redirectAttributes) {

        boolean status =
                employeeService.deleteEmployee(employee_id);

        if (status) {
            redirectAttributes.addFlashAttribute(
                    "success", "Employee deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to delete employee!");
        }

        return "redirect:/employee/list";
    }

    // 7. Search and Filter Employees
    @GetMapping("/search")
    public String searchEmployees(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "department", required = false) String department,
            @RequestParam(value = "status", required = false) String status,
            Model model) {

        List<Employee> employees =
                employeeService.searchEmployees(
                        keyword, department, status);

        model.addAttribute("employees", employees);
        model.addAttribute("keyword", keyword);
        model.addAttribute("selectedDepartment", department);
        model.addAttribute("selectedStatus", status);

        return "employee/employee-search";
    }

    // 8. View Employee Profile with Session Handling
    @GetMapping("/profile/{id}")
    public String viewEmployeeProfile(
            @PathVariable("id") int employee_id,
            HttpSession session,
            Model model) {

        // Check Admin Session
        if (session.getAttribute("adminId") == null) {
            return "redirect:/admin/login";
        }

        String adminName =
                (String) session.getAttribute("adminName");

        // Fetch Employee Details
        Employee employee =
                employeeService.getEmployeeById(employee_id);

        if (employee == null) {
            return "redirect:/employee/list";
        }

        model.addAttribute("employee", employee);
        model.addAttribute("adminName", adminName);

        return "employee/employee-profile";
    }

    // 9. Activate / Deactivate Employee
    @PostMapping("/status/{id}")
    public String updateEmployeeStatus(
            @PathVariable("id") int employee_id,
            @RequestParam("status") String status,
            RedirectAttributes redirectAttributes) {

        // Validate Employee Status
        if (!"Active".equals(status)
                && !"Inactive".equals(status)) {

            redirectAttributes.addFlashAttribute(
                    "error", "Invalid employee status!");

            return "redirect:/employee/list";
        }

        // Update Employee Status
        boolean updated =
                employeeService.updateEmployeeStatus(
                        employee_id, status);

        if (updated) {
            redirectAttributes.addFlashAttribute(
                    "success",
                    "Employee status updated to " + status + " successfully!");
        } else {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to update employee status!");
        }

        return "redirect:/employee/list";
    }
}
