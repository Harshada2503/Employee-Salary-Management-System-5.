
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Registration</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    min-height: 100vh;
    background: #eef2f7;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 25px;
}

.register-container {
    width: 100%;
    max-width: 1050px;
    min-height: 590px;
    display: grid;
    grid-template-columns: 45% 55%;
    background: #ffffff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0,0,0,0.13);
}

/* Left panel */

.info-panel {
    background: #1F4E79;
    color: #ffffff;
    padding: 45px 35px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.brand {
    font-size: 19px;
    font-weight: bold;
    line-height: 1.5;
}

.brand-line {
    width: 55px;
    height: 4px;
    background: #ffffff;
    margin-top: 20px;
    border-radius: 5px;
}

.info-content {
    margin-top: 30px;
}

.info-content h1 {
    font-size: 30px;
    line-height: 1.4;
    margin-bottom: 15px;
}

.info-content p {
    font-size: 14px;
    line-height: 1.8;
}

.office-image {
    width: 100%;
    height: 230px;
    object-fit: cover;
    border-radius: 7px;
    margin-top: 30px;
}

.info-footer {
    font-size: 11px;
    margin-top: 20px;
}

/* Right panel */

.form-panel {
    padding: 55px 55px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

h2 {
    color: #1F4E79;
    font-size: 27px;
    margin-bottom: 10px;
}

.subtitle {
    color: #666666;
    font-size: 13px;
    line-height: 1.6;
    margin-bottom: 28px;
}

.form-group {
    margin-bottom: 21px;
}

label {
    display: block;
    color: #333333;
    font-size: 13px;
    font-weight: bold;
    margin-bottom: 9px;
}

input {
    width: 100%;
    padding: 13px;
    border: 1px solid #cccccc;
    border-radius: 5px;
    outline: none;
    font-size: 14px;
}

input:focus {
    border-color: #1F4E79;
    box-shadow: 0 0 0 2px rgba(31,78,121,0.10);
}

input::placeholder {
    color: #999999;
}

.password-hint {
    display: block;
    margin-top: 7px;
    color: #777777;
    font-size: 11px;
}

.create-btn {
    width: 100%;
    padding: 14px;
    background: #1F4E79;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 5px;
}

.create-btn:hover {
    background: #163a5c;
}

.error {
    color: red;
    background: #fff1f1;
    border: 1px solid #f5cccc;
    padding: 11px;
    border-radius: 5px;
    margin-bottom: 20px;
    font-size: 13px;
}

.form-footer {
    text-align: center;
    color: #888888;
    font-size: 11px;
    margin-top: 28px;
    padding-top: 18px;
    border-top: 1px solid #e2e8f0;
}

@media(max-width: 750px) {
    .register-container {
        grid-template-columns: 1fr;
    }

    .info-panel {
        padding: 30px;
    }

    .info-content h1 {
        font-size: 24px;
    }

    .office-image {
        height: 200px;
    }

    .form-panel {
        padding: 35px 28px;
    }
}
</style>
</head>

<body>

<div class="register-container">

    <section class="info-panel">

        <div>
            <div class="brand">
                Employee Salary<br>
                Management System
            </div>

            <div class="brand-line"></div>

            <div class="info-content">
                <h1>Create Your Admin Account</h1>

                <p>
                    Manage employees, departments, salaries
                    and payroll efficiently from one
                    centralized system.
                </p>
            </div>
        </div>

        <img class="office-image"
             src="${pageContext.request.contextPath}/resources/images/admin-office-illustration.png"
             alt="Professional office workspace">

        <div class="info-footer">
            Employee Salary Management System
        </div>

    </section>

    <section class="form-panel">

        <h2>Create First Admin</h2>

        <p class="subtitle">
            Enter your details to create the administrator account.
        </p>

        <% if (request.getAttribute("error") != null) { %>

            <div class="error">
                <%= request.getAttribute("error") %>
            </div>

        <% } %>

        <form action="${pageContext.request.contextPath}/admin/setup"
              method="post">

            <div class="form-group">
                <label for="full_name">Full Name</label>

                <input type="text"
                       id="full_name"
                       name="full_name"
                       placeholder="Enter full name"
                       required>
            </div>

            <div class="form-group">
                <label for="username">Username</label>

                <input type="text"
                       id="username"
                       name="username"
                       placeholder="Create username"
                       required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>

                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Minimum 8 characters"
                       minlength="8"
                       required>

                <small class="password-hint">
                    Password must contain at least 8 characters.
                </small>
            </div>

            <button type="submit" class="create-btn">
                Create Admin Account
            </button>

        </form>

        <div class="form-footer">
            Employee Salary Management System
        </div>

    </section>

</div>

</body>
</html>
