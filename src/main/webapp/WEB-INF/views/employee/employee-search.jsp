
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Search</title>

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
            font-size: 14px;
            margin-bottom: 22px;
        }

        .search-panel {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 15px rgba(20, 43, 74, 0.05);
        }

        .filter-heading {
            color: #142B4A;
            font-size: 17px;
            font-weight: 700;
            margin-bottom: 18px;
        }

        .search-form {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr auto auto;
            gap: 12px;
            align-items: end;
        }

        .filter-group label {
            display: block;
            color: #475569;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .filter-group input,
        .filter-group select {
            width: 100%;
            height: 42px;
            padding: 0 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            background: #ffffff;
            color: #142B4A;
            font-size: 13px;
            outline: none;
        }

        .filter-group input:focus,
        .filter-group select:focus {
            border-color: #14B8A6;
            box-shadow: 0 0 0 3px rgba(20, 184, 166, 0.12);
        }

        .search-btn,
        .reset-btn {
            height: 42px;
            padding: 0 20px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            white-space: nowrap;
        }

        .search-btn {
            background: #14B8A6;
            color: #ffffff;
            border: none;
        }

        .search-btn:hover {
            background: #0f9488;
        }

        .reset-btn {
            background: #f1f5f9;
            color: #142B4A;
            border: 1px solid #cbd5e1;
        }

        .reset-btn:hover {
            background: #e2e8f0;
        }

        .results-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            margin: 28px 0 15px;
        }

        .results-heading h3 {
            color: #142B4A;
            font-size: 18px;
        }

        .table-container {
            overflow-x: auto;
            border: 1px solid #e2e8f0;
            border-radius: 9px;
        }

        .employee-table {
            width: 100%;
            min-width: 850px;
            border-collapse: collapse;
        }

        .employee-table th {
            background: #142B4A;
            color: #ffffff;
            padding: 14px 13px;
            text-align: left;
            font-size: 12px;
            font-weight: 600;
            white-space: nowrap;
        }

        .employee-table td {
            padding: 13px;
            border-bottom: 1px solid #e2e8f0;
            color: #334155;
            font-size: 13px;
        }

        .employee-table tbody tr:nth-child(even) {
            background: #f8fafc;
        }

        .employee-table tbody tr:hover {
            background: #ecfdf5;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }

        .active-status {
            background: #dcfce7;
            color: #166534;
        }

        .inactive-status {
            background: #fee2e2;
            color: #b91c1c;
        }

        .empty-row {
            text-align: center !important;
            padding: 30px !important;
            color: #64748b !important;
        }

        .bottom-actions {
            margin-top: 22px;
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .bottom-actions a {
            text-decoration: none;
            padding: 10px 16px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
        }

        .back-link {
            background: #142B4A;
            color: #ffffff;
        }

        .dashboard-link {
            background: #ccfbf1;
            color: #0f766e;
        }

        @media (max-width: 1050px) {
            .search-form {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 600px) {
            .search-form {
                grid-template-columns: 1fr;
            }

            .search-panel {
                padding: 17px;
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

        <h2 class="page-heading">Employee Search & Filter</h2>

        <p class="page-description">
            Search employees and filter records by department and employment status.
        </p>

        <!-- Search and Filter Panel -->
        <section class="search-panel">

            <h3 class="filter-heading">Search Filters</h3>

            <form class="search-form"
                  action="${pageContext.request.contextPath}/employee/search"
                  method="get">

                <div class="filter-group">
                    <label>Employee Name or ID</label>
                    <input type="text"
                           name="keyword"
                           placeholder="Enter employee name or ID"
                           value="${keyword}">
                </div>

                <div class="filter-group">
                    <label>Department</label>

                    <select name="department">
                        <option value="">All Departments</option>

                        <option value="IT"
                            ${selectedDepartment == 'IT' ? 'selected' : ''}>
                            IT
                        </option>

                        <option value="HR"
                            ${selectedDepartment == 'HR' ? 'selected' : ''}>
                            HR
                        </option>

                        <option value="Finance"
                            ${selectedDepartment == 'Finance' ? 'selected' : ''}>
                            Finance
                        </option>

                        <option value="Sales"
                            ${selectedDepartment == 'Sales' ? 'selected' : ''}>
                            Sales
                        </option>

                        <option value="Admin"
                            ${selectedDepartment == 'Admin' ? 'selected' : ''}>
                            Admin
                        </option>
                    </select>
                </div>

                <div class="filter-group">
                    <label>Employee Status</label>

                    <select name="status">
                        <option value="">All Status</option>

                        <option value="Active"
                            ${selectedStatus == 'Active' ? 'selected' : ''}>
                            Active
                        </option>

                        <option value="Inactive"
                            ${selectedStatus == 'Inactive' ? 'selected' : ''}>
                            Inactive
                        </option>
                    </select>
                </div>

                <button type="submit" class="search-btn">
                    Search
                </button>

                <a href="${pageContext.request.contextPath}/employee/search"
                   class="reset-btn">
                    Reset
                </a>

            </form>

        </section>

        <!-- Search Results -->
        <div class="results-heading">
            <h3>Search Results</h3>
        </div>

        <div class="table-container">

            <table class="employee-table">

                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Department</th>
                        <th>Designation</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="e" items="${employees}">
                        <tr>
                            <td>${e.employee_id}</td>
                            <td>${e.employee_name}</td>
                            <td>${e.email}</td>
                            <td>${e.phone}</td>
                            <td>${e.department}</td>
                            <td>${e.designation}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${e.employee_status == 'Active'}">
                                        <span class="status-badge active-status">
                                            Active
                                        </span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="status-badge inactive-status">
                                            Inactive
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty employees}">
                        <tr>
                            <td colspan="7" class="empty-row">
                                No employees found. Try changing your search filters.
                            </td>
                        </tr>
                    </c:if>

                </tbody>

            </table>

        </div>

        <!-- Bottom Navigation -->
        <div class="bottom-actions">

            <a href="${pageContext.request.contextPath}/employee/list"
               class="back-link">
                Back to Employee List
            </a>

            <a href="${pageContext.request.contextPath}/dashboard"
               class="dashboard-link">
                Back to Dashboard
            </a>

        </div>

    </main>

</div>

</body>
</html>
