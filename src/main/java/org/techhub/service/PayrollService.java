
package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Payroll;
import org.techhub.repository.PayrollRepository;

@Service
public class PayrollService {

    @Autowired
    private PayrollRepository payrollRepository;

    // Generate Monthly Payroll
    public boolean generatePayroll(
            int employee_id,
            String salary_month,
            int salary_year) {

        return payrollRepository.generatePayroll(
                employee_id, salary_month, salary_year) > 0;
    }

    // Get All Payroll Records
    public List<Payroll> getAllPayroll() {

        return payrollRepository.getAllPayroll();
    }

    // Get Payroll By ID
    public Payroll getPayrollById(int payroll_id) {

        return payrollRepository.getPayrollById(payroll_id);
    }

    // Update Payment Status
    public boolean updatePaymentStatus(
            int payroll_id,
            String payment_status) {

        return payrollRepository.updatePaymentStatus(
                payroll_id, payment_status) > 0;
    }
    

public List<Payroll> getPayrollByEmployeeId(int employee_id) {

    return payrollRepository.getPayrollByEmployeeId(employee_id);
}

}
