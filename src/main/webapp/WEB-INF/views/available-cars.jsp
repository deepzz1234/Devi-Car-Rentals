<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Available Cars | Devi Car Rentals</title>

    <style>

        * {
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f1f5f9;
        }

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
            font-weight: bold;
        }

        .logo span {
            color: #fbbf24;
        }

        .back-btn {
            color: white;
            text-decoration: none;
        }

        .container {
            padding: 50px 8%;
        }

        h1 {
            color: #0f172a;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #64748b;
            margin-bottom: 35px;
        }

        .cars-grid {
            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(270px, 1fr));

            gap: 25px;
        }

        .car-card {
            background: white;
            padding: 30px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px
                rgba(15,23,42,0.08);

            transition: 0.3s;
        }

        .car-card:hover {
            transform: translateY(-7px);

            box-shadow:
                0 15px 35px
                rgba(15,23,42,0.15);
        }

        .car-icon {
            font-size: 55px;
            text-align: center;
            margin-bottom: 20px;
        }

        .car-card h2 {
            color: #0f172a;
            margin-bottom: 15px;
        }

        .detail {
            margin: 10px 0;
            color: #64748b;
        }

        .price {
            margin-top: 20px;

            color: #16a34a;

            font-size: 22px;
            font-weight: bold;
        }

        .book-btn {
            display: block;

            margin-top: 20px;

            padding: 12px;

            background: #2563eb;

            color: white;

            text-align: center;

            text-decoration: none;

            border-radius: 8px;

            font-weight: 600;

            transition: 0.3s;
        }

        .book-btn:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        .empty-message {
            padding: 40px;
            background: white;

            text-align: center;

            border-radius: 15px;

            color: #64748b;
        }

    </style>

</head>

<body>

<nav class="navbar">

    <div class="logo">
        🚗 Devi <span>Car Rentals</span>
    </div>

    <a href="${pageContext.request.contextPath}/user-dashboard"
       class="back-btn">

        ← Dashboard

    </a>

</nav>


<div class="container">

    <h1>Available Cars</h1>

    <p class="subtitle">
        Choose the perfect car for your journey.
    </p>


    <c:choose>

        <c:when test="${empty cars}">

            <div class="empty-message">
                No cars are currently available.
            </div>

        </c:when>


        <c:otherwise>

            <div class="cars-grid">

                <c:forEach var="car" items="${cars}">

                    <div class="car-card">

                        <div class="car-icon">
                            🚘
                        </div>

                        <h2>
                            ${car.brand} ${car.model}
                        </h2>

                        <div class="detail">
                            Registration:
                            ${car.registrationNumber}
                        </div>

                        <div class="price">
                            ₹${car.pricePerDay} / day
                        </div>

                        <a href="${pageContext.request.contextPath}/book-car/${car.id}"
                           class="book-btn">

                            Book Now

                        </a>

                    </div>

                </c:forEach>

            </div>

        </c:otherwise>

    </c:choose>

</div>

</body>
</html>