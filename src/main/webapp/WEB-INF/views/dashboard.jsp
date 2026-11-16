
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Admin Dashboard | Employee Salary Management</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Common CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">

    <style>

/* ==========================================
   NAVY + TEAL PROFESSIONAL DASHBOARD
========================================== */

.dashboard-heading {
    margin-bottom: 30px;
}

.dashboard-heading h2 {
    color: #142B4A;
    font-size: 27px;
    font-weight: 700;
    margin: 0 0 8px;
}

.dashboard-heading p {
    color: #64748b;
    font-size: 14px;
    margin: 0;
}

/* ==========================================
   STATISTICS CARDS
========================================== */

.dashboard-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 22px;
}

.stat-card {
    position: relative;
    overflow: hidden;
    min-height: 145px;
    padding: 25px;

    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 13px;
    border-bottom: 4px solid #14B8A6;

    box-shadow: 0 5px 18px rgba(20, 43, 74, 0.06);
    transition: all 0.25s ease;
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 25px rgba(20, 43, 74, 0.12);
}

.stat-card h4 {
    color: #64748b;
    font-size: 13px;
    font-weight: 600;
    margin: 0 0 18px;
}

.stat-value {
    color: #142B4A;
    font-size: 30px;
    font-weight: 750;
    margin: 0;
    overflow-wrap: anywhere;
}

/* Teal decorative circle */

.stat-card::after {
    content: "";
    position: absolute;
    width: 85px;
    height: 85px;
    right: -20px;
    top: -20px;
    border-radius: 50%;
    background: rgba(20, 184, 166, 0.10);
}

/* ==========================================
   MANAGEMENT MODULES
========================================== */

.module-section {
    margin-top: 40px;
}

.module-section h2 {
    color: #142B4A;
    font-size: 21px;
    font-weight: 700;
    margin: 0 0 22px;
}

.module-links {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 20px;
}

.module-card {
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: center;

    min-height: 140px;
    padding: 24px;

    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 13px;
    border-left: 4px solid #14B8A6;

    color: #142B4A;
    text-decoration: none;

    box-shadow: 0 4px 15px rgba(20, 43, 74, 0.04);
    transition: all 0.25s ease;
}

.module-card:hover {
    transform: translateY(-5px);
    background: #f0fdfa;
    border-color: #14B8A6;
    box-shadow: 0 12px 24px rgba(20, 43, 74, 0.10);
}

.module-card strong {
    display: block;
    color: #142B4A;
    font-size: 15px;
    font-weight: 700;
    margin-bottom: 11px;
}

.module-card p {
    color: #64748b;
    font-size: 13px;
    line-height: 1.7;
    margin: 0;
}

/* ==========================================
   FOOTER
========================================== */

.dashboard-footer {
    margin-top: 40px;
    padding: 20px;
    border-top: 1px solid #e2e8f0;
    color: #64748b;
    font-size: 12px;
    text-align: center;
}

/* ==========================================
   RESPONSIVE DESIGN
========================================== */

@media (max-width: 1100px) {
    .dashboard-grid,
    .module-links {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }
}

@media (max-width: 700px) {
    .dashboard-grid,
    .module-links {
        grid-template-columns: 1fr;
    }

    .dashboard-heading h2 {
        font-size: 22px;
    }
}

    </style>

</head>

<body>

<div class="app-layout">

    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

    <!-- Main Content -->
    <main class="main-content">

        <!-- Top Navbar -->
        <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

        <!-- Dashboard Heading -->
        <div class="dashboard-heading">

            <h2>Dashboard Overview</h2>

            <p>
                Welcome to your Employee Salary Management System.
                Here's your organization summary.
            </p>

        </div>

        <!-- Dashboard Statistics -->
        <div class="dashboard-grid">

            <div class="stat-card">
                <h4>Total Employees</h4>
                <h2 class="stat-value">${totalEmployees}</h2>
            </div>

            <div class="stat-card">
                <h4>Active Employees</h4>
                <h2 class="stat-value">${activeEmployees}</h2>
            </div>

            <div class="stat-card">
                <h4>Total Payroll Records</h4>
                <h2 class="stat-value">${totalPayroll}</h2>
            </div>

            <div class="stat-card">
                <h4>Paid Payroll</h4>
                <h2 class="stat-value">${paidPayroll}</h2>
            </div>

            <div class="stat-card">
                <h4>Pending Payroll</h4>
                <h2 class="stat-value">${pendingPayroll}</h2>
            </div>

            <div class="stat-card">
                <h4>Total Net Payroll Amount</h4>
                <h2 class="stat-value">₹ ${totalNetPayroll}</h2>
            </div>

        </div>

        <!-- Management Modules -->
        <section class="module-section">

            <h2>Management Modules</h2>

            <div class="module-links">

                <a class="module-card"
                   href="${pageContext.request.contextPath}/employee/list">

                    <strong>Employee Management →</strong>

                    <p>Add, edit, view and manage employee records.</p>

                </a>

                <a class="module-card"
                   href="${pageContext.request.contextPath}/salary/add">

                    <strong>Add Salary →</strong>

                    <p>Assign salary details to employees.</p>

                </a>

                <a class="module-card"
                   href="${pageContext.request.contextPath}/salary/list">

                    <strong>Salary Management →</strong>

                    <p>View and manage employee salary structures.</p>

                </a>

                <a class="module-card"
                   href="${pageContext.request.contextPath}/payroll/add">

                    <strong>Generate Payroll →</strong>

                    <p>Generate monthly employee payroll records.</p>

                </a>

                <a class="module-card"
                   href="${pageContext.request.contextPath}/payroll/list">

                    <strong>Payroll Records →</strong>

                    <p>Track payments and payroll status.</p>

                </a>

                <a class="module-card"
                   href="${pageContext.request.contextPath}/employee/search">

                    <strong>Employee Search →</strong>

                    <p>Search and filter employee information.</p>

                </a>

                <a class="module-card"
                   href="${pageContext.request.contextPath}/department/list">

                    <strong>Department Management →</strong>

                    <p>Add, update and manage departments.</p>

                </a>

            </div>

        </section>

        <!-- Footer -->
        <div class="dashboard-footer">
            Employee Salary Management System | Admin Panel
        </div>

    </main>

</div>

</body>
</html>
