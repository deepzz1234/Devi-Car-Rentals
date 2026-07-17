<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

```
<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Edit Car | Devi Car Rentals</title>

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

        color: #1e293b;
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

        cursor: pointer;
    }


    .logo span {

        color: #fbbf24;
    }


    .back-btn {

        display: inline-block;

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

        max-width: 700px;

        margin: 40px auto;
    }



    /* =========================
       FORM CARD
    ========================= */

    .form-card {

        background: white;

        padding: 40px;

        border-radius: 16px;

        box-shadow:
            0 8px 25px rgba(0, 0, 0, 0.08);
    }


    .header {

        margin-bottom: 30px;
    }


    .header-icon {

        width: 55px;

        height: 55px;

        display: flex;

        justify-content: center;

        align-items: center;

        background: #dbeafe;

        border-radius: 12px;

        font-size: 27px;

        margin-bottom: 15px;
    }


    .header h1 {

        color: #0f172a;

        margin-bottom: 7px;
    }


    .header p {

        color: #64748b;
    }



    /* =========================
       FORM
    ========================= */

    .form-group {

        margin-bottom: 20px;
    }


    .form-row {

        display: grid;

        grid-template-columns:
            1fr 1fr;

        gap: 20px;
    }


    label {

        display: block;

        margin-bottom: 8px;

        color: #334155;

        font-size: 14px;

        font-weight: 600;
    }


    input,
    select {

        width: 100%;

        padding: 13px 14px;

        border:
            1px solid #cbd5e1;

        border-radius: 8px;

        font-size: 15px;

        outline: none;

        background: white;

        transition: 0.3s;
    }


    input:focus,
    select:focus {

        border-color: #2563eb;

        box-shadow:
            0 0 0 3px
            rgba(37, 99, 235, 0.10);
    }



    /* =========================
       BUTTONS
    ========================= */

    .buttons {

        display: flex;

        gap: 15px;

        margin-top: 30px;
    }


    .update-btn {

        flex: 1;

        padding: 14px;

        border: none;

        border-radius: 8px;

        background: #fbbf24;

        color: #111827;

        font-size: 16px;

        font-weight: 700;

        cursor: pointer;

        transition: 0.3s;
    }


    .update-btn:hover {

        background: #f59e0b;

        transform: translateY(-2px);

        box-shadow:
            0 8px 20px
            rgba(251, 191, 36, 0.25);
    }


    .cancel-btn {

        flex: 1;

        display: flex;

        justify-content: center;

        align-items: center;

        padding: 14px;

        background: #e2e8f0;

        color: #334155;

        text-decoration: none;

        border-radius: 8px;

        font-weight: 600;

        cursor: pointer;

        transition: 0.3s;
    }


    .cancel-btn:hover {

        background: #cbd5e1;

        transform: translateY(-2px);
    }



    /* =========================
       CAR ID
    ========================= */

    .car-id {

        display: inline-block;

        margin-bottom: 20px;

        padding: 7px 14px;

        background: #f1f5f9;

        color: #64748b;

        border-radius: 20px;

        font-size: 13px;
    }



    /* =========================
       RESPONSIVE
    ========================= */

    @media(max-width: 600px) {

        .form-card {

            padding: 30px 20px;
        }


        .form-row {

            grid-template-columns: 1fr;

            gap: 0;
        }


        .buttons {

            flex-direction: column;
        }

    }

</style>
```

</head>

<body>

<!-- =========================
     NAVBAR
========================= -->

<div class="navbar">


<div class="logo">

    🚗 Devi
    <span>Car Rentals</span>

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

```
<div class="form-card">


    <div class="header">


        <div class="header-icon">

            ✏️

        </div>


        <h1>

            Edit Car

        </h1>


        <p>

            Update the vehicle information below.

        </p>


    </div>



    <div class="car-id">

        Car ID: ${car.id}

    </div>



    <!-- =========================
         EDIT FORM
    ========================= -->

    <form action="${pageContext.request.contextPath}/admin/cars/update"
          method="post">


        <!-- IMPORTANT:
             Hidden ID tells JPA which car to update
        -->

        <input type="hidden"
               name="id"
               value="${car.id}">



        <!-- BRAND AND MODEL -->

        <div class="form-row">


            <div class="form-group">

                <label>

                    Brand

                </label>


                <input type="text"
                       name="brand"
                       value="${car.brand}"
                       placeholder="Enter car brand"
                       required>

            </div>



            <div class="form-group">

                <label>

                    Model

                </label>


                <input type="text"
                       name="model"
                       value="${car.model}"
                       placeholder="Enter car model"
                       required>

            </div>


        </div>



        <!-- REGISTRATION NUMBER -->

        <div class="form-group">


            <label>

                Registration Number

            </label>


            <input type="text"
                   name="registrationNumber"
                   value="${car.registrationNumber}"
                   placeholder="Example: AP39AB1234"
                   required>


        </div>



        <!-- FUEL AND PRICE -->

        <div class="form-row">


            <div class="form-group">


                <label>

                    Fuel Type

                </label>


                <select name="fuelType"
                        required>


                    <option value="${car.fuelType}">

                        ${car.fuelType}

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


                <label>

                    Price Per Day (₹)

                </label>


                <input type="number"
                       name="pricePerDay"
                       value="${car.pricePerDay}"
                       min="1"
                       required>


            </div>


        </div>



        <!-- STATUS -->

        <div class="form-group">


            <label>

                Availability Status

            </label>


            <select name="status"
                    required>


                <option value="${car.status}">

                    ${car.status}

                </option>


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



        <!-- BUTTONS -->

        <div class="buttons">


            <button type="submit"
                    class="update-btn">

                ✓ Update Car

            </button>


            <a href="${pageContext.request.contextPath}/admin/cars"
               class="cancel-btn">

                Cancel

            </a>


        </div>


    </form>


</div>


</div>

</body>

</html>
