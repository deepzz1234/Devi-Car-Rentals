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

<title>Manage Rentals | Devi Car Rentals</title>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Arial, sans-serif;
    }

    body {
        background: #f1f5f9;
        color: #1e293b;
    }

    .navbar {
        height: 75px;
        padding: 0 5%;

        display: flex;
        align-items: center;
        justify-content: space-between;

        background: #0f172a;
        color: white;
    }

    .logo {
        font-size: 22px;
        font-weight: bold;
    }

    .logo span {
        color: #fbbf24;
    }

    .back-btn {
        padding: 10px 18px;

        background: #2563eb;
        color: white;

        text-decoration: none;
        border-radius: 7px;

        cursor: pointer;
        transition: 0.3s;
    }

    .back-btn:hover {
        background: #1d4ed8;
        transform: translateY(-2px);
    }

    .container {
        width: 95%;
        max-width: 1400px;

        margin: 40px auto;
    }

    .header {
        margin-bottom: 30px;
    }

    .header h1 {
        color: #0f172a;
        margin-bottom: 7px;
    }

    .header p {
        color: #64748b;
    }

    .table-container {
        background: white;

        border-radius: 15px;

        overflow-x: auto;

        box-shadow:
            0 5px 20px rgba(0, 0, 0, 0.08);
    }

    table {
        width: 100%;
        min-width: 1000px;

        border-collapse: collapse;
    }

    th {
        padding: 16px;

        background: #172554;
        color: white;

        text-align: left;
        font-size: 14px;
    }

    td {
        padding: 16px;

        border-bottom: 1px solid #e2e8f0;

        font-size: 14px;
    }

    tbody tr:hover {
        background: #f8fafc;
    }

    .status {
        display: inline-block;

        padding: 6px 12px;

        background: #dbeafe;
        color: #1d4ed8;

        border-radius: 20px;

        font-size: 12px;
        font-weight: 600;
    }

    .action-btn {
        display: inline-block;

        padding: 8px 12px;

        margin: 2px;

        text-decoration: none;

        border-radius: 6px;

        font-size: 13px;

        cursor: pointer;
        transition: 0.3s;
    }

    .complete-btn {
        background: #dcfce7;
        color: #166534;
    }

    .complete-btn:hover {
        background: #16a34a;
        color: white;
    }

    .delete-btn {
        background: #fee2e2;
        color: #dc2626;
    }

    .delete-btn:hover {
        background: #dc2626;
        color: white;
    }

    .empty {
        padding: 50px;

        text-align: center;

        color: #64748b;
    }

</style>


</head>

<body>


<div class="navbar">

    <div class="logo">
        🚗 Devi <span>Car Rentals</span>
    </div>

    <a href="${pageContext.request.contextPath}/admin-dashboard"
       class="back-btn">

        ← Dashboard

    </a>

</div>


<div class="container">

    <div class="header">

        <h1>🔑 Manage Rentals</h1>

        <p>
            View and manage all active and completed rentals.
        </p>

    </div>


    <div class="table-container">

        <table>

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Customer</th>
                    <th>Car</th>
                    <th>Registration</th>
                    <th>Pickup Date</th>
                    <th>Return Date</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Actions</th>

                </tr>

            </thead>


            <tbody>

                <c:forEach var="rental"
                           items="${rentals}">

                    <tr>

                        <td>${rental.id}</td>

                        <td>${rental.customerName}</td>

                        <td>${rental.carName}</td>

                        <td>${rental.registrationNumber}</td>

                        <td>${rental.pickupDate}</td>

                        <td>${rental.returnDate}</td>

                        <td>₹${rental.totalAmount}</td>

                        <td>

                            <span class="status">
                                ${rental.status}
                            </span>

                        </td>

                        <td>

                            <a href="${pageContext.request.contextPath}/admin/rentals/complete/${rental.id}"
                               class="action-btn complete-btn">

                                Complete

                            </a>

                            <a href="${pageContext.request.contextPath}/admin/rentals/delete/${rental.id}"
                               class="action-btn delete-btn"
                               onclick="return confirm('Delete this rental record?')">

                                Delete

                            </a>

                        </td>

                    </tr>

                </c:forEach>


                <c:if test="${empty rentals}">

                    <tr>

                        <td colspan="9"
                            class="empty">

                            🔑 No rental records available yet.

                        </td>

                    </tr>

                </c:if>

            </tbody>

        </table>

    </div>

</div>


</body>

</html>
