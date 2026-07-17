<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Manage Cars | Devi Car Rentals</title>

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

        display: flex;

        align-items: center;

        justify-content: space-between;

        padding: 0 6%;

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

        color: white;

        text-decoration: none;

        padding: 10px 18px;

        background: #2563eb;

        border-radius: 7px;

        cursor: pointer;

        transition: 0.3s;
    }

    .back-btn:hover {

        background: #1d4ed8;

        transform: translateY(-2px);
    }

    .container {

        width: 90%;

        max-width: 1200px;

        margin: 40px auto;
    }

    .header {

        display: flex;

        justify-content: space-between;

        align-items: center;

        margin-bottom: 30px;
    }

    .header h1 {

        color: #0f172a;
    }

    .header p {

        margin-top: 5px;

        color: #64748b;
    }

    .add-btn {

        padding: 12px 20px;

        background: #fbbf24;

        color: #111827;

        text-decoration: none;

        border-radius: 8px;

        font-weight: 600;

        cursor: pointer;

        transition: 0.3s;
    }

    .add-btn:hover {

        background: #f59e0b;

        transform: translateY(-3px);
    }

    .table-container {

        background: white;

        border-radius: 15px;

        overflow: hidden;

        box-shadow:
            0 5px 20px rgba(0,0,0,0.08);
    }

    table {

        width: 100%;

        border-collapse: collapse;
    }

    th {

        background: #172554;

        color: white;

        padding: 16px;

        text-align: left;
    }

    td {

        padding: 16px;

        border-bottom:
            1px solid #e2e8f0;
    }

    tr:hover {

        background: #f8fafc;
    }

    .status {

        padding: 6px 12px;

        background: #dcfce7;

        color: #166534;

        border-radius: 20px;

        font-size: 13px;

        font-weight: 600;
    }

    .edit-btn,
    .delete-btn {

        display: inline-block;

        padding: 7px 12px;

        text-decoration: none;

        border-radius: 6px;

        margin-right: 5px;

        cursor: pointer;

        transition: 0.3s;
    }

    .edit-btn {

        background: #dbeafe;

        color: #1d4ed8;
    }

    .edit-btn:hover {

        background: #2563eb;

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
```

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


    <div>

        <h1>Manage Cars</h1>

        <p>
            Add, update and manage your rental vehicles.
        </p>

    </div>


    <a href="${pageContext.request.contextPath}/admin/cars/add"
       class="add-btn">

        + Add New Car

    </a>


</div>



<div class="table-container">


    <table>


        <thead>

            <tr>

                <th>ID</th>

                <th>Brand</th>

                <th>Model</th>

                <th>Registration</th>

                <th>Fuel</th>

                <th>Price / Day</th>

                <th>Status</th>

                <th>Actions</th>

            </tr>

        </thead>



        <tbody>


            <c:forEach var="car" items="${cars}">

                <tr>

                    <td>
                        ${car.id}
                    </td>

                    <td>
                        ${car.brand}
                    </td>

                    <td>
                        ${car.model}
                    </td>

                    <td>
                        ${car.registrationNumber}
                    </td>

                    <td>
                        ${car.fuelType}
                    </td>

                    <td>
                        ₹${car.pricePerDay}
                    </td>

                    <td>

                        <span class="status">

                            ${car.status}

                        </span>

                    </td>


                    <td>

                        <a href="${pageContext.request.contextPath}/admin/cars/edit/${car.id}"
                           class="edit-btn">

                            Edit

                        </a>


                        <a href="${pageContext.request.contextPath}/admin/cars/delete/${car.id}"
                           class="delete-btn"
                           onclick="return confirm('Are you sure you want to delete this car?')">

                            Delete

                        </a>

                    </td>


                </tr>

            </c:forEach>


            <c:if test="${empty cars}">

                <tr>

                    <td colspan="8"
                        class="empty">

                        🚘 No cars available.
                        Click "Add New Car" to add your first car.

                    </td>

                </tr>

            </c:if>


        </tbody>


    </table>


</div>


</div>

</body>

</html>
