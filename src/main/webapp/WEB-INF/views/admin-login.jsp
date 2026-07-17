<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Admin Login | Devi Car Rentals</title>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Arial, sans-serif;
    }

    body {
        min-height: 100vh;

        background:
            linear-gradient(
                rgba(8, 15, 30, 0.80),
                rgba(8, 15, 30, 0.90)
            ),
            linear-gradient(
                135deg,
                #0f172a,
                #1d4ed8
            );

        display: flex;
        justify-content: center;
        align-items: center;

        color: white;
    }

    /* =========================
       LOGIN CONTAINER
    ========================= */

    .login-container {
        width: 420px;

        padding: 45px 40px;

        background:
            rgba(255, 255, 255, 0.08);

        border:
            1px solid rgba(255, 255, 255, 0.15);

        border-radius: 20px;

        backdrop-filter: blur(15px);

        box-shadow:
            0 20px 50px rgba(0, 0, 0, 0.4);

        text-align: center;
    }

    /* =========================
       LOGO
    ========================= */

    .logo {
        font-size: 26px;
        font-weight: bold;

        margin-bottom: 30px;
    }

    .logo span {
        color: #fbbf24;
    }

    /* =========================
       ADMIN ICON
    ========================= */

    .admin-icon {
        width: 70px;
        height: 70px;

        margin: 0 auto 20px;

        display: flex;
        justify-content: center;
        align-items: center;

        background: #fbbf24;

        color: #111827;

        border-radius: 50%;

        font-size: 32px;
    }

    /* =========================
       HEADING
    ========================= */

    h1 {
        font-size: 28px;

        margin-bottom: 8px;
    }

    .subtitle {
        color: #94a3b8;

        margin-bottom: 30px;

        font-size: 14px;
    }

    /* =========================
       ERROR MESSAGE
    ========================= */

    .error-message {
        color: #f87171;

        margin-bottom: 15px;

        font-size: 14px;
    }

    /* =========================
       FORM
    ========================= */

    .form-group {
        text-align: left;

        margin-bottom: 20px;
    }

    .form-group label {
        display: block;

        margin-bottom: 8px;

        color: #cbd5e1;

        font-size: 14px;
    }

    .form-group input {
        width: 100%;

        padding: 14px;

        background:
            rgba(255, 255, 255, 0.08);

        border:
            1px solid rgba(255, 255, 255, 0.2);

        border-radius: 8px;

        color: white;

        font-size: 15px;

        outline: none;

        transition: 0.3s;
    }

    .form-group input::placeholder {
        color: #64748b;
    }

    .form-group input:focus {
        border-color: #fbbf24;

        box-shadow:
            0 0 0 3px rgba(251, 191, 36, 0.15);
    }

    /* =========================
       LOGIN BUTTON
    ========================= */

    .login-btn {
        width: 100%;

        padding: 14px;

        margin-top: 10px;

        border: none;

        border-radius: 8px;

        background: #fbbf24;

        color: #111827;

        font-size: 16px;
        font-weight: 700;

        cursor: pointer;

        transition: 0.3s;
    }

    .login-btn:hover {
        background: #f59e0b;

        transform: translateY(-3px);

        box-shadow:
            0 10px 25px rgba(251, 191, 36, 0.25);
    }

    /* =========================
       BACK LINK
    ========================= */

    .back-link {
        display: inline-block;

        margin-top: 25px;

        color: #94a3b8;

        text-decoration: none;

        font-size: 14px;

        cursor: pointer;

        transition: 0.3s;
    }

    .back-link:hover {
        color: #fbbf24;
    }

    /* =========================
       RESPONSIVE
    ========================= */

    @media (max-width: 500px) {

        .login-container {
            width: 90%;

            padding: 35px 25px;
        }
    }

</style>

</head>

<body>

<div class="login-container">

    <!-- LOGO -->

    <div class="logo">
        🚗 Devi <span>Car Rentals</span>
    </div>


    <!-- ADMIN ICON -->

    <div class="admin-icon">
        ⚙️
    </div>


    <!-- HEADING -->

    <h1>Admin Login</h1>

    <p class="subtitle">
        Sign in to access the administration dashboard
    </p>


    <!-- ERROR MESSAGE -->

    <div class="error-message">
        ${error}
    </div>


    <!-- ADMIN LOGIN FORM -->

    <form action="${pageContext.request.contextPath}/admin-login"
          method="post">

        <div class="form-group">

            <label for="username">
                Username
            </label>

            <input type="text"
                   id="username"
                   name="username"
                   placeholder="Enter admin username"
                   required>

        </div>


        <div class="form-group">

            <label for="password">
                Password
            </label>

            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter admin password"
                   required>

        </div>


        <button type="submit"
                class="login-btn">

            Login to Dashboard

        </button>

    </form>


    <!-- BACK TO HOME -->

    <a href="${pageContext.request.contextPath}/"
       class="back-link">

        ← Back to Home

    </a>

</div>

</body>

</html>