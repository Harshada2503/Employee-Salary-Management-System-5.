
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Department</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
body {
    background: #f8fafc;
}

.department-container {
    max-width: 750px;
    margin: 30px auto;
    padding: 0 15px;
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

.form-card {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 4px 15px rgba(20,43,74,0.05);
}

.form-card h3 {
    color: #142B4A;
    font-size: 17px;
    margin-bottom: 22px;
    padding-bottom: 14px;
    border-bottom: 2px solid #14B8A6;
}

.form-group {
    margin-bottom: 21px;
}

.form-group label {
    display: block;
    color: #334155;
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 8px;
}

.form-control {
    width: 100%;
    padding: 12px 13px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    font-size: 14px;
    color: #334155;
    background: #ffffff;
    box-sizing: border-box;
    outline: none;
    font-family: Arial, sans-serif;
}

.form-control:focus {
    border-color: #14B8A6;
    box-shadow: 0 0 0 3px rgba(20,184,166,0.12);
}

textarea.form-control {
    resize: vertical;
    min-height: 110px;
}

.field-error {
    display: block;
    color: #dc2626;
    font-size: 12px;
    margin-top: 6px;
}

.duplicate-error {
    background: #fee2e2;
    color: #b91c1c;
    border: 1px solid #fecaca;
    padding: 12px 15px;
    border-radius: 7px;
    margin-bottom: 20px;
    font-size: 13px;
    font-weight: 600;
}

.form-actions {
    display: flex;
    gap: 12px;
    margin-top: 28px;
    flex-wrap: wrap;
}

.btn-update {
    background: #14B8A6;
    color: #ffffff;
    border: none;
    padding: 12px 22px;
    border-radius: 7px;
    font-size: 13px;
    font-weight: 700;
    cursor: pointer;
}

.btn-update:hover {
    background: #0f9488;
}

.btn-cancel {
    background: #e2e8f0;
    color: #334155;
    padding: 12px 22px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 600;
}

.btn-cancel:hover {
    background: #cbd5e1;
}

@media(max-width: 600px) {
    .form-card {
        padding: 20px;
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

        <div class="department-container">

            <div class="page-heading">
                <h2>Edit Department</h2>
                <p>Update department information and status.</p>
            </div>

            <div class="form-card">

                <h3>Department Information</h3>

                <c:if test="${not empty duplicateError}">
                    <div class="duplicate-error">
                        ${duplicateError}
                    </div>
                </c:if>

                <form:form
                    action="${pageContext.request.contextPath}/department/update"
                    method="post"
                    modelAttribute="department">

                    <form:hidden path="department_id"/>

                    <div class="form-group">

                        <label>Department Name</label>

                        <form:input
                            path="department_name"
                            cssClass="form-control"
                            placeholder="Enter department name"
                            maxlength="50"/>

                        <form:errors
                            path="department_name"
                            cssClass="field-error"/>

                    </div>

                    <div class="form-group">

                        <label>Description</label>

                        <form:textarea
                            path="description"
                            cssClass="form-control"
                            rows="4"
                            placeholder="Enter department description"
                            maxlength="255"/>

                        <form:errors
                            path="description"
                            cssClass="field-error"/>

                    </div>

                    <div class="form-group">

                        <label>Department Status</label>

                        <form:select
                            path="department_status"
                            cssClass="form-control">

                            <form:option value="Active">
                                Active
                            </form:option>

                            <form:option value="Inactive">
                                Inactive
                            </form:option>

                        </form:select>

                        <form:errors
                            path="department_status"
                            cssClass="field-error"/>

                    </div>

                    <div class="form-actions">

                        <button type="submit" class="btn-update">
                            Update Department
                        </button>

                        <a class="btn-cancel"
                           href="${pageContext.request.contextPath}/department/list">
                            Cancel
                        </a>

                    </div>

                </form:form>

            </div>

        </div>

    </main>

</div>

</body>
</html>
