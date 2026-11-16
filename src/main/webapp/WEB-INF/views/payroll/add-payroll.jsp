
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Payroll</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
.payroll-container {
    max-width: 950px;
    margin: 25px auto;
}

.payroll-heading {
    margin-bottom: 22px;
}

.payroll-heading h2 {
    color: #142B4A;
    font-size: 25px;
    margin-bottom: 7px;
}

.payroll-heading p {
    color: #64748b;
    font-size: 14px;
}

.payroll-card {
    background: #ffffff;
    padding: 30px;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
    box-shadow: 0 5px 20px rgba(20,43,74,0.07);
}

.section-title {
    color: #142B4A;
    font-size: 17px;
    font-weight: 700;
    padding-bottom: 12px;
    margin-bottom: 20px;
    border-bottom: 2px solid #ccfbf1;
}

.payroll-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group.full-width {
    grid-column: 1 / -1;
}

.form-group label {
    color: #334155;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 8px;
}

.form-group input,
.form-group select {
    width: 100%;
    box-sizing: border-box;
    padding: 12px 13px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    font-size: 14px;
    background: #ffffff;
    color: #334155;
    outline: none;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #14B8A6;
    box-shadow: 0 0 0 3px rgba(20,184,166,0.12);
}

.field-error {
    color: #dc2626;
    font-size: 12px;
    margin-top: 5px;
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

.payroll-note {
    background: #f0fdfa;
    border-left: 4px solid #14B8A6;
    padding: 12px 15px;
    margin-top: 22px;
    color: #0f766e;
    font-size: 13px;
    border-radius: 5px;
}

.form-actions {
    display: flex;
    gap: 12px;
    margin-top: 28px;
    padding-top: 20px;
    border-top: 1px solid #e2e8f0;
}

.btn-generate {
    background: #14B8A6;
    color: #ffffff;
    border: none;
    padding: 12px 25px;
    border-radius: 7px;
    font-weight: 600;
    cursor: pointer;
    font-size: 14px;
}

.btn-generate:hover {
    background: #0f9488;
}

.btn-cancel {
    background: #142B4A;
    color: #ffffff;
    padding: 12px 25px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
}

.btn-cancel:hover {
    background: #1e4264;
}

@media(max-width: 650px) {
    .payroll-grid {
        grid-template-columns: 1fr;
    }

    .form-group.full-width {
        grid-column: auto;
    }

    .payroll-card {
        padding: 18px;
    }

    .form-actions {
        flex-direction: column;
    }

    .form-actions a,
    .form-actions button {
        text-align: center;
    }
}
</style>
</head>

<body>

<div class="app-layout">

    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

    <main class="main-content">

        <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

        <div class="payroll-container">

            <div class="payroll-heading">
                <h2>Generate Monthly Payroll</h2>
                <p>Select an employee and salary period to generate payroll.</p>
            </div>

            <div class="payroll-card">

                <c:if test="${not empty success}">
                    <p class="message">${success}</p>
                </c:if>

                <c:if test="${not empty error}">
                    <p class="error">${error}</p>
                </c:if>

                <form:form
                    action="${pageContext.request.contextPath}/payroll/generate"
                    method="post"
                    modelAttribute="payroll">

                    <div class="section-title">
                        Payroll Information
                    </div>

                    <div class="payroll-grid">

                        <div class="form-group full-width">
                            <label>Select Employee</label>

                            <form:select path="employee_id">
                                <form:option value="0">
                                    -- Select Employee --
                                </form:option>

                                <c:forEach var="emp" items="${employees}">
                                    <form:option value="${emp.employee_id}">
                                        ${emp.employee_name} - ${emp.department}
                                    </form:option>
                                </c:forEach>

                            </form:select>

                            <form:errors path="employee_id"
                                cssClass="field-error"/>
                        </div>

                        <div class="form-group">
                            <label>Salary Month</label>

                            <form:select path="salary_month">
                                <form:option value="">
                                    -- Select Month --
                                </form:option>
                                <form:option value="January">January</form:option>
                                <form:option value="February">February</form:option>
                                <form:option value="March">March</form:option>
                                <form:option value="April">April</form:option>
                                <form:option value="May">May</form:option>
                                <form:option value="June">June</form:option>
                                <form:option value="July">July</form:option>
                                <form:option value="August">August</form:option>
                                <form:option value="September">September</form:option>
                                <form:option value="October">October</form:option>
                                <form:option value="November">November</form:option>
                                <form:option value="December">December</form:option>
                            </form:select>

                            <form:errors path="salary_month"
                                cssClass="field-error"/>
                        </div>

                        <div class="form-group">
                            <label>Salary Year</label>

                            <form:input path="salary_year"
                                type="number" min="2020" max="2100"/>

                            <form:errors path="salary_year"
                                cssClass="field-error"/>
                        </div>

                    </div>

                    <div class="payroll-note">
                        Select the correct employee, month and year.
                        The payroll will be generated using the employee's
                        existing salary details.
                    </div>

                    <div class="form-actions">

                        <button type="submit" class="btn-generate">
                            Generate Payroll
                        </button>

                        <a href="${pageContext.request.contextPath}/payroll/list"
                            class="btn-cancel">
                            View Payroll Records
                        </a>

                    </div>

                </form:form>

            </div>
        </div>

    </main>
</div>

</body>
</html>
