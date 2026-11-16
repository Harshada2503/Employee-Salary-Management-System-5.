
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee</title>

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

        .employee-form-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0 4px 15px rgba(20, 43, 74, 0.06);
            max-width: 1000px;
        }

        .form-card-heading {
            color: #142B4A;
            font-size: 18px;
            font-weight: 700;
            padding-bottom: 15px;
            margin-bottom: 25px;
            border-bottom: 2px solid #e2e8f0;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 22px 25px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            color: #142B4A;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .required-mark {
            color: #dc2626;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            background: #ffffff;
            color: #334155;
            font-size: 13px;
            outline: none;
            transition: 0.2s;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #14B8A6;
            box-shadow: 0 0 0 3px rgba(20, 184, 166, 0.12);
        }

        .form-group input::placeholder {
            color: #94a3b8;
        }

        .form-group input[readonly] {
            background: #f1f5f9;
            color: #64748b;
        }

        .error-message {
            color: #dc2626;
            font-size: 12px;
            margin-top: 6px;
        }

        .form-buttons {
            display: flex;
            justify-content: flex-start;
            gap: 12px;
            margin-top: 30px;
            padding-top: 22px;
            border-top: 1px solid #e2e8f0;
            flex-wrap: wrap;
        }

        .form-btn {
            display: inline-block;
            padding: 11px 21px;
            border: none;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: 0.2s;
        }

        .update-btn {
            background: #14B8A6;
            color: #ffffff;
        }

        .update-btn:hover {
            background: #0f9488;
        }

        .reset-btn {
            background: #142B4A;
            color: #ffffff;
        }

        .reset-btn:hover {
            background: #1e4264;
        }

        .back-btn {
            background: #f1f5f9;
            color: #142B4A;
            border: 1px solid #cbd5e1;
        }

        .back-btn:hover {
            background: #e2e8f0;
        }

        @media (max-width: 700px) {
            .employee-form-card {
                padding: 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 17px;
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

        <h2 class="page-heading">Edit Employee</h2>

        <p class="page-description">
            Update employee information and employment details.
        </p>

        <section class="employee-form-card">

            <h3 class="form-card-heading">Employee Information</h3>

            <form:form modelAttribute="employee"
                       action="${pageContext.request.contextPath}/employee/update"
                       method="post">

                <input type="hidden"
                       name="employee_id"
                       value="${employee.employee_id}">

                <div class="form-grid">

                    <!-- Employee Name -->
                    <div class="form-group">
                        <label>Employee Name <span class="required-mark">*</span></label>

                        <input type="text"
                               name="employee_name"
                               value="${employee.employee_name}"
                               maxlength="100"
                               placeholder="Enter employee name"
                               required>

                        <form:errors path="employee_name"
                                     cssClass="error-message"/>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label>Email Address <span class="required-mark">*</span></label>

                        <input type="email"
                               name="email"
                               value="${employee.email}"
                               maxlength="100"
                               placeholder="Enter email address"
                               required>

                        <form:errors path="email"
                                     cssClass="error-message"/>
                    </div>

                    <!-- Phone -->
                    <div class="form-group">
                        <label>Phone Number <span class="required-mark">*</span></label>

                        <input type="tel"
                               name="phone"
                               value="${employee.phone}"
                               maxlength="10"
                               pattern="[6-9][0-9]{9}"
                               title="Enter a valid 10-digit Indian mobile number"
                               placeholder="Enter phone number"
                               required>

                        <form:errors path="phone"
                                     cssClass="error-message"/>
                    </div>

                    <!-- Gender -->
                    <div class="form-group">
                        <label>Gender <span class="required-mark">*</span></label>

                        <select name="gender" required>

                            <option value="Male"
                                ${employee.gender == 'Male' ? 'selected' : ''}>
                                Male
                            </option>

                            <option value="Female"
                                ${employee.gender == 'Female' ? 'selected' : ''}>
                                Female
                            </option>

                            <option value="Other"
                                ${employee.gender == 'Other' ? 'selected' : ''}>
                                Other
                            </option>

                        </select>

                        <form:errors path="gender"
                                     cssClass="error-message"/>
                    </div>

                    <!-- Department -->
                    <div class="form-group">
                        <label>Department <span class="required-mark">*</span></label>

                        <input type="text"
                               name="department"
                               value="${employee.department}"
                               maxlength="50"
                               placeholder="Enter department"
                               required>

                        <form:errors path="department"
                                     cssClass="error-message"/>
                    </div>

                    <!-- Designation -->
                    <div class="form-group">
                        <label>Designation <span class="required-mark">*</span></label>

                        <input type="text"
                               name="designation"
                               value="${employee.designation}"
                               maxlength="50"
                               placeholder="Enter designation"
                               required>

                        <form:errors path="designation"
                                     cssClass="error-message"/>
                    </div>

                    <!-- Joining Date -->
                    <div class="form-group">
                        <label>Joining Date <span class="required-mark">*</span></label>

                        <input type="date"
                               name="joining_date"
                               value="${employee.joining_date}"
                               required>

                        <form:errors path="joining_date"
                                     cssClass="error-message"/>
                    </div>

                    <!-- Basic Salary -->
                    <div class="form-group">
                        <label>Basic Salary (₹) <span class="required-mark">*</span></label>

                        <input type="number"
                               name="basic_salary"
                               value="${employee.basic_salary}"
                               min="0.01"
                               step="0.01"
                               placeholder="Enter basic salary"
                               required>

                        <form:errors path="basic_salary"
                                     cssClass="error-message"/>
                    </div>

                    <!-- Employee Status -->
                    <div class="form-group">
                        <label>Employee Status <span class="required-mark">*</span></label>

                        <select name="employee_status" required>

                            <option value="Active"
                                ${employee.employee_status == 'Active' ? 'selected' : ''}>
                                Active
                            </option>

                            <option value="Inactive"
                                ${employee.employee_status == 'Inactive' ? 'selected' : ''}>
                                Inactive
                            </option>

                        </select>
                    </div>

                </div>

                <!-- Buttons -->
                <div class="form-buttons">

                    <button type="submit" class="form-btn update-btn">
                        Update Employee
                    </button>

                    <button type="reset" class="form-btn reset-btn">
                        Reset
                    </button>

                    <a href="${pageContext.request.contextPath}/employee/list"
                       class="form-btn back-btn">
                        Back to Employee List
                    </a>

                </div>

            </form:form>

        </section>

    </main>

</div>

</body>
</html>
