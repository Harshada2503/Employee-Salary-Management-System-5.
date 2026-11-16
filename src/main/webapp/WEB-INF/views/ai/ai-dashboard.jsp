
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>AI Payroll Intelligence</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
    rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
    rel="stylesheet">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', sans-serif;
    background: #F4F7FB;
    color: #142B4A;
}

/* Main container */

.dashboard-container {
    padding: 35px;
    max-width: 1450px;
    margin: auto;
}

/* Header */

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 20px;
    margin-bottom: 30px;
}

.page-title {
    font-size: 27px;
    font-weight: 800;
    color: #142B4A;
}

.page-subtitle {
    color: #718096;
    font-size: 14px;
    margin-top: 7px;
}

.ai-badge {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    background: #E6F7F5;
    color: #0F9488;
    padding: 8px 14px;
    border-radius: 30px;
    font-size: 12px;
    font-weight: 700;
}

/* Filter */

.filter-card {
    background: white;
    border-radius: 14px;
    padding: 20px;
    margin-bottom: 25px;
    border: 1px solid #E3EAF2;
}

.form-select {
    border: 1px solid #DCE3EC;
    padding: 11px;
    border-radius: 8px;
    font-size: 13px;
}

.btn-filter {
    background: #142B4A;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 11px 23px;
    font-weight: 600;
}

.btn-filter:hover {
    background: #1E456D;
    color: white;
}

/* Statistics cards */

.stats-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    margin-bottom: 25px;
}

.stat-card {
    background: white;
    border-radius: 14px;
    padding: 23px;
    border: 1px solid #E5EAF1;
    box-shadow: 0 4px 15px rgba(20,43,74,0.04);
}

.stat-icon {
    width: 45px;
    height: 45px;
    border-radius: 12px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 21px;
    margin-bottom: 18px;
}

.icon-blue {
    background: #EAF0F8;
    color: #142B4A;
}

.icon-teal {
    background: #E6F7F5;
    color: #14B8A6;
}

.icon-orange {
    background: #FFF3E6;
    color: #E58A28;
}

.icon-green {
    background: #E8F7ED;
    color: #269653;
}

.stat-label {
    font-size: 13px;
    color: #7A8798;
    font-weight: 500;
}

.stat-value {
    font-size: 23px;
    font-weight: 800;
    color: #142B4A;
    margin-top: 7px;
    overflow-wrap: anywhere;
}

/* Details section */

.content-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

.content-card {
    background: white;
    border-radius: 14px;
    padding: 25px;
    border: 1px solid #E5EAF1;
    box-shadow: 0 4px 15px rgba(20,43,74,0.04);
}

.section-title {
    font-size: 17px;
    font-weight: 700;
    margin-bottom: 22px;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 14px 0;
    border-bottom: 1px solid #EDF0F4;
    gap: 10px;
    font-size: 13px;
}

.detail-row:last-child {
    border-bottom: none;
}

.detail-label {
    color: #718096;
}

.detail-value {
    font-weight: 700;
    color: #142B4A;
}

/* Status */

.status-paid {
    color: #168B51;
    background: #E8F7ED;
    padding: 5px 11px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
}

.status-pending {
    color: #C47A17;
    background: #FFF3E0;
    padding: 5px 11px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
}

/* Empty state */

.empty-state {
    background: white;
    border: 1px solid #E5EAF1;
    padding: 45px 20px;
    border-radius: 14px;
    text-align: center;
    color: #718096;
}

.empty-state i {
    font-size: 38px;
    color: #14B8A6;
    margin-bottom: 15px;
}

/* Footer */

.dashboard-footer {
    text-align: center;
    color: #94A3B8;
    font-size: 12px;
    margin-top: 35px;
}

/* Responsive */

