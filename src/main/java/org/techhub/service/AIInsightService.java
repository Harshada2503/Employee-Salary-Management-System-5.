
package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.PayrollAnalytics;
import org.techhub.repository.AIInsightRepository;

@Service
public class AIInsightService {

    @Autowired
    private AIInsightRepository aiInsightRepository;

    // Get monthly payroll analytics
    public PayrollAnalytics getMonthlyPayrollAnalytics(
            String month, int year) {

        if (month == null || month.trim().isEmpty()) {
            throw new IllegalArgumentException(
                    "Payroll month is required");
        }

        if (year < 2000 || year > 2100) {
            throw new IllegalArgumentException(
                    "Invalid payroll year");
        }

        return aiInsightRepository.getMonthlyPayrollAnalytics(
                month.trim(), year);
    }

    // Get all available payroll months
    public List<String> getAvailablePayrollMonths() {

        return aiInsightRepository.getAvailablePayrollMonths();
    }
}
