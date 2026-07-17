<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Book Car | Devi Car Rentals</title>

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
        padding: 20px 8%;
        background: #0f172a;
        color: white;

        display: flex;
        justify-content: space-between;
        align-items: center;

        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
    }

    .logo {
        font-size: 23px;
        font-weight: 700;
        letter-spacing: 0.5px;
    }

    .logo span {
        color: #fbbf24;
    }

    .back {
        color: #cbd5e1;
        text-decoration: none;
        font-size: 15px;
        cursor: pointer;
        transition: 0.3s;
    }

    .back:hover {
        color: #fbbf24;
        transform: translateX(-3px);
    }


    /* =========================
       MAIN CONTAINER
    ========================= */

    .container {
        max-width: 700px;
        margin: 50px auto;
        padding: 20px;
    }


    /* =========================
       BOOKING CARD
    ========================= */

    .booking-card {
        background: white;
        padding: 40px;

        border-radius: 18px;

        box-shadow:
            0 15px 40px
            rgba(15, 23, 42, 0.12);
    }

    .booking-card h1 {
        color: #0f172a;
        font-size: 30px;
        margin-bottom: 8px;
    }

    .subtitle {
        color: #64748b;
        margin-bottom: 30px;
    }


    /* =========================
       CAR INFORMATION
    ========================= */

    .car-info {
        padding: 25px;
        background: #f8fafc;

        border: 1px solid #e2e8f0;
        border-radius: 12px;

        margin-bottom: 30px;
    }

    .car-header {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 20px;
    }

    .car-icon {
        width: 55px;
        height: 55px;

        display: flex;
        justify-content: center;
        align-items: center;

        background: #dbeafe;
        border-radius: 50%;

        font-size: 30px;
    }

    .car-info h2 {
        color: #2563eb;
        font-size: 23px;
    }

    .car-details {
        display: grid;
        gap: 12px;
    }

    .detail {
        display: flex;
        justify-content: space-between;

        padding-bottom: 10px;

        border-bottom:
            1px solid #e2e8f0;

        color: #64748b;
    }

    .detail strong {
        color: #334155;
    }

    .price {
        margin-top: 20px;

        padding: 15px;

        background: #dcfce7;

        color: #15803d;

        border-radius: 8px;

        text-align: center;

        font-size: 21px;
        font-weight: 700;
    }


    /* =========================
       ERROR MESSAGE
    ========================= */

    .error-message {
        background: #fee2e2;
        color: #dc2626;

        padding: 13px 15px;

        border-radius: 8px;

        margin-bottom: 20px;

        font-size: 14px;
    }


    /* =========================
       FORM
    ========================= */

    .form-title {
        margin-bottom: 20px;
        color: #0f172a;
        font-size: 20px;
    }

    .form-group {
        margin-bottom: 22px;
    }

    label {
        display: block;

        margin-bottom: 8px;

        color: #334155;

        font-size: 14px;
        font-weight: 600;
    }

    input {
        width: 100%;

        padding: 14px 15px;

        border: 1px solid #cbd5e1;
        border-radius: 8px;

        font-size: 15px;

        outline: none;

        transition: 0.3s;
    }

    input:focus {
        border-color: #2563eb;

        box-shadow:
            0 0 0 3px
            rgba(37, 99, 235, 0.12);
    }


    /* =========================
       BUTTON
    ========================= */

    .book-btn {
        width: 100%;

        padding: 15px;

        margin-top: 5px;

        border: none;
        border-radius: 9px;

        background: #2563eb;

        color: white;

        font-size: 16px;
        font-weight: 700;

        cursor: pointer;

        transition: 0.3s;
    }

    .book-btn:hover {
        background: #1d4ed8;

        transform: translateY(-2px);

        box-shadow:
            0 10px 25px
            rgba(37, 99, 235, 0.3);
    }


    /* =========================
       NOTE
    ========================= */

    .booking-note {
        margin-top: 20px;

        padding: 13px;

        background: #fffbeb;

        color: #92400e;

        border-radius: 8px;

        font-size: 13px;

        text-align: center;
    }


    /* =========================
       RESPONSIVE
    ========================= */

    @media(max-width: 600px) {

        .navbar {
            padding: 18px 20px;
        }

        .logo {
            font-size: 19px;
        }

        .container {
            margin: 25px auto;
            padding: 15px;
        }

        .booking-card {
            padding: 25px 20px;
        }

        .detail {
            flex-direction: column;
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
        🚗 Devi <span>Car Rentals</span>
    </div>

    <a href="${pageContext.request.contextPath}/cars"
       class="back">

        ← Available Cars

    </a>

</nav>



<!-- =========================
     MAIN CONTENT
========================= -->

<div class="container">

    <div class="booking-card">


        <h1>Book Your Car</h1>

        <p class="subtitle">
            Enter your booking details and confirm your reservation.
        </p>



        <!-- =========================
             CAR DETAILS
        ========================= -->

        <div class="car-info">


            <div class="car-header">

                <div class="car-icon">
                    🚘
                </div>

                <div>

                    <h2>
                        ${car.brand} ${car.model}
                    </h2>

                </div>

            </div>



            <div class="car-details">


                <div class="detail">

                    <span>
                        Registration Number
                    </span>

                    <strong>
                        ${car.registrationNumber}
                    </strong>

                </div>



                <div class="detail">

                    <span>
                        Fuel Type
                    </span>

                    <strong>
                        ${car.fuelType}
                    </strong>

                </div>



                <div class="detail">

                    <span>
                        Status
                    </span>

                    <strong>
                        ${car.status}
                    </strong>

                </div>


            </div>



            <div class="price">

                ₹${car.pricePerDay} / Day

            </div>


        </div>



        <!-- =========================
             ERROR MESSAGE
        ========================= -->

        <% if (request.getAttribute("error") != null) { %>

            <div class="error-message">

                ⚠ ${error}

            </div>

        <% } %>



        <!-- =========================
             BOOKING FORM
        ========================= -->

        <h3 class="form-title">
            Booking Details
        </h3>


        <form
            action="${pageContext.request.contextPath}/book-car"
            method="post">


            <!-- Selected Car ID -->

            <input
                type="hidden"
                name="carId"
                value="${car.id}">



            <!-- Phone Number -->

            <div class="form-group">

                <label>
                    Phone Number
                </label>

                <input
                    type="tel"
                    name="phoneNumber"
                    placeholder="Enter your 10-digit phone number"
                    pattern="[0-9]{10}"
                    maxlength="10"
                    title="Please enter a valid 10-digit phone number"
                    required>

            </div>



            <!-- Pickup Date -->

            <div class="form-group">

                <label>
                    Pickup Date
                </label>

                <input
                    type="date"
                    name="startDate"
                    id="startDate"
                    required>

            </div>



            <!-- Return Date -->

            <div class="form-group">

                <label>
                    Return Date
                </label>

                <input
                    type="date"
                    name="endDate"
                    id="endDate"
                    required>

            </div>



            <!-- CONFIRM BUTTON -->

            <button
                type="submit"
                class="book-btn">

                Confirm Booking

            </button>


        </form>



        <div class="booking-note">

            Your booking will be submitted for confirmation.

        </div>


    </div>

</div>



<!-- =========================
     DATE VALIDATION
========================= -->

<script>

    // Get today's date

    const today =
        new Date()
        .toISOString()
        .split("T")[0];


    const startDate =
        document.getElementById("startDate");

    const endDate =
        document.getElementById("endDate");


    // User cannot select past dates

    startDate.min = today;

    endDate.min = today;


    // Return date cannot be
    // before pickup date

    startDate.addEventListener(
        "change",
        function() {

            endDate.min =
                this.value;

            if (
                endDate.value &&
                endDate.value < this.value
            ) {

                endDate.value = "";

            }

        }
    );

</script>


</body>

</html>