
package org.techhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.techhub.service.DashboardService;

@Controller
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

    @GetMapping({"/", "/dashboard"})
    public String showDashboard(Model model) {

        model.addAttribute("totalEmployees",
                dashboardService.getTotalEmployees());

        model.addAttribute("activeEmployees",
                dashboardService.getActiveEmployees());

        model.addAttribute("totalPayroll",
                dashboardService.getTotalPayroll());

        model.addAttribute("paidPayroll",
                dashboardService.getPaidPayroll());

        model.addAttribute("pendingPayroll",
                dashboardService.getPendingPayroll());

        model.addAttribute("totalNetPayroll",
                dashboardService.getTotalNetPayroll());

        return "dashboard";
    }
}
