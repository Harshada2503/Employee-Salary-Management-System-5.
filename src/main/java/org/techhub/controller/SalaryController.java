
package org.techhub.controller;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.techhub.model.Salary;
import org.techhub.service.SalaryService;

@Controller
@RequestMapping("/salary")
public class SalaryController {

    @Autowired
    private SalaryService salaryService;

    // Display Add Salary Form
    @GetMapping("/add")
    public String showAddSalaryForm(Model model) {

        model.addAttribute("salary", new Salary());

        model.addAttribute("employees",
                salaryService.getEmployeesForSalary());

        return "salary/add-salary";
    }

    // Save Salary Structure with Validation
    @PostMapping("/save")
    public String saveSalary(
            @Valid @ModelAttribute("salary") Salary salary,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {

            model.addAttribute("employees",
                    salaryService.getEmployeesForSalary());

            return "salary/add-salary";
        }

        try {
            boolean status = salaryService.addSalary(salary);

            if (status) {
                redirectAttributes.addFlashAttribute(
                        "success", "Salary structure added successfully!");
            } else {
                redirectAttributes.addFlashAttribute(
                        "error", "Unable to add salary structure!");
            }

        } catch (org.springframework.dao.DuplicateKeyException e) {
            redirectAttributes.addFlashAttribute(
                    "error",
                    "Salary structure already exists for this employee!");
        }

        return "redirect:/salary/list";
    }

    // Display All Salary Records
    @GetMapping("/list")
    public String getAllSalary(Model model) {

        model.addAttribute("salaries",
                salaryService.getAllSalary());

        return "salary/salary-list";
    }

    // Display Edit Salary Form
    @GetMapping("/edit/{id}")
    public String showEditSalaryForm(
            @PathVariable("id") int employee_id,
            Model model) {

        Salary salary =
                salaryService.getSalaryByEmployeeId(employee_id);

        if (salary == null) {
            return "redirect:/salary/list";
        }

        model.addAttribute("salary", salary);

        return "salary/edit-salary";
    }

    // Update Salary Structure with Validation
    @PostMapping("/update")
    public String updateSalary(
            @Valid @ModelAttribute("salary") Salary salary,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            return "salary/edit-salary";
        }

        boolean status = salaryService.updateSalary(salary);

        if (status) {
            redirectAttributes.addFlashAttribute(
                    "success", "Salary structure updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to update salary structure!");
        }

        return "redirect:/salary/list";
    }

    // Delete Salary Structure
    @PostMapping("/delete/{id}")
    public String deleteSalary(
            @PathVariable("id") int employee_id,
            RedirectAttributes redirectAttributes) {

        boolean status = salaryService.deleteSalary(employee_id);

        if (status) {
            redirectAttributes.addFlashAttribute(
                    "success", "Salary structure deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to delete salary structure!");
        }

        return "redirect:/salary/list";
    }
}
