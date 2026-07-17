<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>User Dashboard | Devi Car Rentals</title>

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
        }

        /* NAVBAR */

        .navbar {
            height: 75px;
            background: #0f172a;
            color: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.2);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .logo span {
            color: #fbbf24;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .nav-links a {
            color: #cbd5e1;
            text-decoration: none;
            font-size: 15px;
            transition: 0.3s;
            cursor: pointer;
        }

        .nav-links a:hover {
            color: #fbbf24;
        }

        .logout-btn {
            padding: 10px 20px;
            background: #dc2626;
            border-radius: 7px;
            color: white !important;
        }

        .logout-btn:hover {
            background: #b91c1c;
            transform: translateY(-2px);
        }

        /* HERO */

        .hero {
            padding: 65px 8%;
            background: linear-gradient(
                135deg,
                #0f172a,
                #1e3a8a
            );

            color: white;
        }

        .hero h1 {
            font-size: 42px;
            margin-bottom: 12px;
        }

        .hero h1 span {
            color: #fbbf24;
        }

        .hero p {
            color: #cbd5e1;
            font-size: 18px;
            margin-bottom: 30px;
        }

        .browse-btn {
            display: inline-block;

            padding: 14px 28px;

            background: #fbbf24;
            color: #0f172a;

            border-radius: 8px;

            text-decoration: none;
            font-weight: bold;

            cursor: pointer;
            transition: 0.3s;
        }

        .browse-btn:hover {
            background: #f59e0b;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.25);
        }

        /* DASHBOARD */

        .dashboard {
            padding: 50px 8%;
        }

        .dashboard h2 {
            color: #0f172a;
            margin-bottom: 10px;
            font-size: 28px;
        }

        .dashboard-subtitle {
            color: #64748b;
            margin-bottom: 35px;
        }

        .cards {
            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(230px, 1fr));

            gap: 25px;
        }

        .card {
            background: white;
            padding: 35px 25px;

            border-radius: 14px;

            box-shadow:
                0 8px 25px
                rgba(15, 23, 42, 0.08);

            text-align: center;

            transition: 0.3s;

            cursor: pointer;
        }

        .card:hover {
            transform: translateY(-8px);

            box-shadow:
                0 15px 35px
                rgba(15, 23, 42, 0.15);
        }

        .icon {
            font-size: 45px;
            margin-bottom: 18px;
        }

        .card h3 {
            color: #0f172a;
            margin-bottom: 10px;
        }

        .card p {
            color: #64748b;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 22px;
        }

        .card-link {
            display: inline-block;

            padding: 10px 20px;

            background: #2563eb;
            color: white;

            text-decoration: none;

            border-radius: 7px;

            font-size: 14px;
            font-weight: 600;

            cursor: pointer;

            transition: 0.3s;
        }

        .card-link:hover {
            background: #1d4ed8;
        }

        /* FOOTER */

        footer {
            margin-top: 30px;
            padding: 25px;
            background: #0f172a;
            color: #94a3b8;
            text-align: center;
        }

        @media(max-width: 700px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links a:not(.logout-btn) {
                display: none;
            }

            .hero {
                padding: 50px 25px;
            }

            .hero h1 {
                font-size: 32px;
            }

            .dashboard {
                padding: 40px 25px;
            }
        }
    </style>

</head>

<body>

    <!-- NAVBAR -->

    <nav class="navbar">

        <div class="logo">
            🚗 Devi <span>Car Rentals</span>
        </div>

        <div class="nav-links">

            <a href="${pageContext.request.contextPath}/user-dashboard">
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/cars">
                Cars
            </a>

            <a href="${pageContext.request.contextPath}/my-bookings">
                My Bookings
            </a>

            <a href="${pageContext.request.contextPath}/user-logout"
               class="logout-btn">
                Logout
            </a>

        </div>

    </nav>


    <!-- HERO SECTION -->

    <section class="hero">

        <h1>
            Welcome to <span>Devi Car Rentals</span>
        </h1>

        <p>
            Find the perfect car for your next journey.
        </p>

        <a href="${pageContext.request.contextPath}/cars"
           class="browse-btn">
            🚘 Browse Available Cars
        </a>

    </section>


    <!-- DASHBOARD -->

    <section class="dashboard">

        <h2>Your Dashboard</h2>

        <p class="dashboard-subtitle">
            Manage your bookings and explore available vehicles.
        </p>


        <div class="cards">


            <!-- AVAILABLE CARS -->

            <div class="card">

                <div class="icon">
                    🚙
                </div>

                <h3>Available Cars</h3>

                <p>
                    Explore all cars currently available
                    for rent.
                </p>

                <a href="${pageContext.request.contextPath}/cars"
                   class="card-link">

                    View Cars

                </a>

            </div>


            <!-- MY BOOKINGS -->

            <div class="card">

                <div class="icon">
                    📅
                </div>

                <h3>My Bookings</h3>

                <p>
                    View your current and previous
                    car bookings.
                </p>

                <a href="${pageContext.request.contextPath}/my-bookings"
                   class="card-link">

                    View Bookings

                </a>

            </div>


            <!-- MY RENTALS -->

            <div class="card">

                <div class="icon">
                    🔑
                </div>

                <h3>My Rentals</h3>

                <p>
                    Check your active and completed
                    rental history.
                </p>

                <a href="${pageContext.request.contextPath}/my-rentals"
                   class="card-link">

                    View Rentals

                </a>

            </div>


            <!-- PROFILE -->

            <div class="card">

                <div class="icon">
                    👤
                </div>

                <h3>My Profile</h3>

                <p>
                    View your Google account information
                    and customer profile.
                </p>

                <a href="${pageContext.request.contextPath}/user-profile"
                   class="card-link">

                    View Profile

                </a>

            </div>


        </div>

    </section>


    <footer>
        © 2026 Devi Car Rentals. All rights reserved.
    </footer>


</body>
</html>