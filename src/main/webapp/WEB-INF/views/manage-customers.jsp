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
    Manage Customers | Devi Car Rentals
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


    /* NAVBAR */

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



    /* MAIN CONTAINER */

    .container {

        width: 92%;

        max-width: 1200px;

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



    /* STATS */

    .stats {

        display: flex;

        gap: 20px;

        margin-bottom: 30px;
    }


    .stat-card {

        background: white;

        padding: 20px 25px;

        border-radius: 12px;

        box-shadow:
            0 5px 15px rgba(0,0,0,0.07);
    }


    .stat-card h2 {

        color: #2563eb;

        margin-bottom: 5px;
    }


    .stat-card p {

        color: #64748b;

        font-size: 14px;
    }



    /* TABLE */

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

        font-size: 14px;
    }


    td {

        padding: 16px;

        border-bottom:
            1px solid #e2e8f0;

        font-size: 14px;
    }


    tbody tr {

        transition: 0.2s;
    }


    tbody tr:hover {

        background: #f8fafc;
    }



    /* CUSTOMER AVATAR */

    .customer-info {

        display: flex;

        align-items: center;

        gap: 12px;
    }


    .avatar {

        width: 40px;

        height: 40px;

        display: flex;

        align-items: center;

        justify-content: center;

        background: #dbeafe;

        color: #1d4ed8;

        border-radius: 50%;

        font-size: 18px;
    }


    .customer-name {

        font-weight: 600;

        color: #0f172a;
    }



    /* DELETE BUTTON */

    .delete-btn {

        display: inline-block;

        padding: 8px 13px;

        background: #fee2e2;

        color: #dc2626;

        text-decoration: none;

        border-radius: 6px;

        cursor: pointer;

        transition: 0.3s;
    }


    .delete-btn:hover {

        background: #dc2626;

        color: white;

        transform: translateY(-2px);
    }



    /* EMPTY MESSAGE */

    .empty {

        padding: 50px;

        text-align: center;

        color: #64748b;
    }



    /* RESPONSIVE */

    @media(max-width: 700px) {

        .table-container {

            overflow-x: auto;
        }


        table {

            min-width: 750px;
        }

    }

</style>


</head>

<body>

<!-- NAVBAR -->

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

<!-- MAIN CONTENT -->

<div class="container">


<div class="header">


    <h1>

        👥 Manage Customers

    </h1>


    <p>

        View and manage all registered customers.

    </p>


</div>



<!-- CUSTOMER COUNT -->

<div class="stats">


    <div class="stat-card">


        <h2>

            ${customers.size()}

        </h2>


        <p>

            Total Registered Customers

        </p>


    </div>


</div>



<!-- CUSTOMERS TABLE -->

<div class="table-container">


    <table>


        <thead>


            <tr>

                <th>ID</th>

                <th>Customer</th>

                <th>Email</th>

                <th>Phone Number</th>

                <th>Action</th>

            </tr>


        </thead>



        <tbody>


            <c:forEach var="customer"
                       items="${customers}">


                <tr>


                    <td>

                        ${customer.id}

                    </td>



                    <td>


                        <div class="customer-info">


                            <div class="avatar">

                                👤

                            </div>


                            <div class="customer-name">

                                ${customer.name}

                            </div>


                        </div>


                    </td>



                    <td>

                        ${customer.email}

                    </td>



                    <td>

                        ${customer.phoneNumber}

                    </td>



                    <td>


                        <a
                            href="${pageContext.request.contextPath}/admin/customers/delete/${customer.id}"
                            class="delete-btn"
                            onclick="return confirm('Are you sure you want to delete this customer?')">

                            Delete

                        </a>


                    </td>


                </tr>


            </c:forEach>



            <c:if test="${empty customers}">


                <tr>


                    <td colspan="5"
                        class="empty">

                        👥 No registered customers yet.

                    </td>


                </tr>


            </c:if>


        </tbody>


    </table>


</div>


</div>

</body>

</html>
