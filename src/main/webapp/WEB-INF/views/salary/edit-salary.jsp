
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Salary</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
.salary-form-container {
    max-width: 950px;
    margin: 25px auto;
}

.salary-form-header {
    margin-bottom: 22px;
}

.salary-form-header h2 {
    color: #142B4A;
    font-size: 25px;
    margin-bottom: 7px;
}

.salary-form-header p {
    color: #64748b;
    font-size: 14px;
}

.salary-form-card {
    background: #ffffff;
    padding: 30px;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
    box-shadow: 0 5px 20px rgba(20,43,74,0.07);
}

.form-section-title {
    color: #142B4A;
    font-size: 17px;
    font-weight: 700;
    padding-bottom: 12px;
    margin-bottom: 20px;
    border-bottom: 2px solid #ccfbf1;
}

.salary-form-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group label {
    color: #334155;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 8px;
}

.form-group input {
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

.form-group input:focus {
    border-color: #14B8A6;
    box-shadow: 0 0 0 3px rgba(20,184,166,0.12);
}

.form-group input[readonly] {
    background: #f1f5f9;
    color: #64748b;
    cursor: not-allowed;
}

.error-message {
    color: #dc2626;
    font-size: 12px;
    margin-top: 5px;
}

.form-note {
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

.btn-update {
    background: #14B8A6;
    color: #ffffff;
    border: none;
    padding: 12px 25px;
    border-radius: 7px;
    font-weight: 600;
    cursor: pointer;
    font-size: 14px;
}

.btn-update:hover {
    background: #0f9488;
}

.btn-back {
    background: #142B4A;
    color: #ffffff;
    padding: 12px 25px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
}

.btn-back:hover {
    background: #1e4264;
}

@media(max-width: 650px) {
    .salary-form-grid {
        grid-template-columns: 1fr;
    }

    .salary-form-card {
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

        <div class="salary-form-container">

            <div class="salary-form-header">
                <h2>Edit Salary Details</h2>
                <p>Update employee salary components and deductions.</p>
            </div>

            <div class="salary-form-card">

                <form:form modelAttribute="salary"
                    action="${pageContext.request.contextPath}/salary/update"
                    method="post">

                    <input type="hidden" name="salary_id"
                        value="${salary.salary_id}">

                    <input type="hidden" name="employee_id"
                        value="${salary.employee_id}">

                    <div class="form-section-title">
                        Employee Salary Information
                    </div>

                    <div class="salary-form-grid">

                        <div class="form-group">
                            <label>Employee Name</label>
                            <input type="text"
                                value="${salary.employee_name}" readonly>

                            <form:errors path="employee_id"
                                cssClass="error-message"/>
                        </div>

                        <div class="form-group">
                            <label>Basic Salary (₹)</label>
                            <input type="number" name="basic_salary"
                                value="${salary.basic_salary}"
                                step="0.01" min="0.01" required>

                            <form:errors path="basic_salary"
                                cssClass="error-message"/>
                        </div>

                        <div class="form-group">
                            <label>HRA (₹)</label>
                            <input type="number" name="hra"
                                value="${salary.hra}"
                                step="0.01" min="0" required>

                            <form:errors path="hra"
                                cssClass="error-message"/>
                        </div>

                        <div class="form-group">
                            <label>DA (₹)</label>
                            <input type="number" name="da"
                                value="${salary.da}"
                                step="0.01" min="0" required>

                            <form:errors path="da"
                                cssClass="error-message"/>
                        </div>

                        <div class="form-group">
                            <label>Medical Allowance (₹)</label>
                            <input type="number" name="medical_allowance"
                                value="${salary.medical_allowance}"
                                step="0.01" min="0" required>

                            <form:errors path="medical_allowance"
                                cssClass="error-message"/>
                        </div>

                        <div class="form-group">
                            <label>PF (₹)</label>
                            <input type="number" name="pf"
                                value="${salary.pf}"
                                step="0.01" min="0" required>

                            <form:errors path="pf"
                                cssClass="error-message"/>
                        </div>

                        <div class="form-group">
                            <label>Professional Tax (₹)</label>
                            <input type="number" name="professional_tax"
                                value="${salary.professional_tax}"
                                step="0.01" min="0" required>

                            <form:errors path="professional_tax"
                                cssClass="error-message"/>
                        </div>

                        <div class="form-group">
                            <label>Other Deductions (₹)</label>
                            <input type="number" name="other_deductions"
                                value="${salary.other_deductions}"
                                step="0.01" min="0" required>

                            <form:errors path="other_deductions"
                                cssClass="error-message"/>
                        </div>

                    </div>

                    <div class="form-note">
                        Verify the updated salary values before submitting.
                    </div>

                    <div class="form-actions">

                        <button type="submit" class="btn-update">
                            Update Salary
                        </button>

                        <a href="${pageContext.request.contextPath}/salary/list"
                            class="btn-back">
                            Back to Salary List
                        </a>

                    </div>

                </form:form>

            </div>
        </div>

    </main>
</div>

</body>
</html>
