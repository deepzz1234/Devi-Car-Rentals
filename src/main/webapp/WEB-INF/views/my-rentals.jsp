<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>My Rentals | Devi Car Rentals</title>

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


    /* =========================
       NAVBAR
    ========================= */

    .navbar {

        min-height: 75px;

        padding: 15px 8%;

        background: #0f172a;

        color: white;

        display: flex;

        justify-content: space-between;

        align-items: center;

        box-shadow:
            0 4px 15px
            rgba(0, 0, 0, 0.15);
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

        cursor: pointer;

        transition: 0.3s;
    }


    .nav-links a:hover {

        color: #fbbf24;
    }


    /* =========================
       MAIN CONTAINER
    ========================= */

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

        margin-bottom: 10px;
    }


    .page-header p {

        color: #64748b;

        font-size: 16px;
    }


    /* =========================
       RENTALS GRID
    ========================= */

    .rentals-grid {

        display: grid;

        grid-template-columns:
            repeat(
                auto-fit,
                minmax(320px, 1fr)
            );

        gap: 25px;
    }


    /* =========================
       RENTAL CARD
    ========================= */

    .rental-card {

        background: white;

        padding: 27px;

        border-radius: 16px;

        box-shadow:
            0 8px 25px
            rgba(15, 23, 42, 0.08);

        border:
            1px solid #e2e8f0;

        transition: 0.3s;
    }


    .rental-card:hover {

        transform:
            translateY(-5px);

        box-shadow:
            0 15px 35px
            rgba(15, 23, 42, 0.14);
    }


    /* =========================
       CAR HEADER
    ========================= */

    .car-header {

        display: flex;

        align-items: center;

        gap: 15px;

        margin-bottom: 25px;
    }


    .car-icon {

        width: 55px;

        height: 55px;

        display: flex;

        justify-content: center;

        align-items: center;

        background: #dbeafe;

        border-radius: 50%;

        font-size: 28px;
    }


    .car-name {

        color: #2563eb;

        font-size: 21px;

        font-weight: 700;
    }


    .registration {

        margin-top: 4px;

        color: #64748b;

        font-size: 13px;
    }


    /* =========================
       RENTAL DETAILS
    ========================= */

    .details {

        margin-top: 10px;
    }


    .detail {

        display: flex;

        justify-content: space-between;

        align-items: center;

        padding: 13px 0;

        border-bottom:
            1px solid #e2e8f0;
    }


    .detail span {

        color: #64748b;

        font-size: 14px;
    }


    .detail strong {

        color: #334155;

        font-size: 14px;
    }


    /* =========================
       TOTAL AMOUNT
    ========================= */

    .amount {

        margin-top: 20px;

        padding: 15px;

        background: #dcfce7;

        color: #15803d;

        border-radius: 9px;

        display: flex;

        justify-content: space-between;

        align-items: center;

        font-weight: 700;
    }


    .amount-value {

        font-size: 20px;
    }


    /* =========================
       STATUS
    ========================= */

    .status-container {

        margin-top: 20px;

        display: flex;

        justify-content: space-between;

        align-items: center;
    }


    .status-label {

        color: #64748b;

        font-size: 14px;
    }


    .status {

        padding: 7px 15px;

        background: #dcfce7;

        color: #15803d;

        border-radius: 20px;

        font-size: 13px;

        font-weight: 700;
    }


    /* =========================
       CONFIRMED MESSAGE
    ========================= */

    .confirmed-message {

        margin-top: 20px;

        padding: 13px;

        background: #eff6ff;

        color: #1d4ed8;

        border-radius: 8px;

        text-align: center;

        font-size: 13px;
    }


    /* =========================
       NO RENTALS
    ========================= */

    .empty-rentals {

        background: white;

        padding: 60px 30px;

        border-radius: 16px;

        text-align: center;

        box-shadow:
            0 8px 25px
            rgba(15, 23, 42, 0.08);
    }


    .empty-icon {

        font-size: 65px;

        margin-bottom: 20px;
    }


    .empty-rentals h2 {

        margin-bottom: 10px;

        color: #0f172a;
    }


    .empty-rentals p {

        color: #64748b;

        margin-bottom: 25px;
    }


    .browse-btn {

        display: inline-block;

        padding: 13px 25px;

        background: #2563eb;

        color: white;

        border-radius: 8px;

        text-decoration: none;

        font-weight: 600;

        cursor: pointer;

        transition: 0.3s;
    }


    .browse-btn:hover {

        background: #1d4ed8;

        transform:
            translateY(-2px);

        box-shadow:
            0 8px 20px
            rgba(37, 99, 235, 0.25);
    }


    /* =========================
       RESPONSIVE
    ========================= */

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

            padding: 35px 20px;
        }


        .rentals-grid {

            grid-template-columns: 1fr;
        }


        .detail {

            flex-direction: column;

            align-items: flex-start;

            gap: 5px;
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

        🚗 Devi
        <span>Car Rentals</span>

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


        <a href="${pageContext.request.contextPath}/user-logout">

            Logout

        </a>


    </div>


</nav>



<!-- =========================
     MAIN CONTENT
========================= -->

<div class="container">


    <div class="page-header">


        <h1>

            🚘 My Rentals

        </h1>


        <p>

            View all your confirmed car rentals.

        </p>


    </div>



    <!-- =========================
         NO CONFIRMED RENTALS
    ========================= -->

    <c:if test="${empty rentals}">


        <div class="empty-rentals">


            <div class="empty-icon">

                🚗

            </div>


            <h2>

                No Active Rentals

            </h2>


            <p>

                You don't have any confirmed
                car rentals yet.

            </p>


            <a
                href="${pageContext.request.contextPath}/cars"
                class="browse-btn">

                Browse Available Cars

            </a>


        </div>


    </c:if>



    <!-- =========================
         DISPLAY RENTALS
    ========================= -->

    <c:if test="${not empty rentals}">


        <div class="rentals-grid">


            <c:forEach
                var="rental"
                items="${rentals}">


                <div class="rental-card">


                    <!-- CAR HEADER -->

                    <div class="car-header">


                        <div class="car-icon">

                            🚘

                        </div>


                        <div>


                            <div class="car-name">

                                ${rental.carName}

                            </div>


                            <div class="registration">

                                ${rental.registrationNumber}

                            </div>


                        </div>


                    </div>



                    <!-- RENTAL DETAILS -->

                    <div class="details">


                        <div class="detail">


                            <span>

                                Booking ID

                            </span>


                            <strong>

                                #${rental.id}

                            </strong>


                        </div>



                        <div class="detail">


                            <span>

                                Pickup Date

                            </span>


                            <strong>

                                ${rental.pickupDate}

                            </strong>


                        </div>



                        <div class="detail">


                            <span>

                                Return Date

                            </span>


                            <strong>

                                ${rental.returnDate}

                            </strong>


                        </div>



                        <div class="detail">


                            <span>

                                Phone Number

                            </span>


                            <strong>

                                ${rental.phoneNumber}

                            </strong>


                        </div>


                    </div>



                    <!-- TOTAL AMOUNT -->

                    <div class="amount">


                        <span>

                            Total Amount

                        </span>


                        <span class="amount-value">

                            ₹${rental.totalAmount}

                        </span>


                    </div>



                    <!-- STATUS -->

                    <div class="status-container">


                        <span class="status-label">

                            Rental Status

                        </span>


                        <span class="status">

                            ✓ ${rental.status}

                        </span>


                    </div>



                    <div class="confirmed-message">

                        ✓ Your booking has been confirmed.
                        Have a safe journey!

                    </div>


                </div>


            </c:forEach>


        </div>


    </c:if>


</div>


</body>

</html>