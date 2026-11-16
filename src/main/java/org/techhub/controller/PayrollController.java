
package org.techhub.controller;

import java.util.List;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.techhub.model.Payroll;
import org.techhub.service.PayrollService;
import org.techhub.service.SalaryService;

@Controller
@RequestMapping("/payroll")
public class PayrollController {

    @Autowired
    private PayrollService payrollService;

    @Autowired
    private SalaryService salaryService;

    // 1. Display Generate Payroll Form
    @GetMapping("/add")
    public String showPayrollForm(Model model) {

        model.addAttribute("employees",
                salaryService.getAllSalary());

        if (!model.containsAttribute("payroll")) {
            model.addAttribute("payroll", new Payroll());
        }

        return "payroll/add-payroll";
    }

    // 2. Generate Monthly Payroll
    @PostMapping("/generate")
    public String generatePayroll(
            @Valid @ModelAttribute("payroll") Payroll payroll,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Model model) {

        if (result.hasErrors()) {

            model.addAttribute("employees",
                    salaryService.getAllSalary());

            return "payroll/add-payroll";
        }

        try {

            boolean status = payrollService.generatePayroll(
                    payroll.getEmployee_id(),
                    payroll.getSalary_month(),
                    payroll.getSalary_year());

            if (status) {

                redirectAttributes.addFlashAttribute(
                        "success",
                        "Payroll generated successfully!");

            } else {

                redirectAttributes.addFlashAttribute(
                        "error",
                        "Payroll not generated. Employee may be Inactive or salary structure may not exist.");
            }

        } catch (DuplicateKeyException e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Payroll already generated for this employee and month!");
        }

        return "redirect:/payroll/list";
    }

    // 3. Display All Payroll Records
    @GetMapping("/list")
    public String getAllPayroll(Model model) {

        model.addAttribute(
                "payrolls",
                payrollService.getAllPayroll());

        return "payroll/payroll-list";
    }

    // 4. Update Payment Status
    @PostMapping("/update-status")
    public String updatePaymentStatus(
            @org.springframework.web.bind.annotation.RequestParam("payroll_id")
            int payroll_id,

            @org.springframework.web.bind.annotation.RequestParam("payment_status")
            String payment_status,

            RedirectAttributes redirectAttributes) {

        if (payroll_id <= 0) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Invalid payroll ID!");

            return "redirect:/payroll/list";
        }

        if (!"Paid".equals(payment_status)
                && !"Pending".equals(payment_status)) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Invalid payment status!");

            return "redirect:/payroll/list";
        }

        boolean status = payrollService.updatePaymentStatus(
                payroll_id, payment_status);

        if (status) {

            redirectAttributes.addFlashAttribute(
                    "success",
                    "Payment status updated successfully!");

        } else {

            redirectAttributes.addFlashAttribute(
                    "error",
                    "Unable to update payment status!");
        }

        return "redirect:/payroll/list";
    }

    // 5. View Salary Slip
    @GetMapping("/slip/{id}")
    public String viewSalarySlip(
            @PathVariable("id") int payroll_id,
            Model model) {

        if (payroll_id <= 0) {
            return "redirect:/payroll/list";
        }

        Payroll payroll =
                payrollService.getPayrollById(payroll_id);

        if (payroll == null) {
            return "redirect:/payroll/list";
        }

        model.addAttribute("payroll", payroll);

        return "payroll/salary-slip";
    }

    // 6. View Employee Payroll History
    @GetMapping("/history/{employee_id}")
    public String getEmployeePayrollHistory(
            @PathVariable("employee_id") int employee_id,
            Model model) {

        if (employee_id <= 0) {
            return "redirect:/employee/list";
        }

        List<Payroll> payrolls =
                payrollService.getPayrollByEmployeeId(employee_id);

        model.addAttribute("payrolls", payrolls);
        model.addAttribute("employeeId", employee_id);

        if (!payrolls.isEmpty()) {

            model.addAttribute(
                    "employeeName",
                    payrolls.get(0).getEmployee_name());
        }

        return "payroll/employee-payroll-history";
    }

}
