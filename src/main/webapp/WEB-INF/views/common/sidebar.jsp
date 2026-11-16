
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside class="sidebar">

    <div class="sidebar-brand">
        <span>EMS</span>
        <small>Employee Management</small>
    </div>

    <div class="sidebar-section">MAIN MENU</div>

    <ul class="sidebar-menu">

        <li>
            <a href="${pageContext.request.contextPath}/dashboard">
                <span>▦</span>Dashboard
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/employee/list">
                <span>♙</span>Employees
            </a>
        </li>

        <!-- Employee Search -->
        <li>
            <a href="${pageContext.request.contextPath}/employee/search">
                <span>⌕</span>Employee Search
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/salary/list">
                <span>₹</span>Salary Management
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/payroll/list">
                <span>▤</span>Payroll
            </a>
        </li>

        <!-- AI Payroll Intelligence -->
        <li>
            <a href="${pageContext.request.contextPath}/ai-insights">
                <span>✧</span>AI Payroll Intelligence
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/department/list">
                <span>▣</span>Departments
            </a>
        </li>

    </ul>

    <div class="sidebar-section">ACCOUNT</div>

    <ul class="sidebar-menu">

        <li>
            <form action="${pageContext.request.contextPath}/admin/logout"
                  method="post">

                <button type="submit" class="sidebar-logout">
                    <span>⇥</span>Logout
                </button>

            </form>
        </li>

    </ul>

    <div class="sidebar-footer">
        Employee Salary Management System
        <br>
        <small>Admin Panel</small>
    </div>

</aside>
