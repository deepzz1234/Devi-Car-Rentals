<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard | Devi Car Rentals</title>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Arial, sans-serif;
    }

    body {
        min-height: 100vh;
        background: #f1f5f9;
        color: #1e293b;
    }


    /* ==============================
       SIDEBAR
    ============================== */

    .sidebar {

        position: fixed;

        top: 0;
        left: 0;

        width: 250px;
        height: 100vh;

        background:
            linear-gradient(
                180deg,
                #0f172a,
                #172554
            );

        color: white;

        padding: 25px 20px;
    }


    .logo {

        font-size: 22px;

        font-weight: bold;

        margin-bottom: 45px;

        text-align: center;
    }


    .logo span {

        color: #fbbf24;
    }


    .menu {

        list-style: none;
    }


    .menu li {

        margin-bottom: 12px;
    }


    .menu a {

        display: block;

        padding: 14px 16px;

        color: #cbd5e1;

        text-decoration: none;

        border-radius: 8px;

        cursor: pointer;

        transition: 0.3s;
    }


    .menu a:hover {

        background:
            rgba(255,255,255,0.10);

        color: #fbbf24;

        transform: translateX(5px);
    }


    .menu .active {

        background: #2563eb;

        color: white;
    }


    /* ==============================
       MAIN CONTENT
    ============================== */

    .main {

        margin-left: 250px;

        min-height: 100vh;
    }


    /* ==============================
       TOP NAVBAR
    ============================== */

    .topbar {

        height: 75px;

        background: white;

        display: flex;

        align-items: center;

        justify-content: space-between;

        padding: 0 40px;

        box-shadow:
            0 2px 10px rgba(0,0,0,0.08);
    }


    .topbar h2 {

        color: #0f172a;
    }


    .admin-profile {

        display: flex;

        align-items: center;

        gap: 12px;
    }


    .profile-icon {

        width: 42px;

        height: 42px;

        display: flex;

        justify-content: center;

        align-items: center;

        border-radius: 50%;

        background: #fbbf24;

        font-size: 20px;
    }


    /* ==============================
       DASHBOARD CONTENT
    ============================== */

    .content {

        padding: 35px 40px;
    }


    .welcome {

        margin-bottom: 30px;
    }


    .welcome h1 {

        font-size: 28px;

        color: #0f172a;

        margin-bottom: 7px;
    }


    .welcome p {

        color: #64748b;
    }


    /* ==============================
       STAT CARDS
    ============================== */

    .stats {

        display: grid;

        grid-template-columns:
            repeat(4, 1fr);

        gap: 20px;

        margin-bottom: 40px;
    }


    .stat-card {

        background: white;

        padding: 25px;

        border-radius: 14px;

        box-shadow:
            0 5px 15px rgba(0,0,0,0.07);

        cursor: pointer;

        transition: 0.3s;
    }


    .stat-card:hover {

        transform: translateY(-5px);

        box-shadow:
            0 10px 25px rgba(0,0,0,0.12);
    }


    .stat-icon {

        font-size: 32px;

        margin-bottom: 15px;
    }


    .stat-card h3 {

        font-size: 28px;

        color: #0f172a;

        margin-bottom: 5px;
    }


    .stat-card p {

        color: #64748b;

        font-size: 14px;
    }


    /* ==============================
       MANAGEMENT CARDS
    ============================== */

    .section-title {

        margin-bottom: 20px;

        font-size: 22px;

        color: #0f172a;
    }


    .management-grid {

        display: grid;

        grid-template-columns:
            repeat(3, 1fr);

        gap: 25px;
    }


    .management-card {

        background: white;

        padding: 30px;

        border-radius: 15px;

        box-shadow:
            0 5px 15px rgba(0,0,0,0.07);

        transition: 0.3s;
    }


    .management-card:hover {

        transform: translateY(-5px);

        box-shadow:
            0 10px 25px rgba(0,0,0,0.12);
    }


    .management-icon {

        width: 55px;

        height: 55px;

        display: flex;

        justify-content: center;

        align-items: center;

        background: #dbeafe;

        border-radius: 12px;

        font-size: 27px;

        margin-bottom: 18px;
    }


    .management-card h3 {

        margin-bottom: 10px;

        color: #0f172a;
    }


    .management-card p {

        color: #64748b;

        font-size: 14px;

        line-height: 1.6;

        margin-bottom: 20px;
    }


    .manage-btn {

        display: inline-block;

        padding: 10px 18px;

        background: #2563eb;

        color: white;

        text-decoration: none;

        border-radius: 7px;

        font-size: 14px;

        cursor: pointer;

        transition: 0.3s;
    }


    .manage-btn:hover {

        background: #1d4ed8;

        transform: translateY(-2px);
    }


    /* ==============================
       LOGOUT
    ============================== */

    .logout {

        position: absolute;

        bottom: 30px;

        left: 20px;

        width: calc(100% - 40px);
    }


    .logout a {

        display: block;

        padding: 13px;

        text-align: center;

        background:
            rgba(239,68,68,0.15);

        color: #fca5a5;

        text-decoration: none;

        border-radius: 8px;

        cursor: pointer;

        transition: 0.3s;
    }


    .logout a:hover {

        background: #ef4444;

        color: white;
    }


    /* ==============================
       RESPONSIVE
    ============================== */

    @media(max-width: 1100px) {

        .stats {

            grid-template-columns:
                repeat(2, 1fr);
        }


        .management-grid {

            grid-template-columns:
                repeat(2, 1fr);
        }

    }


    @media(max-width: 700px) {

        .sidebar {

            width: 70px;

            padding: 25px 10px;
        }


        .logo {

            font-size: 0;
        }


        .logo::before {

            content: "🚗";

            font-size: 25px;
        }


        .menu a {

            font-size: 0;

            text-align: center;
        }


        .main {

            margin-left: 70px;
        }


        .stats {

            grid-template-columns: 1fr;
        }


        .management-grid {

            grid-template-columns: 1fr;
        }


        .topbar {

            padding: 0 20px;
        }


        .content {

            padding: 25px 20px;
        }

    }

