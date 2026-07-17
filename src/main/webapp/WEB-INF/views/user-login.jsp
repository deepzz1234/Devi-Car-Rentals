<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>User Login | Devi Car Rentals</title>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Arial, sans-serif;
    }

    body {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 30px 15px;

        background:
            linear-gradient(
                rgba(8, 15, 30, 0.82),
                rgba(8, 15, 30, 0.92)
            ),
            linear-gradient(
                135deg,
                #0f172a,
                #1d4ed8
            );

        color: white;
    }

    .login-container {
        width: 100%;
        max-width: 430px;
        padding: 45px 40px;

        background: rgba(255, 255, 255, 0.08);

        border:
            1px solid rgba(255, 255, 255, 0.15);

        border-radius: 20px;

        backdrop-filter: blur(15px);

        box-shadow:
            0 20px 50px rgba(0, 0, 0, 0.4);

        text-align: center;
    }

    .logo {
        font-size: 25px;
        font-weight: 700;
        margin-bottom: 30px;
    }

    .logo span {
        color: #fbbf24;
    }

    .user-icon {
        width: 75px;
        height: 75px;

        margin: 0 auto 20px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 50%;

        background: #2563eb;

        font-size: 35px;
    }

    h1 {
        margin-bottom: 10px;
        font-size: 28px;
    }

    .subtitle {
        margin-bottom: 35px;

        color: #94a3b8;

        font-size: 15px;

        line-height: 1.6;
    }

    /* GOOGLE BUTTON */

    .google-btn {
        width: 100%;

        display: flex;

        align-items: center;

        justify-content: center;

        gap: 12px;

        padding: 14px 20px;

        background: white;

        color: #334155;

        text-decoration: none;

        border-radius: 9px;

        font-size: 16px;

        font-weight: 600;

        cursor: pointer;

        transition: 0.3s;
    }

    .google-btn:hover {
        background: #f8fafc;

        transform: translateY(-3px);

        box-shadow:
            0 10px 25px rgba(0, 0, 0, 0.3);
    }

    .google-icon {
        width: 25px;
        height: 25px;

        display: flex;

        align-items: center;

        justify-content: center;

        font-size: 20px;

        font-weight: bold;

        color: #4285F4;
    }

    .info {
        margin-top: 25px;

        padding-top: 20px;

        border-top:
            1px solid rgba(255,255,255,0.1);

        color: #64748b;

        font-size: 13px;

        line-height: 1.6;
    }

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
        transform: translateX(-3px);
    }

    @media(max-width: 500px) {

        .login-container {
            padding: 35px 25px;
        }

    }

</style>

</head>

<body>

<div class="login-container">

    <div class="logo">
        🚗 Devi
        <span>Car Rentals</span>
    </div>


    <div class="user-icon">
        👤
    </div>


    <h1>
        Welcome
    </h1>


    <p class="subtitle">
        Sign in securely with your Google account
        to browse cars and manage your bookings.
    </p>


    <!-- GOOGLE LOGIN -->

    <a href="${pageContext.request.contextPath}/oauth2/authorization/google"
       class="google-btn">

        <span class="google-icon">
            G
        </span>

        Continue with Google

    </a>


    <div class="info">
        Your Google account will be used to securely
        identify your Devi Car Rentals account.
    </div>


    <a href="${pageContext.request.contextPath}/"
       class="back-link">

        ← Back to Home

    </a>

</div>

</body>

</html>
