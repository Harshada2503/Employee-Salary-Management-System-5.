
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Payroll History</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
body {
    background: #f8fafc;
}

.history-container {
    padding: 25px 0;
}

.page-heading {
    margin-bottom: 22px;
}

.page-heading h2 {
    color: #142B4A;
    font-size: 25px;
    margin-bottom: 7px;
}

.page-heading p {
    color: #64748b;
    font-size: 14px;
}

.employee-info {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-left: 5px solid #14B8A6;
    border-radius: 9px;
    padding: 20px 24px;
    margin-bottom: 25px;
    display: flex;
    gap: 45px;
    flex-wrap: wrap;
    box-shadow: 0 3px 12px rgba(20,43,74,0.04);
}

.info-item {
    display: flex;
    flex-direction: column;
    gap: 7px;
}

.info-label {
    color: #64748b;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.info-value {
    color: #142B4A;
    font-size: 15px;
    font-weight: 700;
}

.table-card {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    padding: 22px;
    box-shadow: 0 3px 12px rgba(20,43,74,0.04);
}

.table-card h3 {
    color: #142B4A;
    font-size: 17px;
    margin: 0 0 18px;
}

.table-wrapper {
    width: 100%;
    overflow-x: auto;
}

.history-table {
    width: 100%;
    min-width: 1150px;
    border-collapse: collapse;
}

.history-table th {
    background: #142B4A;
    color: #ffffff;
    padding: 14px 12px;
    font-size: 12px;
    font-weight: 600;
    text-align: center;
    white-space: nowrap;
}

.history-table td {
    padding: 14px 12px;
    border-bottom: 1px solid #e2e8f0;
    color: #334155;
    font-size: 13px;
    text-align: center;
    white-space: nowrap;
}

.history-table tbody tr:nth-child(even) {
    background: #f8fafc;
}

.history-table tbody tr:hover {
    background: #f0fdfa;
}

.salary-value {
    font-weight: 600;
    color: #142B4A;
}

.net-value {
    font-weight: 700;
    color: #0f766e;
}

.payment-badge {
    display: inline-block;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 700;
}

.paid {
    background: #dcfce7;
    color: #166534;
}

.pending {
    background: #fef3c7;
    color: #92400e;
}

.slip-link {
    display: inline-block;
    background: #ccfbf1;
    color: #0f766e;
    padding: 7px 13px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 12px;
    font-weight: 700;
}

.slip-link:hover {
    background: #14B8A6;
    color: #ffffff;
}

.empty-row {
    padding: 30px !important;
    color: #64748b !important;
    text-align: center !important;
    font-size: 14px !important;
}

.history-actions {
    margin-top: 22px;
}

.btn-back {
    display: inline-block;
    background: #142B4A;
    color: #ffffff;
    padding: 11px 20px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 600;
}

.btn-back:hover {
    background: #1e4264;
    color: #ffffff;
}

@media(max-width: 768px) {
    .history-container {
        padding: 18px 0;
    }

    .employee-info {
        gap: 20px;
        padding: 17px;
    }

    .table-card {
        padding: 14px;
    }

    .page-heading h2 {
        font-size: 21px;
    }
}
</style>
</head>

<body>

<div class="app-layout">

    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

    <main class="main-content">

        <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

        <div class="history-container">

            <div class="page-heading">
                <h2>Employee Payroll History</h2>
                <p>View the employee's monthly payroll records and payment details.</p>
            </div>

            <div class="employee-info">

                <div class="info-item">
                    <span class="info-label">Employee ID</span>
                    <span class="info-value">${employeeId}</span>
                </div>

                <div class="info-item">
                    <span class="info-label">Employee Name</span>

                    <span class="info-value">
                        <c:choose>
                            <c:when test="${not empty employeeName}">
                                ${employeeName}
                            </c:when>
                            <c:otherwise>
                                Employee details unavailable
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>

            </div>

            <div class="table-card">

                <h3>Monthly Payroll Records</h3>

                <div class="table-wrapper">

                    <table class="history-table">

                        <thead>
                            <tr>
                                <th>Payroll ID</th>
                                <th>Month</th>
                                <th>Year</th>
                                <th>Gross Salary</th>
                                <th>Total Deductions</th>
                                <th>Net Salary</th>
                                <th>Payment Date</th>
                                <th>Payment Status</th>
                                <th>Salary Slip</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="p" items="${payrolls}">

                                <tr>

                                    <td>${p.payroll_id}</td>

                                    <td>${p.salary_month}</td>

                                    <td>${p.salary_year}</td>

                                    <td class="salary-value">
                                        ₹ ${p.gross_salary}
                                    </td>

                                    <td class="salary-value">
                                        ₹ ${p.total_deductions}
                                    </td>

                                    <td class="net-value">
                                        ₹ ${p.net_salary}
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty p.payment_date}">
                                                ${p.payment_date}
                                            </c:when>
                                            <c:otherwise>
                                                Not Paid
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${p.payment_status == 'Paid'}">
                                                <span class="payment-badge paid">
                                                    Paid
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="payment-badge pending">
                                                    Pending
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <a class="slip-link"
                                           href="${pageContext.request.contextPath}/payroll/slip/${p.payroll_id}">
                                            View Slip
                                        </a>
                                    </td>

                                </tr>

                            </c:forEach>

                            <c:if test="${empty payrolls}">
                                <tr>
                                    <td colspan="9" class="empty-row">
                                        No payroll history found for this employee.
                                    </td>
                                </tr>
                            </c:if>

                        </tbody>

                    </table>

                </div>

            </div>

            <div class="history-actions">

                <a class="btn-back"
                   href="${pageContext.request.contextPath}/payroll/list">
                    Back to Payroll List
                </a>

            </div>

        </div>

    </main>

</div>

</body>
</html>
