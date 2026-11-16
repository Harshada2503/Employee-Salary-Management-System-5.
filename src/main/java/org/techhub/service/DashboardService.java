
package org.techhub.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.repository.DashboardRepository;

@Service
public class DashboardService {

    @Autowired
    private DashboardRepository dashboardRepository;

    public int getTotalEmployees() {
        return dashboardRepository.getTotalEmployees();
    }

    public int getActiveEmployees() {
        return dashboardRepository.getActiveEmployees();
    }

    public int getTotalPayroll() {
        return dashboardRepository.getTotalPayroll();
    }

    public int getPaidPayroll() {
        return dashboardRepository.getPaidPayroll();
    }

    public int getPendingPayroll() {
        return dashboardRepository.getPendingPayroll();
    }

    public BigDecimal getTotalNetPayroll() {
        return dashboardRepository.getTotalNetPayroll();
    }
}
