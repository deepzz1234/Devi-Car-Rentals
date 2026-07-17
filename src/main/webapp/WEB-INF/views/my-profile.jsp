<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Profile | Devi Car Rentals</title>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Arial, sans-serif;
    }

    body {
        min-height: 100vh;
        background: #f1f5f9;
        color: #0f172a;
    }

    /* NAVBAR */

    .navbar {
        min-height: 75px;
        padding: 15px 8%;
        background: #0f172a;
        color: white;

        display: flex;
        justify-content: space-between;
        align-items: center;

        box-shadow: 0 4px 15px rgba(0,0,0,0.15);
    }

    .logo {
        font-size: 23px;
        font-weight: 700;
    }

    .logo span {
        color: #fbbf24;
    }

    .nav-links {
        display: flex;
        align-items: center;
        gap: 25px;
    }

    .nav-links a {
        color: #cbd5e1;
        text-decoration: none;
        font-size: 15px;
        transition: 0.3s;
    }

    .nav-links a:hover {
        color: #fbbf24;
    }


    /* MAIN CONTAINER */

    .container {
        max-width: 900px;
        margin: 50px auto;
        padding: 20px;
    }

    .page-title {
        margin-bottom: 30px;
    }

    .page-title h1 {
        font-size: 32px;
        margin-bottom: 8px;
    }

    .page-title p {
        color: #64748b;
    }


    /* PROFILE CARD */

    .profile-card {
        background: white;
        border-radius: 18px;
        overflow: hidden;

        box-shadow:
            0 10px 35px
            rgba(15,23,42,0.10);
    }

    .profile-header {
        padding: 45px 30px;

        background:
            linear-gradient(
                135deg,
                #0f172a,
                #2563eb
            );

        text-align: center;
        color: white;
    }

    .profile-picture {
        width: 110px;
        height: 110px;

        border-radius: 50%;

        object-fit: cover;

        border: 5px solid white;

        margin-bottom: 15px;

        box-shadow:
            0 8px 20px
            rgba(0,0,0,0.25);
    }

    .profile-header h2 {
        font-size: 27px;
        margin-bottom: 7px;
    }

    .profile-header p {
        color: #cbd5e1;
    }


    /* PROFILE INFORMATION */

    .profile-body {
        padding: 35px;
    }

    .section-title {
        margin-bottom: 20px;
        font-size: 20px;
        color: #0f172a;
    }

    .profile-info {
        display: grid;
        gap: 18px;
    }

    .info-box {
        padding: 18px;

        background: #f8fafc;

        border: 1px solid #e2e8f0;

        border-radius: 10px;
    }

    .info-label {
        display: block;

        margin-bottom: 7px;

        color: #64748b;

        font-size: 13px;
        font-weight: 600;

        text-transform: uppercase;
    }

    .info-value {
        color: #0f172a;
        font-size: 16px;
        font-weight: 600;
    }


    /* GOOGLE ACCOUNT */

    .account-info {
        margin-top: 25px;

        padding: 16px;

        background: #eff6ff;

        color: #1d4ed8;

        border-radius: 9px;

        text-align: center;

        font-size: 14px;
    }


    /* ACTION BUTTONS */

    .actions {
        margin-top: 30px;

        display: flex;
        gap: 15px;
    }

    .btn {
        flex: 1;

        padding: 14px;

        border-radius: 8px;

        text-align: center;

        text-decoration: none;

        font-weight: 600;

        transition: 0.3s;
    }

    .dashboard-btn {
        background: #2563eb;
        color: white;
    }

    .dashboard-btn:hover {
        background: #1d4ed8;
        transform: translateY(-2px);
    }

    .logout-btn {
        background: #fee2e2;
        color: #dc2626;
    }

    .logout-btn:hover {
        background: #fecaca;
        transform: translateY(-2px);
    }


    /* RESPONSIVE */

    @media(max-width: 700px) {

        .navbar {
            padding: 18px 20px;
            flex-direction: column;
            gap: 15px;
        }

        .nav-links {
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .container {
            margin: 25px auto;
        }

        .profile-body {
            padding: 25px 20px;
        }

        .actions {
            flex-direction: column;
        }
    }

</style>

</head>


<body>

<nav class="navbar">

    <div class="logo">
        🚗 Devi <span>Car Rentals</span>
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/user-dashboard">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/cars">
            Available Cars
        </a>

        <a href="${pageContext.request.contextPath}/my-bookings">
            My Bookings
        </a>

        <a href="${pageContext.request.contextPath}/my-rentals">
            My Rentals
        </a>

        <a href="${pageContext.request.contextPath}/user-logout">
            Logout
        </a>

    </div>

</nav>


<div class="container">

    <div class="page-title">

        <h1>👤 My Profile</h1>

        <p>
            View your Devi Car Rentals account information.
        </p>

    </div>


    <div class="profile-card">


        <!-- PROFILE HEADER -->

        <div class="profile-header">

            <img
                src="${picture}"
                alt="Profile Picture"
                class="profile-picture">

            <h2>
                ${name}
            </h2>

            <p>
                Devi Car Rentals Customer
            </p>

        </div>


        <!-- PROFILE DETAILS -->

        <div class="profile-body">

            <h3 class="section-title">
                Personal Information
            </h3>


            <div class="profile-info">


                <div class="info-box">

                    <span class="info-label">
                        Full Name
                    </span>

                    <span class="info-value">
                        ${name}
                    </span>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Email Address
                    </span>

                    <span class="info-value">
                        ${email}
                    </span>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Account Type
                    </span>

                    <span class="info-value">
                        Google Account
                    </span>

                </div>


            </div>


            <div class="account-info">

                ✓ Your account is securely connected using Google Login.

            </div>


            <div class="actions">

                <a
                    href="${pageContext.request.contextPath}/user-dashboard"
                    class="btn dashboard-btn">

                    Back to Dashboard

                </a>


                <a
                    href="${pageContext.request.contextPath}/user-logout"
                    class="btn logout-btn">

                    Logout

                </a>

            </div>


        </div>

    </div>

</div>

</body>

</html>