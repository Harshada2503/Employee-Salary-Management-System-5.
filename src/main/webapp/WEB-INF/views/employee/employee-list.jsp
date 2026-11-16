
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">

    <style>
        .page-heading {
            margin: 25px 0 8px;
            color: #142B4A;
            font-size: 25px;
            font-weight: 700;
        }

        .page-description {
            color: #64748b;
            margin-bottom: 22px;
            font-size: 14px;
        }

        .employee-panel {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 15px rgba(20, 43, 74, 0.06);
        }

        .employee-topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 22px;
        }

        .employee-topbar h3 {
            color: #142B4A;
            font-size: 18px;
        }

        .employee-actions {
            display: flex;
            gap: 7px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .employee-btn {
            display: inline-block;
            padding: 8px 11px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
            transition: 0.2s;
        }

        .add-btn {
            background: #14B8A6;
            color: #ffffff;
            padding: 11px 17px;
        }

        .add-btn:hover {
            background: #0f9488;
        }

        .edit-btn {
            background: #e0f2fe;
            color: #075985;
        }

        .delete-btn {
            background: #fee2e2;
            color: #b91c1c;
        }

        .profile-btn {
            background: #ccfbf1;
            color: #0f766e;
        }

        .activate-btn {
            background: #dcfce7;
            color: #166534;
        }

        .deactivate-btn {
            background: #f1f5f9;
            color: #475569;
        }

        .employee-btn:hover {
            filter: brightness(0.96);
            transform: translateY(-1px);
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e2e8f0;
            border-radius: 9px;
        }

        .employee-table {
            width: 100%;
            min-width: 1450px;
            border-collapse: collapse;
            background: #ffffff;
        }

        .employee-table th {
            background: #142B4A;
            color: #ffffff;
            padding: 14px 11px;
            font-size: 12px;
            font-weight: 600;
            text-align: center;
            white-space: nowrap;
            border: none;
        }

        .employee-table th:first-child {
            border-radius: 8px 0 0 0;
        }

        .employee-table th:last-child {
            border-radius: 0 8px 0 0;
        }

        .employee-table td {
            padding: 13px 11px;
            border-bottom: 1px solid #e9eef5;
            color: #334155;
            text-align: center;
            font-size: 12px;
            white-space: nowrap;
        }

        .employee-table tbody tr:nth-child(even) {
            background: #f8fafc;
        }

        .employee-table tbody tr:hover {
            background: #ecfdf9;
        }

        .employee-id {
            color: #0f766e;
            font-weight: 700;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }

        .status-active {
            background: #dcfce7;
            color: #166534;
        }

        .status-inactive {
            background: #fee2e2;
            color: #b91c1c;
        }

        .message {
            padding: 12px 16px;
            margin-bottom: 16px;
            border-radius: 7px;
            font-size: 13px;
        }

        .success {
            background: #dcfce7;
            color: #166534;
            border-left: 4px solid #16a34a;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            border-left: 4px solid #dc2626;
        }

        .empty {
            padding: 35px !important;
            color: #64748b !important;
            text-align: center;
        }

        .employee-table form {
            display: inline;
            margin: 0;
        }

        @media (max-width: 768px) {
            .employee-panel {
                padding: 14px;
            }

            .employee-topbar {
                align-items: flex-start;
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

        <h2 class="page-heading">Employee Management</h2>
        <p class="page-description">
            Manage employee information, profiles and employment status.
        </p>

        <!-- Success Message -->
        <c:if test="${not empty success}">
            <div class="message success">
                <c:out value="${success}" />
            </div>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="message error">
                <c:out value="${error}" />
            </div>
        </c:if>

        <section class="employee-panel">

            <div class="employee-topbar">
                <h3>Employee Records</h3>

                <a href="${pageContext.request.contextPath}/employee/add"
                   class="employee-btn add-btn">
                    + Add New Employee
                </a>
            </div>

            <div class="table-wrapper">

                <table class="employee-table">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Gender</th>
                            <th>Department</th>
                            <th>Designation</th>
                            <th>Joining Date</th>
                            <th>Basic Salary</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:choose>

                            <c:when test="${not empty employees}">

                                <c:forEach var="emp" items="${employees}">

                                    <tr>

                                        <td class="employee-id">
                                            <c:out value="${emp.employee_id}" />
                                        </td>

                                        <td>
                                            <c:out value="${emp.employee_name}" />
                                        </td>

                                        <td>
                                            <c:out value="${emp.email}" />
                                        </td>

                                        <td>
                                            <c:out value="${emp.phone}" />
                                        </td>

                                        <td>
                                            <c:out value="${emp.gender}" />
                                        </td>

                                        <td>
                                            <c:out value="${emp.department}" />
                                        </td>

                                        <td>
                                            <c:out value="${emp.designation}" />
                                        </td>

                                        <td>
                                            <c:out value="${emp.joining_date}" />
                                        </td>

                                        <td>
                                            ₹ <c:out value="${emp.basic_salary}" />
                                        </td>

                                        <!-- Employee Status -->
                                        <td>
                                            <c:choose>

                                                <c:when test="${emp.employee_status == 'Active'}">
                                                    <span class="status-badge status-active">
                                                        Active
                                                    </span>
                                                </c:when>

                                                <c:otherwise>
                                                    <span class="status-badge status-inactive">
                                                        Inactive
                                                    </span>
                                                </c:otherwise>

                                            </c:choose>
                                        </td>

                                        <!-- Employee Actions -->
                                        <td>
                                            <div class="employee-actions">

                                                <a class="employee-btn edit-btn"
                                                   href="${pageContext.request.contextPath}/employee/edit/${emp.employee_id}">
                                                    Edit
                                                </a>

                                                <form action="${pageContext.request.contextPath}/employee/delete/${emp.employee_id}"
                                                      method="post"
                                                      onsubmit="return confirm('Are you sure you want to delete this employee?');">

                                                    <button type="submit"
                                                            class="employee-btn delete-btn">
                                                        Delete
                                                    </button>
                                                </form>

                                                <a class="employee-btn profile-btn"
                                                   href="${pageContext.request.contextPath}/employee/profile/${emp.employee_id}">
                                                    View Profile
                                                </a>

                                                <!-- Activate Employee -->
                                                <c:if test="${emp.employee_status == 'Inactive'}">

                                                    <form action="${pageContext.request.contextPath}/employee/status/${emp.employee_id}"
                                                          method="post">

                                                        <input type="hidden"
                                                               name="status"
                                                               value="Active" />

                                                        <button type="submit"
                                                                class="employee-btn activate-btn">
                                                            Activate
                                                        </button>
                                                    </form>

                                                </c:if>

                                                <!-- Deactivate Employee -->
                                                <c:if test="${emp.employee_status == 'Active'}">

                                                    <form action="${pageContext.request.contextPath}/employee/status/${emp.employee_id}"
                                                          method="post"
                                                          onsubmit="return confirm('Are you sure you want to deactivate this employee?');">

                                                        <input type="hidden"
                                                               name="status"
                                                               value="Inactive" />

                                                        <button type="submit"
                                                                class="employee-btn deactivate-btn">
                                                            Deactivate
                                                        </button>
                                                    </form>

                                                </c:if>

                                            </div>
                                        </td>

                                    </tr>

                                </c:forEach>

                            </c:when>

                            <c:otherwise>

                                <tr>
                                    <td colspan="11" class="empty">
                                        No employee records found.
                                    </td>
                                </tr>

                            </c:otherwise>

                        </c:choose>

                    </tbody>

                </table>

            </div>

        </section>

    </main>

</div>

</body>
</html>
