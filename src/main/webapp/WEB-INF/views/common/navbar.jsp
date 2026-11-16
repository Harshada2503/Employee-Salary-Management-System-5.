<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="top-navbar">

    <div class="navbar-left">
        <h3>Employee Salary Management</h3>
        <p>Manage your workforce efficiently</p>
    </div>

    <div class="navbar-right">

        <div class="admin-info">
            <div class="admin-avatar">A</div>

            <div class="admin-details">
                <strong>Administrator</strong>
                <small>Admin</small>
            </div>
        </div>

        <!-- POST Logout -->
        <form action="${pageContext.request.contextPath}/admin/logout"
              method="post">

            <button type="submit" class="logout-link">
                Logout
            </button>

        </form>

    </div>

</header>