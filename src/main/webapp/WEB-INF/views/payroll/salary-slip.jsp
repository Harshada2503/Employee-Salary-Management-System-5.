
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Salary Slip</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
body {
    background: #f8fafc;
}

.slip-container {
    max-width: 850px;
    margin: 30px auto;
    padding: 0 15px;
}

.salary-slip {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    padding: 35px;
    box-shadow: 0 5px 22px rgba(20,43,74,0.08);
}

.slip-header {
    text-align: center;
    border-bottom: 3px solid #14B8A6;
    padding-bottom: 22px;
    margin-bottom: 25px;
}

.slip-brand {
    color: #14B8A6;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 3px;
}

.slip-header h2 {
    color: #142B4A;
    font-size: 25px;
    margin: 10px 0 6px;
}

.slip-header p {
    color: #64748b;
    font-size: 13px;
}

.slip-section {
    margin-top: 25px;
}

.slip-section h3 {
    background: #142B4A;
    color: #ffffff;
    padding: 12px 15px;
    font-size: 15px;
    border-radius: 6px;
    margin-bottom: 0;
}

.slip-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 0;
}

.slip-table td {
    padding: 13px 15px;
    border: 1px solid #e2e8f0;
    font-size: 14px;
    color: #334155;
}

.slip-table td:first-child {
    width: 45%;
    font-weight: 600;
    color: #475569;
    background: #f8fafc;
}

.slip-table td:last-child {
    font-weight: 600;
}

.payment-status {
    display: inline-block;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 12px;
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

.net-salary-row td {
    background: #f0fdfa !important;
    color: #0f766e !important;
    font-size: 17px !important;
    font-weight: 700 !important;
}

.slip-footer {
    text-align: center;
    color: #64748b;
    font-size: 12px;
    margin-top: 35px;
    padding-top: 18px;
    border-top: 1px solid #e2e8f0;
}

.slip-buttons {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 12px;
    margin: 25px 0;
    flex-wrap: wrap;
}

.btn-print {
    background: #14B8A6;
    color: #ffffff;
    border: none;
    padding: 12px 22px;
    border-radius: 7px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
}

.btn-print:hover {
    background: #0f9488;
}

.btn-back {
    background: #142B4A;
    color: #ffffff;
    padding: 12px 22px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
}

.btn-back:hover {
    background: #1e4264;
}

@media(max-width: 600px) {
    .salary-slip {
        padding: 18px;
    }

    .slip-header h2 {
        font-size: 20px;
    }

    .slip-table td {
        padding: 10px;
        font-size: 12px;
    }
}

@media print {
    @page {
        size: A4;
        margin: 15mm;
    }

    body {
        background: #ffffff !important;
        padding: 0 !important;
        margin: 0 !important;
    }

    .slip-container {
        max-width: 100%;
        margin: 0;
        padding: 0;
    }

    .salary-slip {
        border: 1px solid #cbd5e1;
        border-radius: 0;
        box-shadow: none;
        padding: 20px;
    }

    .slip-buttons {
        display: none !important;
    }

    .slip-section h3,
    .net-salary-row td,
    .slip-table td:first-child {
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
    }
}
</style>
</head>

<body>

<div class="slip-container">

    <div class="salary-slip">

        <div class="slip-header">

            <div class="slip-brand">
                EMS
            </div>

            <h2>EMPLOYEE SALARY SLIP</h2>

            <p>Employee Salary Management System</p>

        </div>

        <div class="slip-section">

            <h3>Employee Information</h3>

            <table class="slip-table">

                <tr>
                    <td>Payroll ID</td>
                    <td>${payroll.payroll_id}</td>
                </tr>

                <tr>
                    <td>Employee ID</td>
                    <td>${payroll.employee_id}</td>
                </tr>

                <tr>
                    <td>Employee Name</td>
                    <td>${payroll.employee_name}</td>
                </tr>

                <tr>
                    <td>Salary Month</td>
                    <td>${payroll.salary_month} ${payroll.salary_year}</td>
                </tr>

                <tr>
                    <td>Payment Date</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty payroll.payment_date}">
                                ${payroll.payment_date}
                            </c:when>
                            <c:otherwise>
                                Not Paid
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>

                <tr>
                    <td>Payment Status</td>
                    <td>
                        <c:choose>
                            <c:when test="${payroll.payment_status == 'Paid'}">
                                <span class="payment-status paid">Paid</span>
                            </c:when>
                            <c:otherwise>
                                <span class="payment-status pending">Pending</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>

            </table>

        </div>

        <div class="slip-section">

            <h3>Salary Details</h3>

            <table class="slip-table">

                <tr>
                    <td>Gross Salary</td>
                    <td>₹ ${payroll.gross_salary}</td>
                </tr>

                <tr>
                    <td>Total Deductions</td>
                    <td>₹ ${payroll.total_deductions}</td>
                </tr>

                <tr class="net-salary-row">
                    <td>Net Salary</td>
                    <td>₹ ${payroll.net_salary}</td>
                </tr>

            </table>

        </div>

        <div class="slip-footer">
            This is a computer-generated salary slip.
            No signature is required.
        </div>

    </div>

    <div class="slip-buttons">

        <button type="button" class="btn-print"
            onclick="window.print()">
            Print / Save as PDF
        </button>

        <a class="btn-back"
            href="${pageContext.request.contextPath}/payroll/list">
            Back to Payroll List
        </a>

    </div>

</div>

</body>
</html>
