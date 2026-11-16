
package org.techhub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.PayrollAnalytics;
import org.techhub.service.AIInsightService;

@Controller
@RequestMapping("/ai-insights")
public class AIInsightController {

    @Autowired
    private AIInsightService aiInsightService;

    // Display AI Payroll Intelligence dashboard
    @GetMapping
    public String showAIInsights(

            @RequestParam(name = "month", required = false)
            String month,

            @RequestParam(name = "year", required = false)
            Integer year,

            Model model) {

        // Retrieve available payroll months
        List<String> availableMonths =
                aiInsightService.getAvailablePayrollMonths();

        model.addAttribute("availableMonths", availableMonths);

        // Select latest available month by default
        if ((month == null || month.trim().isEmpty())
                && !availableMonths.isEmpty()) {

            String latestMonth = availableMonths.get(0);

            String[] parts = latestMonth.split(" ");

            month = parts[0];
            year = Integer.parseInt(parts[1]);
        }

        // Retrieve analytics for selected month
        if (month != null && year != null) {

            PayrollAnalytics analytics =
                    aiInsightService.getMonthlyPayrollAnalytics(
                            month, year);

            model.addAttribute("analytics", analytics);
            model.addAttribute("selectedMonth", month);
            model.addAttribute("selectedYear", year);
        }

        return "ai/ai-dashboard";
    }
}
