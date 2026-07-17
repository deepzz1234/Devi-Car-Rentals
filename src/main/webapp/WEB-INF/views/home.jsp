<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Devi Car Rentals</title>

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
                rgba(8, 15, 30, 0.75),
                rgba(8, 15, 30, 0.85)
            ),
            linear-gradient(
                135deg,
                #0f172a,
                #1d4ed8
            );

        color: white;
    }

    /* =========================
       NAVBAR
    ========================= */

    .navbar {
        height: 75px;

        display: flex;
        align-items: center;
        justify-content: space-between;

        padding: 0 8%;

        background: rgba(0, 0, 0, 0.25);

        backdrop-filter: blur(10px);

        border-bottom:
            1px solid rgba(255, 255, 255, 0.1);
    }

    .logo {
        font-size: 25px;
        font-weight: 700;
        letter-spacing: 1px;

        cursor: pointer;

        transition: 0.3s;
    }

    .logo:hover {
        transform: scale(1.05);
    }

    .logo span {
        color: #fbbf24;
    }

    .nav-text {
        color: #d1d5db;
        font-size: 14px;
    }

    /* =========================
       HERO SECTION
    ========================= */

    .hero {
        min-height: calc(100vh - 75px);

        display: flex;
        align-items: center;
        justify-content: center;

        padding: 40px 20px;
    }

    .hero-content {
        max-width: 900px;
        width: 100%;

        text-align: center;
    }

    .tag {
        display: inline-block;

        padding: 8px 18px;
        margin-bottom: 25px;

        background: rgba(251, 191, 36, 0.15);

        color: #fbbf24;

        border:
            1px solid rgba(251, 191, 36, 0.4);

        border-radius: 30px;

        font-size: 14px;
        letter-spacing: 1px;
    }

    h1 {
        font-size: 58px;
        line-height: 1.1;

        margin-bottom: 20px;
    }

    h1 span {
        color: #fbbf24;
    }

    .description {
        max-width: 650px;

        margin: 0 auto 45px;

        color: #cbd5e1;

        font-size: 18px;
        line-height: 1.7;
    }

    /* =========================
       LOGIN CARD
    ========================= */

    .login-card {
        max-width: 600px;

        margin: auto;
        padding: 35px;

        background: rgba(255, 255, 255, 0.08);

        border:
            1px solid rgba(255, 255, 255, 0.15);

        border-radius: 20px;

        backdrop-filter: blur(15px);

        box-shadow:
            0 20px 50px rgba(0, 0, 0, 0.3);

        transition: 0.3s;
    }

    .login-card:hover {
        transform: translateY(-3px);

        box-shadow:
            0 25px 60px rgba(0, 0, 0, 0.4);
    }

    .login-card h2 {
        margin-bottom: 8px;
        font-size: 23px;
    }

    .login-card p {
        color: #94a3b8;
        margin-bottom: 25px;
    }

    /* =========================
       LOGIN BUTTONS
    ========================= */

    .login-buttons {
        display: flex;
        gap: 18px;
        justify-content: center;
    }

    .btn {
        flex: 1;

        max-width: 220px;

        padding: 15px 25px;

        border-radius: 10px;

        text-decoration: none;

        font-size: 16px;
        font-weight: 600;

        transition: all 0.3s ease;

        cursor: pointer;
    }

    /* ADMIN BUTTON */

    .admin-btn {
        background: #fbbf24;
        color: #111827;
    }

    .admin-btn:hover {
        background: #f59e0b;

        transform:
            translateY(-5px)
            scale(1.03);

        box-shadow:
            0 12px 25px rgba(251, 191, 36, 0.3);
    }

    /* USER BUTTON */

    .user-btn {
        background: #2563eb;
        color: white;
    }

    .user-btn:hover {
        background: #1d4ed8;

        transform:
            translateY(-5px)
            scale(1.03);

        box-shadow:
            0 12px 25px rgba(37, 99, 235, 0.4);
    }

    /* =========================
       FEATURES
    ========================= */

    .features {
        margin-top: 45px;

        display: flex;
        justify-content: center;

        gap: 45px;

        color: #cbd5e1;

        font-size: 14px;
    }

    .feature {
        padding: 10px;

        border-radius: 10px;

        cursor: pointer;

        transition: all 0.3s ease;
    }

    .feature span {
        display: block;

        font-size: 28px;

        margin-bottom: 8px;

        transition: all 0.3s ease;
    }

    .feature:hover {
        color: #fbbf24;

        transform: translateY(-7px);
    }

    .feature:hover span {
        transform: scale(1.3);
    }

    /* =========================
       FOOTER
    ========================= */

    .footer {
        margin-top: 45px;

        color: #64748b;

        font-size: 13px;
    }

    /* =========================
       MOBILE RESPONSIVE
    ========================= */

    @media (max-width: 600px) {

        .navbar {
            padding: 0 20px;
        }

        .nav-text {
            display: none;
        }

        h1 {
            font-size: 40px;
        }

        .description {
            font-size: 16px;
        }

        .login-card {
            padding: 30px 20px;
        }

        .login-buttons {
            flex-direction: column;
            align-items: center;
        }

        .btn {
            width: 100%;
        }

        .features {
            gap: 20px;
            flex-wrap: wrap;
        }
    }

</style>

</head>

<body>

<!-- =========================
     NAVBAR
========================= -->

<nav class="navbar">

    <div class="logo">
        🚗 Devi <span>Car Rentals</span>
    </div>

    <div class="nav-text">
        Drive Your Journey With Us
    </div>

</nav>


<!-- =========================
     HERO SECTION
========================= -->

<main class="hero">

    <div class="hero-content">

        <div class="tag">
            PREMIUM CAR RENTAL SERVICE
        </div>

        <h1>
            Your Journey Begins With
            <span>Devi Car Rentals</span>
        </h1>

        <p class="description">
            Find the perfect car for every journey.
            Simple booking, reliable vehicles and a comfortable
            driving experience — all in one place.
        </p>


        <!-- =========================
             LOGIN CARD
        ========================= -->

        <div class="login-card">

            <h2>Welcome Back</h2>

            <p>
                Select how you would like to continue
            </p>

            <div class="login-buttons">

                <!-- ADMIN LOGIN -->

                <a href="${pageContext.request.contextPath}/admin-login"
                   class="btn admin-btn">
                    ⚙️ Admin Login
                </a>

                <!-- USER LOGIN -->

                <a href="${pageContext.request.contextPath}/user-login"
                   class="btn user-btn">
                    👤 User Login
                </a>

            </div>

        </div>


        <!-- =========================
             FEATURES
        ========================= -->

        <div class="features">

            <div class="feature">
                <span>🚘</span>
                Quality Cars
            </div>

            <div class="feature">
                <span>⚡</span>
                Easy Booking
            </div>

            <div class="feature">
                <span>🛡️</span>
                Safe & Reliable
            </div>

            <div class="feature">
                <span>📞</span>
                Customer Support
            </div>

        </div>


        <!-- =========================
             FOOTER
        ========================= -->

        <div class="footer">
            © 2026 Devi Car Rentals. All Rights Reserved.
        </div>

    </div>

</main>

</body>

</html>