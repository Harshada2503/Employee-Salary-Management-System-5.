
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department Management</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
body {
    background: #f8fafc;
}

.department-container {
    padding: 25px 0;
}

.page-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    flex-wrap: wrap;
    margin-bottom: 22px;
}

.page-heading h2 {
    color: #142B4A;
    font-size: 25px;
    margin-bottom: 6px;
}

.page-heading p {
    color: #64748b;
    font-size: 14px;
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
}

.add-btn:hover {
    background: #0f9488;
    color: #ffffff;
}

.message {
    padding: 13px 16px;
    border-radius: 7px;
    margin-bottom: 18px;
    font-size: 13px;
    font-weight: 600;
}

.error-message {
    background: #fee2e2;
    color: #b91c1c;
    border: 1px solid #fecaca;
}

.success-message {
    background: #dcfce7;
    color: #166534;
    border: 1px solid #bbf7d0;
}

.department-card {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    padding: 22px;
    box-shadow: 0 3px 12px rgba(20,43,74,0.04);
}

.department-card h3 {
    color: #142B4A;
    font-size: 17px;
    margin-bottom: 18px;
}

.table-wrapper {
    width: 100%;
    overflow-x: auto;
}

.department-table {
    width: 100%;
    min-width: 750px;
    border-collapse: collapse;
}

.department-table th {
    background: #142B4A;
    color: #ffffff;
    padding: 14px 13px;
    text-align: left;
    font-size: 13px;
    white-space: nowrap;
}

.department-table td {
    padding: 14px 13px;
    border-bottom: 1px solid #e2e8f0;
    color: #334155;
    font-size: 13px;
}

.department-table tbody tr:nth-child(even) {
    background: #f8fafc;
}

.department-table tbody tr:hover {
    background: #f0fdfa;
}

.department-name {
    color: #142B4A;
    font-weight: 700;
}

.status-badge {
    display: inline-block;
    padding: 6px 12px;
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

.action-buttons {
    display: flex;
    align-items: center;
    gap: 9px;
}

.edit-btn {
    display: inline-block;
    background: #ccfbf1;
    color: #0f766e;
    padding: 7px 12px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 12px;
    font-weight: 700;
}

.edit-btn:hover {
    background: #14B8A6;
    color: #ffffff;
}

.delete-btn {
    background: #fee2e2;
    color: #b91c1c;
    border: none;
    padding: 7px 12px;
    border-radius: 5px;
    font-size: 12px;
    font-weight: 700;
    cursor: pointer;
}

.delete-btn:hover {
    background: #dc2626;
    color: #ffffff;
}

.delete-form {
    display: inline;
    margin: 0;
}

.empty-row {
    text-align: center;
    padding: 30px !important;
    color: #64748b !important;
}

.back-link {
    display: inline-block;
    margin-top: 22px;
    background: #142B4A;
    color: #ffffff;
    padding: 11px 18px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 600;
}

.back-link:hover {
    background: #1e4264;
    color: #ffffff;
}

@media(max-width: 600px) {
    .page-heading h2 {
        font-size: 21px;
    }

    .department-card {
        padding: 14px;
    }
}
</style>
</head>

<body>

<div class="app-layout">

    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

    <main class="main-content">

        <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

        <div class="department-container">

            <c:if test="${param.error == 'assigned'}">
                <div class="message error-message">
                    Cannot delete this department because employees are assigned to it.
                </div>
            </c:if>

            <c:if test="${param.deleted == 'true'}">
                <div class="message success-message">
                    Department deleted successfully!
                </div>
            </c:if>

            <div class="page-heading">

                <div>
                    <h2>Department Management</h2>
                    <p>Manage departments and their current status.</p>
                </div>

                <a class="add-btn"
                   href="${pageContext.request.contextPath}/department/add">
                    + Add Department
                </a>

            </div>

            <div class="department-card">

                <h3>Department List</h3>

                <div class="table-wrapper">

                    <table class="department-table">

                        <thead>
                            <tr>
                                <th>Department ID</th>
                                <th>Department Name</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="d" items="${departments}">

                                <tr>

                                    <td>${d.department_id}</td>

                                    <td class="department-name">
                                        ${d.department_name}
                                    </td>

                                    <td>${d.description}</td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${d.department_status == 'Active'}">
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

                                    <td>

                                        <div class="action-buttons">

                                            <a class="edit-btn"
                                               href="${pageContext.request.contextPath}/department/edit/${d.department_id}">
                                                Edit
                                            </a>

                                            <form class="delete-form"
                                                  action="${pageContext.request.contextPath}/department/delete/${d.department_id}"
                                                  method="post"
                                                  onsubmit="return confirm('Are you sure you want to delete this department?');">

                                                <button type="submit"
                                                        class="delete-btn">
                                                    Delete
                                                </button>

                                            </form>

                                        </div>

                                    </td>

                                </tr>

                            </c:forEach>

                            <c:if test="${empty departments}">
                                <tr>
                                    <td colspan="5" class="empty-row">
                                        No departments found.
                                    </td>
                                </tr>
                            </c:if>

                        </tbody>

                    </table>

                </div>

            </div>

            <a class="back-link"
               href="${pageContext.request.contextPath}/">
                Back to Dashboard
            </a>

        </div>

    </main>

</div>

</body>
</html>
