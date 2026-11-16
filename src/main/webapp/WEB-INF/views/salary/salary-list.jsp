
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Salary List</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">

    <style>
        .page-heading {
            color: #142B4A;
            font-size: 25px;
            font-weight: 700;
            margin: 25px 0 8px;
        }

        .page-description {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 22px;
        }

        .salary-panel {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 15px rgba(20, 43, 74, 0.05);
        }

        .panel-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 20px;
        }

        .panel-header h3 {
            color: #142B4A;
            font-size: 18px;
        }

        .add-btn {
            display: inline-block;
            background: #14B8A6;
            color: #ffffff;
            padding: 11px 18px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: 0.2s;
        }

        .add-btn:hover {
            background: #0f9488;
        }

        .message {
            padding: 12px 15px;
            margin-bottom: 15px;
            border-radius: 7px;
            background: #dcfce7;
            color: #166534;
            font-size: 13px;
            border: 1px solid #bbf7d0;
        }

        .error {
            padding: 12px 15px;
            margin-bottom: 15px;
            border-radius: 7px;
            background: #fee2e2;
            color: #b91c1c;
            font-size: 13px;
            border: 1px solid #fecaca;
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e2e8f0;
            border-radius: 9px;
        }

        .salary-table {
            width: 100%;
            min-width: 1550px;
            border-collapse: collapse;
        }

        .salary-table th {
            background: #142B4A;
            color: #ffffff;
            padding: 14px 12px;
            font-size: 12px;
            font-weight: 600;
            text-align: center;
            white-space: nowrap;
        }

        .salary-table td {
            padding: 13px 12px;
            border-bottom: 1px solid #e2e8f0;
            color: #334155;
            font-size: 12px;
            text-align: center;
            white-space: nowrap;
        }

        .salary-table tbody tr:nth-child(even) {
            background: #f8fafc;
        }

        .salary-table tbody tr:hover {
            background: #ecfdf5;
        }

        .salary-table .net-salary {
            color: #0f766e;
            font-weight: 700;
        }

        .salary-table .gross-salary {
            color: #142B4A;
            font-weight: 600;
        }

        .edit-btn,
        .delete-btn {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 5px;
            font-size: 11px;
            font-weight: 600;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }

        .edit-btn {
            background: #ccfbf1;
            color: #0f766e;
            margin-right: 4px;
        }

        .edit-btn:hover {
            background: #99f6e4;
        }

        .delete-btn {
            background: #fee2e2;
            color: #b91c1c;
        }

        .delete-btn:hover {
            background: #fecaca;
        }

        .empty-row {
            padding: 30px !important;
            color: #64748b !important;
            text-align: center !important;
        }

        .bottom-actions {
            margin-top: 22px;
        }

        .dashboard-btn {
            display: inline-block;
            padding: 10px 17px;
            background: #142B4A;
            color: #ffffff;
            border-radius: 7px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .dashboard-btn:hover {
            background: #1e4264;
        }

        @media (max-width: 600px) {
            .salary-panel {
                padding: 15px;
            }

            .page-heading {
                font-size: 21px;
            }
        }
    </style>
</head>

<body>

<div class="app-layout">

    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

    <main class="main-content">

        <!-- Navbar -->
        <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

        <h2 class="page-heading">Salary Management</h2>

        <p class="page-description">
            Manage employee salary structures, allowances and deductions.
        </p>

        <section class="salary-panel">

            <!-- Success Message -->
            <c:if test="${not empty success}">
                <div class="message">
                    ${success}
                </div>
            </c:if>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="error">
                    ${error}
                </div>
            </c:if>

            <div class="panel-header">

                <h3>Employee Salary Records</h3>

                <a class="add-btn"
                   href="${pageContext.request.contextPath}/salary/add">
                    + Add Salary
                </a>

            </div>

            <!-- Salary Table -->
            <div class="table-container">

                <table class="salary-table">

                    <thead>
                        <tr>
                            <th>Salary ID</th>
                            <th>Employee ID</th>
                            <th>Employee Name</th>
                            <th>Department</th>
                            <th>Designation</th>
                            <th>Basic Salary</th>
                            <th>HRA</th>
                            <th>DA</th>
                            <th>Medical</th>
                            <th>PF</th>
                            <th>Professional Tax</th>
                            <th>Other Deductions</th>
                            <th>Gross Salary</th>
                            <th>Total Deductions</th>
                            <th>Net Salary</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach var="s" items="${salaries}">

                            <tr>

                                <td>${s.salary_id}</td>

                                <td>${s.employee_id}</td>

                                <td>${s.employee_name}</td>

                                <td>${s.department}</td>

                                <td>${s.designation}</td>

                                <td>₹ ${s.basic_salary}</td>

                                <td>₹ ${s.hra}</td>

                                <td>₹ ${s.da}</td>

                                <td>₹ ${s.medical_allowance}</td>

                                <td>₹ ${s.pf}</td>

                                <td>₹ ${s.professional_tax}</td>

                                <td>₹ ${s.other_deductions}</td>

                                <td class="gross-salary">
                                    ₹ ${s.grossSalary}
                                </td>

                                <td>
                                    ₹ ${s.totalDeductions}
                                </td>

                                <td class="net-salary">
                                    ₹ ${s.netSalary}
                                </td>

                                <td>

                                    <a class="edit-btn"
                                       href="${pageContext.request.contextPath}/salary/edit/${s.employee_id}">
                                        Edit
                                    </a>

                                    <form
                                        action="${pageContext.request.contextPath}/salary/delete/${s.employee_id}"
                                        method="post"
                                        style="display:inline;"
                                        onsubmit="return confirm('Are you sure you want to delete this salary structure?');">

                                        <button type="submit"
                                                class="delete-btn">
                                            Delete
                                        </button>

                                    </form>

                                </td>

                            </tr>

                        </c:forEach>

                        <c:if test="${empty salaries}">
                            <tr>
                                <td colspan="16" class="empty-row">
                                    No salary records found.
                                    Click Add Salary to create a new record.
                                </td>
                            </tr>
                        </c:if>

                    </tbody>

                </table>

            </div>

            <div class="bottom-actions">

                <a class="dashboard-btn"
                   href="${pageContext.request.contextPath}/dashboard">
                    Back to Dashboard
                </a>

            </div>

        </section>

    </main>

</div>

</body>
</html>
