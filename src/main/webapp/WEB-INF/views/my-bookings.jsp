<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Bookings | Devi Car Rentals</title>

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
        padding: 20px 8%;
        background: #0f172a;
        color: white;

        display: flex;
        justify-content: space-between;
        align-items: center;
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
        gap: 25px;
    }

    .nav-links a {
        color: #cbd5e1;
        text-decoration: none;
        transition: 0.3s;
    }

    .nav-links a:hover {
        color: #fbbf24;
    }

    /* MAIN */

    .container {
        max-width: 1200px;
        margin: auto;
        padding: 50px 8%;
    }

    .page-header {
        margin-bottom: 35px;
    }

    .page-header h1 {
        font-size: 32px;
        margin-bottom: 8px;
    }

    .page-header p {
        color: #64748b;
    }

    /* BOOKING GRID */

    .booking-grid {
        display: grid;

        grid-template-columns:
            repeat(auto-fit, minmax(320px, 1fr));

        gap: 25px;
    }

    /* BOOKING CARD */

    .booking-card {
        background: white;
        padding: 25px;

        border-radius: 15px;

        box-shadow:
            0 8px 25px rgba(15, 23, 42, 0.08);

        transition: 0.3s;
    }

    .booking-card:hover {
        transform: translateY(-5px);

        box-shadow:
            0 15px 35px rgba(15, 23, 42, 0.12);
    }

    .car-name {
        color: #2563eb;
        font-size: 22px;
        margin-bottom: 20px;
    }

    .detail {
        display: flex;
        justify-content: space-between;

        padding: 12px 0;

        border-bottom: 1px solid #e2e8f0;

        color: #64748b;
    }

    .detail strong {
        color: #334155;
    }

    /* AMOUNT */

    .amount {
        margin-top: 20px;

        padding: 12px;

        background: #dcfce7;

        color: #15803d;

        border-radius: 8px;

        text-align: center;

        font-size: 20px;
        font-weight: 700;
    }

    /* STATUS */

    .status {
        display: inline-block;

        margin-top: 18px;

        padding: 7px 15px;

        border-radius: 20px;

        background: #fef3c7;

        color: #92400e;

        font-size: 13px;
        font-weight: 700;
    }

    /* EMPTY BOOKINGS */

    .empty-bookings {
        background: white;

        padding: 60px 30px;

        border-radius: 15px;

        text-align: center;

        box-shadow:
            0 8px 25px rgba(15, 23, 42, 0.08);
    }

    .empty-icon {
        font-size: 60px;
        margin-bottom: 20px;
    }

    .empty-bookings h2 {
        margin-bottom: 10px;
    }

    .empty-bookings p {
        color: #64748b;
        margin-bottom: 25px;
    }

    .browse-btn {
        display: inline-block;

        padding: 13px 25px;

        background: #2563eb;

        color: white;

        text-decoration: none;

        border-radius: 8px;

        transition: 0.3s;
    }

    .browse-btn:hover {
        background: #1d4ed8;
        transform: translateY(-2px);
    }

    @media(max-width: 700px) {

        .navbar {
            padding: 18px 20px;
        }

        .nav-links {
            gap: 12px;
        }

        .container {
            padding: 30px 20px;
        }

        .detail {
            flex-direction: column;
            gap: 5px;
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
            Available Cars
        </a>

        <a href="${pageContext.request.contextPath}/user-logout">
            Logout
        </a>

    </div>

</nav>


<!-- MAIN CONTENT -->

<div class="container">

    <div class="page-header">

        <h1>📋 My Bookings</h1>

        <p>
            View and track all your car rental bookings.
        </p>

    </div>


    <!-- NO BOOKINGS -->

    <c:if test="${empty bookings}">

        <div class="empty-bookings">

            <div class="empty-icon">
                🚘
            </div>

            <h2>No Bookings Found</h2>

            <p>
                You haven't booked any cars yet.
            </p>

            <a
                href="${pageContext.request.contextPath}/cars"
                class="browse-btn">

                Browse Available Cars

            </a>

        </div>

    </c:if>


    <!-- DISPLAY BOOKINGS -->

    <c:if test="${not empty bookings}">

        <div class="booking-grid">

            <c:forEach
                var="booking"
                items="${bookings}">

                <div class="booking-card">


                    <div class="car-name">

                        🚘 ${booking.carName}

                    </div>


                    <div class="detail">

                        <span>Registration</span>

                        <strong>
                            ${booking.registrationNumber}
                        </strong>

                    </div>


                    <div class="detail">

                        <span>Phone Number</span>

                        <strong>
                            ${booking.phoneNumber}
                        </strong>

                    </div>


                    <div class="detail">

                        <span>Pickup Date</span>

                        <strong>
                            ${booking.pickupDate}
                        </strong>

                    </div>


                    <div class="detail">

                        <span>Return Date</span>

                        <strong>
                            ${booking.returnDate}
                        </strong>

                    </div>


                    <div class="amount">

                        Total Amount:
                        ₹${booking.totalAmount}

                    </div>


                    <div class="status">

                        ${booking.status}

                    </div>


                </div>

            </c:forEach>

        </div>

    </c:if>

</div>

</body>

</html>