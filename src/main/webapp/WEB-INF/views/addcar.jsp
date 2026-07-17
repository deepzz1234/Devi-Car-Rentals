<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Add Car | Devi Car Rentals</title>

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
    }

    /* =========================
       NAVBAR
    ========================= */

    .navbar {
        height: 75px;

        background: #0f172a;
        color: white;

        display: flex;
        align-items: center;
        justify-content: space-between;

        padding: 0 6%;
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

    /* =========================
       MAIN CONTAINER
    ========================= */

    .container {
        width: 90%;
        max-width: 650px;

        margin: 40px auto;
    }

    /* =========================
       FORM CARD
    ========================= */

    .form-card {
        background: white;

        padding: 35px;

        border-radius: 15px;

        box-shadow:
            0 5px 20px rgba(0, 0, 0, 0.08);
    }

    .form-card h1 {
        color: #0f172a;

        margin-bottom: 8px;
    }

    .subtitle {
        color: #64748b;

        margin-bottom: 30px;
    }

    /* =========================
       FORM
    ========================= */

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;

        margin-bottom: 8px;

        color: #334155;

        font-weight: 600;
        font-size: 14px;
    }

    input,
    select {
        width: 100%;

        padding: 13px;

        border: 1px solid #cbd5e1;

        border-radius: 8px;

        font-size: 15px;

        outline: none;

        transition: 0.3s;
    }

    input:focus,
    select:focus {
        border-color: #2563eb;

        box-shadow:
            0 0 0 3px rgba(37, 99, 235, 0.10);
    }

    /* =========================
       FORM ROW
    ========================= */

    .row {
        display: grid;

        grid-template-columns: 1fr 1fr;

        gap: 20px;
    }

    /* =========================
       SUBMIT BUTTON
    ========================= */

    .submit-btn {
        width: 100%;

        padding: 14px;

        margin-top: 10px;

        background: #fbbf24;
        color: #111827;

        border: none;
        border-radius: 8px;

        font-size: 16px;
        font-weight: 700;

        cursor: pointer;

        transition: 0.3s;
    }

    .submit-btn:hover {
        background: #f59e0b;

        transform: translateY(-2px);
    }

    /* =========================
       RESPONSIVE
    ========================= */

    @media (max-width: 600px) {

        .row {
            grid-template-columns: 1fr;
            gap: 0;
        }
    }

</style>

</head>

<body>

<!-- =========================
     NAVBAR
========================= -->

<div class="navbar">

    <div class="logo">
        🚗 Devi <span>Car Rentals</span>
    </div>

    <a href="${pageContext.request.contextPath}/admin/cars"
       class="back-btn">
        ← Manage Cars
    </a>

</div>


<!-- =========================
     MAIN CONTENT
========================= -->

<div class="container">

    <div class="form-card">

        <h1>🚘 Add New Car</h1>

        <p class="subtitle">
            Enter the vehicle details below.
        </p>

        <form action="${pageContext.request.contextPath}/admin/cars/add"
              method="post">

            <!-- BRAND AND MODEL -->

            <div class="row">

                <div class="form-group">

                    <label for="brand">
                        Brand
                    </label>

                    <input type="text"
                           id="brand"
                           name="brand"
                           placeholder="Example: Honda"
                           required>

                </div>

                <div class="form-group">

                    <label for="model">
                        Model
                    </label>

                    <input type="text"
                           id="model"
                           name="model"
                           placeholder="Example: City"
                           required>

                </div>

            </div>


            <!-- REGISTRATION NUMBER -->

            <div class="form-group">

                <label for="registrationNumber">
                    Registration Number
                </label>

                <input type="text"
                       id="registrationNumber"
                       name="registrationNumber"
                       placeholder="Example: AP39AB1234"
                       required>

            </div>


            <!-- FUEL TYPE AND PRICE -->

            <div class="row">

                <div class="form-group">

                    <label for="fuelType">
                        Fuel Type
                    </label>

                    <select id="fuelType"
                            name="fuelType"
                            required>

                        <option value="">
                            Select Fuel Type
                        </option>

                        <option value="Petrol">
                            Petrol
                        </option>

                        <option value="Diesel">
                            Diesel
                        </option>

                        <option value="Electric">
                            Electric
                        </option>

                        <option value="CNG">
                            CNG
                        </option>

                    </select>

                </div>


                <div class="form-group">

                    <label for="pricePerDay">
                        Price Per Day (₹)
                    </label>

                    <input type="number"
                           id="pricePerDay"
                           name="pricePerDay"
                           placeholder="Example: 2500"
                           min="1"
                           step="0.01"
                           required>

                </div>

            </div>


            <!-- AVAILABILITY STATUS -->

            <div class="form-group">

                <label for="status">
                    Availability Status
                </label>

                <select id="status"
                        name="status"
                        required>

                    <option value="Available">
                        Available
                    </option>

                    <option value="Rented">
                        Rented
                    </option>

                    <option value="Maintenance">
                        Maintenance
                    </option>

                </select>

            </div>


            <!-- SUBMIT BUTTON -->

            <button type="submit"
                    class="submit-btn">
                + Add Car
            </button>

        </form>

    </div>

</div>

</body>

</html>