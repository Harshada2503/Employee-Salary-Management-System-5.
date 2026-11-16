
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payroll List</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
.payroll-page {
    width: 100%;
    margin: 25px auto;
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

.payroll-card {
    background: #ffffff;
    padding: 25px;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
    box-shadow: 0 5px 20px rgba(20,43,74,0.06);
}

.message {
    background: #dcfce7;
    color: #166534;
    border-left: 4px solid #16a34a;
    padding: 12px 15px;
    border-radius: 5px;
    margin-bottom: 15px;
}

.error {
    background: #fee2e2;
    color: #991b1b;
    border-left: 4px solid #dc2626;
    padding: 12px 15px;
    border-radius: 5px;
    margin-bottom: 15px;
}

.toolbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
    flex-wrap: wrap;
    gap: 12px;
}

.toolbar h3 {
    color: #142B4A;
    font-size: 17px;
}

.add-btn {
    display: inline-block;
    padding: 11px 18px;
    background: #14B8A6;
    color: #ffffff;
    text-decoration: none;
    border-radius: 7px;
    font-size: 13px;
    font-weight: 600;
}

.add-btn:hover {
    background: #0f9488;
}

.table-wrapper {
    width: 100%;
    overflow-x: auto;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
}

table {
    width: 100%;
    min-width: 1500px;
    border-collapse: collapse;
    background: #ffffff;
}

th {
    background: #142B4A;
    color: #ffffff;
    padding: 14px 12px;
    font-size: 13px;
    font-weight: 600;
    white-space: nowrap;
    text-align: center;
}

td {
    padding: 13px 12px;
    border-bottom: 1px solid #e2e8f0;
    color: #334155;
    font-size: 13px;
    text-align: center;
    white-space: nowrap;
}

tbody tr:nth-child(even) {
    background: #f8fafc;
}

tbody tr:hover {
    background: #f0fdfa;
}

.salary-amount {
    color: #142B4A;
    font-weight: 600;
}

.net-amount {
    color: #0f766e;
    font-weight: 700;
}

.status-paid {
    display: inline-block;
    background: #dcfce7;
    color: #166534;
    padding: 5px 11px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
}

.status-pending {
    display: inline-block;
    background: #fef3c7;
    color: #92400e;
    padding: 5px 11px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
}

.status-form {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 7px;
}

.status-form select {
    padding: 8px;
    border: 1px solid #cbd5e1;
    border-radius: 6px;
    background: #ffffff;
    font-size: 12px;
}

.update-btn {
    padding: 8px 12px;
    background: #142B4A;
    color: #ffffff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 12px;
}

.update-btn:hover {
    background: #1e4264;
}

.action-link {
    color: #0f766e;
    text-decoration: none;
    font-weight: 600;
}

.action-link:hover {
    text-decoration: underline;
}

.empty-message {
    text-align: center;
    padding: 25px;
    color: #64748b;
}

.bottom-actions {
    margin-top: 20px;
}

.dashboard-link {
    display: inline-block;
    color: #142B4A;
    text-decoration: none;
    font-weight: 600;
    font-size: 14px;
}

.dashboard-link:hover {
    color: #0f9488;
}

@media(max-width: 650px) {
    .payroll-card {
        padding: 15px;
    }

    .toolbar {
        align-items: flex-start;
        flex-direction: column;
    }
}
</style>
</head>

<body>

<div class="app-layout">

    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

    <main class="main-content">

        <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

        <div class="payroll-page">

            <div class="page-heading">
                <h2>Employee Payroll Records</h2>
                <p>View and manage employee monthly payroll payments.</p>
            </div>

            <div class="payroll-card">

                <c:if test="${not empty success}">
                    <p class="message">${success}</p>
                </c:if>

                <c:if test="${not empty error}">
                    <p class="error">${error}</p>
                </c:if>

                <div class="toolbar">
                    <h3>Payroll Details</h3>

                    <a class="add-btn"
                       href="${pageContext.request.contextPath}/payroll/add">
                        + Generate New Payroll
                    </a>
                </div>

                <div class="table-wrapper">

                    <table>

                        <thead>
                            <tr>
                                <th>Payroll ID</th>
                                <th>Employee ID</th>
                                <th>Employee Name</th>
                                <th>Month</th>
                                <th>Year</th>
                                <th>Gross Salary</th>
                                <th>Total Deductions</th>
                                <th>Net Salary</th>
                                <th>Payment Date</th>
                                <th>Payment Status</th>
                                <th>Update Status</th>
                                <th>Salary Slip</th>
                                <th>Payroll History</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="p" items="${payrolls}">

                                <tr>

                                    <td>${p.payroll_id}</td>

                                    <td>${p.employee_id}</td>

                                    <td>${p.employee_name}</td>

                                    <td>${p.salary_month}</td>

                                    <td>${p.salary_year}</td>

                                    <td class="salary-amount">
                                        ₹ ${p.gross_salary}
                                    </td>

                                    <td>
                                        ₹ ${p.total_deductions}
                                    </td>

                                    <td class="net-amount">
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
                                                <span class="status-paid">Paid</span>
                                            </c:when>

                                            <c:otherwise>
                                                <span class="status-pending">Pending</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <form class="status-form"
                                            action="${pageContext.request.contextPath}/payroll/update-status"
                                            method="post">

                                            <input type="hidden"
                                                name="payroll_id"
                                                value="${p.payroll_id}">

                                            <select name="payment_status" required>

                                                <option value="Pending"
                                                    ${p.payment_status == 'Pending' ? 'selected' : ''}>
                                                    Pending
                                                </option>

                                                <option value="Paid"
                                                    ${p.payment_status == 'Paid' ? 'selected' : ''}>
                                                    Paid
                                                </option>

                                            </select>

                                            <button type="submit" class="update-btn">
                                                Update
                                            </button>

                                        </form>
                                    </td>

                                    <td>
                                        <a class="action-link"
                                            href="${pageContext.request.contextPath}/payroll/slip/${p.payroll_id}">
                                            View Slip
                                        </a>
                                    </td>

                                    <td>
                                        <a class="action-link"
                                            href="${pageContext.request.contextPath}/payroll/history/${p.employee_id}">
                                            View History
                                        </a>
                                    </td>

                                </tr>

                            </c:forEach>

                            <c:if test="${empty payrolls}">
                                <tr>
                                    <td colspan="13" class="empty-message">
                                        No payroll records found.
                                    </td>
                                </tr>
                            </c:if>

                        </tbody>

                    </table>

                </div>

                <div class="bottom-actions">
                    <a class="dashboard-link"
                       href="${pageContext.request.contextPath}/dashboard">
                        ← Back to Dashboard
                    </a>
                </div>

            </div>

        </div>

    </main>

</div>

</body>
</html>
