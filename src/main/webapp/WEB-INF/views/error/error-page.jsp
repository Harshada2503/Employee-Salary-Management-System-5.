
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Error | Employee Salary Management</title>

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

.error-container {
    width: 100%;
    max-width: 1000px;
    background: #ffffff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0,0,0,0.12);
}

/* Header */

.error-header {
    background: #1F4E79;
    color: #ffffff;
    padding: 22px 35px;
    font-size: 21px;
    font-weight: bold;
}

/* Main Content */

.error-content {
    display: grid;
    grid-template-columns: 45% 55%;
    align-items: center;
    padding: 45px;
    gap: 25px;
}

.error-image {
    width: 100%;
    max-width: 380px;
    display: block;
    margin: auto;
}

.error-details {
    text-align: center;
}

.error-icon {
    width: 65px;
    height: 65px;
    margin: 0 auto 20px;
    border-radius: 50%;
    background: #fff1f1;
    color: #c0392b;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 38px;
    font-weight: bold;
}

h2 {
    color: #c0392b;
    font-size: 27px;
    margin-bottom: 18px;
}

.error-message {
    color: #555555;
    font-size: 15px;
    line-height: 1.8;
    background: #f8fafc;
    padding: 15px;
    border-radius: 6px;
    overflow-wrap: anywhere;
}

.error-help {
    color: #777777;
    font-size: 13px;
    margin-top: 20px;
    line-height: 1.6;
}

/* Button */

.btn {
    display: inline-block;
    margin-top: 25px;
    padding: 13px 25px;
    background: #1F4E79;
    color: #ffffff;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
    font-weight: bold;
    transition: 0.2s;
}

.btn:hover {
    background: #163a5c;
}

/* Footer */

.error-footer {
    text-align: center;
    color: #888888;
    font-size: 12px;
    padding: 18px;
    border-top: 1px solid #e2e8f0;
}

/* Responsive */

@media(max-width: 700px) {
    .error-content {
        grid-template-columns: 1fr;
        padding: 30px 22px;
    }

    .error-image {
        max-width: 250px;
    }

    h2 {
        font-size: 23px;
    }

    .error-header {
        font-size: 17px;
        padding: 20px;
    }
}
</style>
</head>

<body>

<div class="error-container">

    <header class="error-header">
        Employee Salary Management System
    </header>

    <main class="error-content">

        <div>
            <img class="error-image"
                 src="${pageContext.request.contextPath}/resources/images/error-illustration.png"
                 alt="Error illustration">
        </div>

        <div class="error-details">

            <div class="error-icon">!</div>

            <h2>Something Went Wrong!</h2>

            <p class="error-message">
                ${errorMessage}
            </p>

            <p class="error-help">
                An unexpected problem occurred.
                Please try again later or return to your dashboard.
            </p>

            <a href="${pageContext.request.contextPath}/dashboard"
               class="btn">
                Back to Dashboard
            </a>

        </div>

    </main>

    <footer class="error-footer">
        Employee Salary Management System
    </footer>

</div>

</body>
</html>
