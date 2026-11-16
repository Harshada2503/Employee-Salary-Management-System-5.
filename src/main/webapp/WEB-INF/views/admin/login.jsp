
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Login | Employee Salary Management System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #F4F7FB;
        }

        .login-page {
            min-height: 100vh;
            display: flex;
            overflow: hidden;
        }

        /* LEFT PANEL */
        .login-left {
            width: 52%;
            min-height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            padding: 70px;
            color: white;

            background:
                linear-gradient(
                    135deg,
                    rgba(20, 43, 74, 0.96),
                    rgba(20, 43, 74, 0.78)
                ),
url("https://images.unsplash.com/photo-1554224155-6726b3ff858f?auto=format&fit=crop&w=1400&q=85");
            background-size: cover;
            background-position: center;
        }

        .login-left::after {
            content: "";
            position: absolute;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: rgba(20, 184, 166, 0.13);
            right: -100px;
            bottom: -100px;
        } 

        .brand-content {
            max-width: 560px;
            position: relative;
            z-index: 2;
        }

        .brand-logo {
            width: 60px;
            height: 60px;
            border-radius: 16px;
            background: rgba(20, 184, 166, 0.18);
            border: 1px solid rgba(255, 255, 255, 0.25);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 29px;
            color: #14B8A6;
            margin-bottom: 24px;
        }

        .brand-name {
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-bottom: 35px;
        }

        .brand-content h1 {
            font-size: clamp(38px, 4vw, 62px);
            line-height: 1.08;
            font-weight: 800;
            margin-bottom: 22px;
        }

        .brand-content p {
            font-size: 16px;
            line-height: 1.8;
            color: rgba(255, 255, 255, 0.83);
            max-width: 500px;
        }

        /* FEATURES */
        .feature-list {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 35px;
        }

        .feature {
            padding: 10px 15px;
            border-radius: 30px;
            background: rgba(255, 255, 255, 0.10);
            border: 1px solid rgba(255, 255, 255, 0.20);
            font-size: 12px;
            font-weight: 500;
            backdrop-filter: blur(8px);
        }

        .feature i {
            color: #14B8A6;
        }

        /* RIGHT PANEL */
        .login-right {
            width: 48%;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            background: #FFFFFF;
        }

        .login-box {
            width: 100%;
            max-width: 450px;
            animation: slideUp 0.7s ease;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(25px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* LOGIN HEADER */
        .login-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 13px;
            border-radius: 30px;
            background: #DDF7F3;
            color: #087F73;
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .login-box h2 {
            font-size: 34px;
            font-weight: 800;
            color: #142B4A;
            margin-bottom: 10px;
        }

        .login-subtitle {
            color: #718096;
            font-size: 14px;
            margin-bottom: 30px;
        }

        /* ERROR */
        .login-error {
            padding: 12px 15px;
            border-radius: 10px;
            background: #FFF0F0;
            border: 1px solid #F2CACA;
            color: #B42332;
            font-size: 13px;
            margin-bottom: 20px;
        }

        /* FORM */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #34445B;
            margin-bottom: 8px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #8292A8;
            font-size: 18px;
            pointer-events: none;
        }

        .login-input {
            width: 100%;
            height: 52px;
            border: 1px solid #DCE3EC;
            border-radius: 12px;
            padding: 0 45px;
            font-size: 14px;
            outline: none;
            transition: all 0.25s ease;
            background: #F7F9FC;
            color: #142B4A;
        }

        .login-input::placeholder {
            color: #98A5B5;
        }

        .login-input:focus {
            background: white;
            border-color: #14B8A6;
            box-shadow: 0 0 0 4px rgba(20, 184, 166, 0.12);
        }

        /* PASSWORD TOGGLE */
        .password-toggle {
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background: transparent;
            color: #8292A8;
            font-size: 18px;
            cursor: pointer;
            padding: 4px;
        }

        .password-toggle:hover {
            color: #14B8A6;
        }

        /* REMEMBER ME */
        .login-options {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            font-size: 13px;
        }

        .remember {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #718096;
            cursor: pointer;
        }

        .remember input {
            width: 15px;
            height: 15px;
            accent-color: #14B8A6;
            cursor: pointer;
        }

        /* LOGIN BUTTON */
        .login-button {
            width: 100%;
            height: 54px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #142B4A, #1E456D);
            color: white;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 10px 25px rgba(20, 43, 74, 0.18);
            transition: all 0.25s ease;
        }

        .login-button:hover {
            background: linear-gradient(135deg, #14B8A6, #0F9488);
            transform: translateY(-2px);
            box-shadow: 0 14px 30px rgba(20, 184, 166, 0.22);
        }

        .login-button:active {
            transform: translateY(0);
        }

        .login-button:disabled {
            opacity: 0.75;
            cursor: not-allowed;
            transform: none;
        }

        /* SECURITY NOTE */
        .security-note {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-top: 25px;
            padding: 14px;
            border-radius: 12px;
            background: #F2F8FA;
            border: 1px solid #DCEBEF;
            color: #718096;
            font-size: 12px;
            line-height: 1.6;
        }

        .security-note i {
            color: #14B8A6;
            font-size: 17px;
        }

        /* FOOTER */
        .login-footer {
            text-align: center;
            margin-top: 28px;
            color: #8292A8;
            font-size: 12px;
            line-height: 1.7;
        }

        /* TABLET */
        @media (max-width: 1000px) {
            .login-left {
                width: 45%;
                padding: 45px;
            }

            .login-right {
                width: 55%;
                padding: 30px;
            }

            .brand-content h1 {
                font-size: 40px;
            }
        }

        /* MOBILE */
        @media (max-width: 768px) {
            .login-page {
                flex-direction: column;
                overflow: visible;
            }

            .login-left {
                width: 100%;
                min-height: 330px;
                padding: 40px 25px;
                background-position: center;
            }

            .login-left::after {
                display: none;
            }

            .brand-name {
                margin-bottom: 20px;
            }

            .brand-content h1 {
                font-size: 34px;
            }

            .brand-content p {
                font-size: 14px;
                line-height: 1.6;
            }

            .feature-list {
                display: none;
            }

            .login-right {
                width: 100%;
                min-height: auto;
                padding: 40px 25px;
            }

            .login-box {
                max-width: 500px;
            }
        }

        @media (max-width: 450px) {
            .login-left {
                min-height: 290px;
                padding: 30px 20px;
            }

            .brand-logo {
                width: 48px;
                height: 48px;
                font-size: 23px;
                margin-bottom: 16px;
            }

            .brand-content h1 {
                font-size: 29px;
            }

            .login-right {
                padding: 35px 20px;
            }

            .login-box h2 {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

<div class="login-page">

    <!-- LEFT SIDE -->
    <section class="login-left">

        <div class="brand-content">

            <div class="brand-logo">
                <i class="bi bi-wallet2"></i>
            </div>

            <div class="brand-name">
                Employee Salary Management System
            </div>

            <h1>
                Manage People.<br>
                Manage Payroll.
            </h1>

            <p>
                A centralized employee and payroll management
                platform. Manage employee records, departments,
                salary details and monthly payroll through one
                secure administration portal.
            </p>

            <div class="feature-list">

                <span class="feature">
                    <i class="bi bi-people me-1"></i>
                    Employee Management
                </span>

                <span class="feature">
                    <i class="bi bi-building me-1"></i>
                    Department Management
                </span>

                <span class="feature">
                    <i class="bi bi-cash-stack me-1"></i>
                    Salary Management
                </span>

                <span class="feature">
                    <i class="bi bi-receipt me-1"></i>
                    Payroll Processing
                </span>

            </div>
        </div>

    </section>

    <!-- RIGHT SIDE -->
    <section class="login-right">

        <div class="login-box">

            <div class="login-badge">
                <i class="bi bi-shield-lock-fill"></i>
                Administration Portal
            </div>

            <h2>Welcome back</h2>

            <p class="login-subtitle">
                Sign in to access your employee salary management dashboard.
            </p>

            <!-- ERROR MESSAGE -->
            <c:if test="${not empty error}">
                <div class="login-error">
                    <i class="bi bi-exclamation-circle me-2"></i>
                    <c:out value="${error}" />
                </div>
            </c:if>

            <!-- LOGIN FORM -->
            <form
                action="${pageContext.request.contextPath}/admin/login"
                method="post"
                onsubmit="handleLogin(this)">

                <div class="form-group">

                    <label class="form-label" for="username">
                        Username
                    </label>

                    <div class="input-wrapper">

                        <i class="bi bi-person input-icon"></i>

                        <input
                            type="text"
                            id="username"
                            name="username"
                            class="login-input"
                            placeholder="Enter your username"
                            autocomplete="username"
                            required>

                    </div>
                </div>

                <div class="form-group">

                    <label class="form-label" for="password">
                        Password
                    </label>

                    <div class="input-wrapper">

                        <i class="bi bi-lock input-icon"></i>

                        <input
                            type="password"
                            id="password"
                            name="password"
                            class="login-input"
                            placeholder="Enter your password"
                            autocomplete="current-password"
                            required>

                        <button
                            type="button"
                            class="password-toggle"
                            onclick="togglePassword()"
                            aria-label="Show password">

                            <i class="bi bi-eye" id="passwordIcon"></i>

                        </button>

                    </div>
                </div>

                <div class="login-options">
                    <label class="remember">
                        <input type="checkbox" name="remember">
                        Remember me
                    </label>
                </div>

                <button
                    type="submit"
                    class="login-button"
                    id="loginButton">

                    <span id="buttonText">
                        <i class="bi bi-box-arrow-in-right me-2"></i>
                        Sign In to Admin Portal
                    </span>

                </button>

            </form>

            <div class="security-note">

                <i class="bi bi-shield-check"></i>

                <div>
                    Your login information is protected.
                    This portal is restricted to authorized
                    administrators only.
                </div>

            </div>

            <div class="login-footer">
                © 2026 Employee Salary Management System
                <br>
                Secure Employee & Payroll Administration Portal
            </div>

        </div>

    </section>

</div>

<script>
    function togglePassword() {

        const password = document.getElementById("password");
        const icon = document.getElementById("passwordIcon");
        const toggleButton = document.querySelector(".password-toggle");

        if (password.type === "password") {

            password.type = "text";

            icon.classList.remove("bi-eye");
            icon.classList.add("bi-eye-slash");

            toggleButton.setAttribute("aria-label", "Hide password");

        } else {

            password.type = "password";

            icon.classList.remove("bi-eye-slash");
            icon.classList.add("bi-eye");

            toggleButton.setAttribute("aria-label", "Show password");
        }
    }

    function handleLogin(form) {

        if (form.checkValidity()) {

            const button = document.getElementById("loginButton");
            const buttonText = document.getElementById("buttonText");

            button.disabled = true;

            buttonText.innerHTML =
                '<span class="spinner-border spinner-border-sm me-2"></span>' +
                'Signing in...';
        }
    }
</script>

</body>
</html>
