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

<title>
    Manage Bookings | Devi Car Rentals
</title>

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

        background: #0f172a;

        color: white;

        display: flex;

        align-items: center;

        justify-content: space-between;

        padding: 0 5%;
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
            0 5px 20px rgba(0,0,0,0.08);
    }

    table {

        width: 100%;

        border-collapse: collapse;

        min-width: 1100px;
    }

    th {

        background: #172554;

        color: white;

        padding: 15px;

        text-align: left;

        font-size: 14px;
    }

    td {

        padding: 15px;

        border-bottom:
            1px solid #e2e8f0;

        font-size: 14px;
    }

    tbody tr:hover {

        background: #f8fafc;
    }

    .status {

        display: inline-block;

        padding: 6px 12px;

        border-radius: 20px;

        background: #fef3c7;

        color: #92400e;

        font-size: 12px;

        font-weight: 600;
    }

    .action-btn {

        display: inline-block;

        padding: 7px 10px;

        margin: 2px;

        border-radius: 6px;

        text-decoration: none;

        font-size: 12px;

        cursor: pointer;

        transition: 0.3s;
    }

    .confirm-btn {

        background: #dcfce7;

        color: #166534;
    }

    .confirm-btn:hover {

        background: #16a34a;

        color: white;
    }

    .cancel-btn {

        background: #fef3c7;

        color: #92400e;
    }

    .cancel-btn:hover {

        background: #f59e0b;

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

    🚗 Devi
    <span>Car Rentals</span>

</div>


<a href="${pageContext.request.contextPath}/admin-dashboard"
   class="back-btn">

    ← Dashboard

</a>


</div>

<div class="container">


<div class="header">

    <h1>
        📅 Manage Bookings
    </h1>

    <p>
        View and manage all customer car bookings.
    </p>

</div>



<div class="table-container">

    <table>

        <thead>

            <tr>

                <th>ID</th>

                <th>Customer</th>

                <th>Phone</th>

                <th>Car</th>

                <th>Registration</th>

                <th>Pickup</th>

                <th>Return</th>

                <th>Amount</th>

                <th>Status</th>

                <th>Actions</th>

            </tr>

        </thead>


        <tbody>


            <c:forEach var="booking"
                       items="${bookings}">

                <tr>

                    <td>
                        ${booking.id}
                    </td>

                    <td>
                        ${booking.customerName}
                    </td>

                    <td>
                        ${booking.phoneNumber}
                    </td>

                    <td>
                        ${booking.carName}
                    </td>

                    <td>
                        ${booking.registrationNumber}
                    </td>

                    <td>
                        ${booking.pickupDate}
                    </td>

                    <td>
                        ${booking.returnDate}
                    </td>

                    <td>
                        ₹${booking.totalAmount}
                    </td>

                    <td>

                        <span class="status">

                            ${booking.status}

                        </span>

                    </td>


                    <td>

                        <a
                            href="${pageContext.request.contextPath}/admin/bookings/confirm/${booking.id}"
                            class="action-btn confirm-btn">

                            Confirm

                        </a>


                        <a
                            href="${pageContext.request.contextPath}/admin/bookings/cancel/${booking.id}"
                            class="action-btn cancel-btn">

                            Cancel

                        </a>


                        <a
                            href="${pageContext.request.contextPath}/admin/bookings/delete/${booking.id}"
                            class="action-btn delete-btn"
                            onclick="return confirm('Delete this booking?')">

                            Delete

                        </a>

                    </td>


                </tr>

            </c:forEach>



            <c:if test="${empty bookings}">

                <tr>

                    <td colspan="10"
                        class="empty">

                        📅 No bookings available yet.

                    </td>

                </tr>

            </c:if>


        </tbody>

    </table>

</div>


</div>

</body>

</html>