@media(max-width: 1000px) {
    .stats-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media(max-width: 650px) {
    .dashboard-container {
        padding: 20px 14px;
    }

    .stats-grid,
    .content-grid {
        grid-template-columns: 1fr;
    }

    .page-title {
        font-size: 22px;
    }
}

</style>

</head>

<body>

<div class="dashboard-container">

    <!-- HEADER -->

    <div class="page-header">

        <div>
            <h1 class="page-title">
                <i class="bi bi-stars me-2"></i>
                AI Payroll Intelligence
            </h1>

            <p class="page-subtitle">
                Analyze payroll data and generate intelligent insights.
            </p>
        </div>

        <div class="ai-badge">
            <i class="bi bi-activity"></i>
            ANALYTICS FOUNDATION
        </div>

    </div>


    <!-- MONTH FILTER -->

    <div class="filter-card">

        <form action="${pageContext.request.contextPath}/ai-insights"
            method="get"
            class="row g-3 align-items-end">

            <div class="col-md-5">

                <label class="form-label fw-semibold small">
                    Select Payroll Month
                </label>

                <select name="month" class="form-select" required>

                    <c:forEach items="${availableMonths}" var="availableMonth">

                        <option value="${availableMonth.split(' ')[0]}"
                            <c:if test="${selectedMonth eq availableMonth.split(' ')[0] and selectedYear eq availableMonth.split(' ')[1]}">
                                selected
                            </c:if>>
                            ${availableMonth}
                        </option>

                    </c:forEach>

                </select>

            </div>

            <div class="col-md-3">

                <label class="form-label fw-semibold small">
                    Payroll Year
                </label>

                <input type="number"
                    name="year"
                    class="form-control"
                    value="${selectedYear}"
                    required>

            </div>

            <div class="col-md-4">

                <button type="submit" class="btn btn-filter w-100">
                    <i class="bi bi-funnel me-2"></i>
                    Analyze Payroll
                </button>

            </div>

        </form>

    </div>


    <!-- ANALYTICS -->

    <c:choose>

        <c:when test="${not empty analytics}">

            <div class="stats-grid">

                <!-- GROSS PAYROLL -->

                <div class="stat-card">

                    <div class="stat-icon icon-blue">
                        <i class="bi bi-cash-stack"></i>
                    </div>

                    <div class="stat-label">
                        Gross Payroll
                    </div>

                    <div class="stat-value">
                        ₹<c:out value="${analytics.grossPayroll}"/>
                    </div>

                </div>


                <!-- DEDUCTIONS -->

                <div class="stat-card">

                    <div class="stat-icon icon-orange">
                        <i class="bi bi-wallet2"></i>
                    </div>

                    <div class="stat-label">
                        Total Deductions
                    </div>

                    <div class="stat-value">
                        ₹<c:out value="${analytics.totalDeductions}"/>
                    </div>

                </div>


                <!-- NET PAYROLL -->

                <div class="stat-card">

                    <div class="stat-icon icon-teal">
                        <i class="bi bi-graph-up-arrow"></i>
                    </div>

                    <div class="stat-label">
                        Net Payroll
                    </div>

                    <div class="stat-value">
                        ₹<c:out value="${analytics.netPayroll}"/>
                    </div>

                </div>


                <!-- EMPLOYEES -->

                <div class="stat-card">

                    <div class="stat-icon icon-green">
                        <i class="bi bi-people"></i>
                    </div>

                    <div class="stat-label">
                        Total Employees
                    </div>

                    <div class="stat-value">
                        <c:out value="${analytics.totalEmployees}"/>
                    </div>

                </div>

            </div>


            <!-- DETAILS -->

            <div class="content-grid">

                <!-- PAYROLL DETAILS -->

                <div class="content-card">

                    <h5 class="section-title">
                        <i class="bi bi-bar-chart-line me-2"></i>
                        Payroll Summary
                    </h5>

                    <div class="detail-row">

                        <span class="detail-label">
                            Payroll Period
                        </span>

                        <span class="detail-value">
                            <c:out value="${analytics.salaryMonth}"/>
                            <c:out value="${analytics.salaryYear}"/>
                        </span>

                    </div>

                    <div class="detail-row">

                        <span class="detail-label">
                            Average Net Salary
                        </span>

                        <span class="detail-value">
                            ₹<c:out value="${analytics.averageNetSalary}"/>
                        </span>

                    </div>

                    <div class="detail-row">

                        <span class="detail-label">
                            Total Payroll Records
                        </span>

                        <span class="detail-value">
                            <c:out value="${analytics.totalEmployees}"/>
                        </span>

                    </div>

                </div>


                <!-- PAYMENT STATUS -->

                <div class="content-card">

                    <h5 class="section-title">
                        <i class="bi bi-credit-card me-2"></i>
                        Payment Status
                    </h5>

                    <div class="detail-row">

                        <span class="detail-label">
                            Paid Payroll
                        </span>

                        <span class="status-paid">
                            <c:out value="${analytics.paidCount}"/> Paid
                        </span>

                    </div>

                    <div class="detail-row">

                        <span class="detail-label">
                            Pending Payroll
                        </span>

                        <span class="status-pending">
                            <c:out value="${analytics.pendingCount}"/> Pending
                        </span>

                    </div>

                </div>

            </div>

        </c:when>


        <c:otherwise>

            <div class="empty-state">

                <i class="bi bi-database-exclamation d-block"></i>

                <h5>No Payroll Records Found</h5>

                <p class="mb-0">
                    Please select a month and year containing generated payroll records.
                </p>

            </div>

        </c:otherwise>

    </c:choose>


    <div class="dashboard-footer">
        AI-Powered Payroll Intelligence | Employee Salary Management System
    </div>

</div>

</body>

</html>