</style>

</head>


<body>


<!-- ===================================
     SIDEBAR
=================================== -->

<div class="sidebar">


    <div class="logo">

        🚗 Devi
        <span>Car Rentals</span>

    </div>


    <ul class="menu">


        <!-- DASHBOARD -->

        <li>

            <a
                href="${pageContext.request.contextPath}/admin-dashboard"
                class="active">

                🏠 Dashboard

            </a>

        </li>


        <!-- MANAGE CARS -->

        <li>

            <a
                href="${pageContext.request.contextPath}/admin/cars">

                🚘 Manage Cars

            </a>

        </li>


        <!-- BOOKINGS -->

        <li>

            <a
                href="${pageContext.request.contextPath}/admin/bookings">

                📅 Bookings

            </a>

        </li>


        <!-- CUSTOMERS -->

        <li>

            <a
                href="${pageContext.request.contextPath}/admin/customers">

                👥 Customers

            </a>

        </li>


        <!-- RENTALS -->

        <li>

            <a
                href="${pageContext.request.contextPath}/admin/rentals">

                🔑 Rentals

            </a>

        </li>


    </ul>



    <!-- ===================================
         ADMIN LOGOUT

         IMPORTANT:
         Use /admin-logout
         NOT /logout
    =================================== -->

    <div class="logout">

        <a
            href="${pageContext.request.contextPath}/admin-logout">

            🚪 Logout

        </a>

    </div>


</div>



<!-- ===================================
     MAIN CONTENT
=================================== -->

<div class="main">


    <!-- TOP BAR -->

    <div class="topbar">


        <h2>

            Admin Dashboard

        </h2>


        <div class="admin-profile">


            <div class="profile-icon">

                👤

            </div>


            <div>

                <strong>

                    Admin

                </strong>

            </div>


        </div>


    </div>



    <!-- ===================================
         DASHBOARD CONTENT
    =================================== -->

    <div class="content">


        <!-- WELCOME -->

        <div class="welcome">


            <h1>

                Welcome back, Admin 👋

            </h1>


            <p>

                Manage your Devi Car Rentals
                application from here.

            </p>


        </div>



        <!-- ===================================
             STATISTICS
        =================================== -->

        <div class="stats">


            <!-- TOTAL CARS -->

            <div class="stat-card">


                <div class="stat-icon">

                    🚘

                </div>


                <h3>

                    ${totalCars}

                </h3>


                <p>

                    Total Cars

                </p>


            </div>



            <!-- TOTAL BOOKINGS -->

            <div class="stat-card">


                <div class="stat-icon">

                    📅

                </div>


                <h3>

                    ${totalBookings}

                </h3>


                <p>

                    Total Bookings

                </p>


            </div>



            <!-- TOTAL CUSTOMERS -->

            <div class="stat-card">


                <div class="stat-icon">

                    👥

                </div>


                <h3>

                    ${totalCustomers}

                </h3>


                <p>

                    Registered Customers

                </p>


            </div>



            <!-- ACTIVE RENTALS -->

            <div class="stat-card">


                <div class="stat-icon">

                    🔑

                </div>


                <h3>

                    ${activeRentals}

                </h3>


                <p>

                    Active Rentals

                </p>


            </div>


        </div>



        <!-- ===================================
             QUICK MANAGEMENT
        =================================== -->

        <h2 class="section-title">

            Quick Management

        </h2>


        <div class="management-grid">


            <!-- MANAGE CARS -->

            <div class="management-card">


                <div class="management-icon">

                    🚘

                </div>


                <h3>

                    Manage Cars

                </h3>


                <p>

                    Add new cars, update vehicle
                    information and manage car
                    availability.

                </p>


                <a
                    href="${pageContext.request.contextPath}/admin/cars"
                    class="manage-btn">

                    Manage Cars →

                </a>


            </div>



            <!-- MANAGE BOOKINGS -->

            <div class="management-card">


                <div class="management-icon">

                    📅

                </div>


                <h3>

                    Manage Bookings

                </h3>


                <p>

                    View customer bookings and
                    manage rental reservations.

                </p>


                <a
                    href="${pageContext.request.contextPath}/admin/bookings"
                    class="manage-btn">

                    View Bookings →

                </a>


            </div>



            <!-- MANAGE CUSTOMERS -->

            <div class="management-card">


                <div class="management-icon">

                    👥

                </div>


                <h3>

                    Manage Customers

                </h3>


                <p>

                    View registered customers
                    and their rental activity.

                </p>


                <a
                    href="${pageContext.request.contextPath}/admin/customers"
                    class="manage-btn">

                    View Customers →

                </a>


            </div>


        </div>


    </div>


</div>


</body>

</html>