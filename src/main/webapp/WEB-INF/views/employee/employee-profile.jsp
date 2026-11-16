
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Profile</title>

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

        .profile-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0 4px 15px rgba(20, 43, 74, 0.06);
            max-width: 1000px;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 18px;
            padding-bottom: 25px;
            margin-bottom: 25px;
            border-bottom: 1px solid #e2e8f0;
        }

        .profile-avatar {
            width: 65px;
            height: 65px;
            border-radius: 50%;
            background: #ccfbf1;
            color: #0f766e;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            font-weight: 700;
            flex-shrink: 0;
        }

        .profile-header h3 {
            color: #142B4A;
            font-size: 21px;
            margin-bottom: 6px;
        }

        .profile-header p {
            color: #64748b;
            font-size: 13px;
        }

        .profile-status {
            margin-left: auto;
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            white-space: nowrap;
        }

        .active-status {
            background: #dcfce7;
            color: #166534;
        }

        .inactive-status {
            background: #fee2e2;
            color: #b91c1c;
        }

        .section-heading {
            color: #142B4A;
            font-size: 16px;
            font-weight: 700;
            margin: 25px 0 15px;
            padding-left: 11px;
            border-left: 4px solid #14B8A6;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 15px;
        }

        .detail-item {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 15px;
        }

        .detail-label {
            display: block;
            color: #64748b;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .detail-value {
            color: #142B4A;
            font-size: 14px;
            font-weight: 600;
            overflow-wrap: anywhere;
        }

        .salary-value {
            color: #0f766e;
            font-size: 16px;
        }

        .profile-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 30px;
            padding-top: 22px;
            border-top: 1px solid #e2e8f0;
        }

        .profile-btn {
            display: inline-block;
            padding: 11px 19px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: 0.2s;
        }

        .edit-btn {
            background: #14B8A6;
            color: #ffffff;
        }

        .edit-btn:hover {
            background: #0f9488;
        }

        .back-btn {
            background: #142B4A;
            color: #ffffff;
        }

        .back-btn:hover {
            background: #1e4264;
        }

        .dashboard-btn {
            background: #f1f5f9;
            color: #142B4A;
            border: 1px solid #cbd5e1;
        }

        .dashboard-btn:hover {
            background: #e2e8f0;
        }

        @media (max-width: 650px) {
            .profile-card {
                padding: 18px;
            }

            .profile-grid {
                grid-template-columns: 1fr;
            }

            .profile-header {
                flex-wrap: wrap;
            }

            .profile-status {
                margin-left: 0;
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

        <h2 class="page-heading">Employee Profile</h2>

        <p class="page-description">
            View complete employee personal and employment information.
        </p>

        <section class="profile-card">

            <!-- Profile Header -->
            <div class="profile-header">

                <div class="profile-avatar">
                    E
                </div>

                <div>
                    <h3>${employee.employee_name}</h3>
                    <p>${employee.designation} | ${employee.department}</p>
                    <p>Employee ID: ${employee.employee_id}</p>
                </div>

                <c:choose>
                    <c:when test="${employee.employee_status == 'Active'}">
                        <span class="profile-status active-status">
                            Active
                        </span>
                    </c:when>

                    <c:otherwise>
                        <span class="profile-status inactive-status">
                            Inactive
                        </span>
                    </c:otherwise>
                </c:choose>

            </div>

            <!-- Personal Information -->
            <h3 class="section-heading">Personal Information</h3>

            <div class="profile-grid">

                <div class="detail-item">
                    <span class="detail-label">Employee ID</span>
                    <span class="detail-value">${employee.employee_id}</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Employee Name</span>
                    <span class="detail-value">${employee.employee_name}</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Email Address</span>
                    <span class="detail-value">${employee.email}</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Phone Number</span>
                    <span class="detail-value">${employee.phone}</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Gender</span>
                    <span class="detail-value">${employee.gender}</span>
                </div>

            </div>

            <!-- Employment Information -->
            <h3 class="section-heading">Employment Information</h3>

            <div class="profile-grid">

                <div class="detail-item">
                    <span class="detail-label">Department</span>
                    <span class="detail-value">${employee.department}</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Designation</span>
                    <span class="detail-value">${employee.designation}</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Joining Date</span>
                    <span class="detail-value">${employee.joining_date}</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Basic Salary</span>
                    <span class="detail-value salary-value">
                        ₹ ${employee.basic_salary}
                    </span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Employee Status</span>
                    <span class="detail-value">${employee.employee_status}</span>
                </div>

            </div>

            <!-- Actions -->
            <div class="profile-actions">

                <a href="${pageContext.request.contextPath}/employee/edit/${employee.employee_id}"
                   class="profile-btn edit-btn">
                    Edit Employee
                </a>

                <a href="${pageContext.request.contextPath}/employee/list"
                   class="profile-btn back-btn">
                    Back to Employee List
                </a>

                <a href="${pageContext.request.contextPath}/dashboard"
                   class="profile-btn dashboard-btn">
                    Dashboard
                </a>

            </div>

        </section>

    </main>

</div>

</body>
</html>
