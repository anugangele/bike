<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"><%@ page import="java.sql.*, java.io.*" %>
<html>
    <head>
<%
    int bikeId = Integer.parseInt(request.getParameter("bike_id"));
    String customerName = request.getParameter("customer_name");
    String customerContact = request.getParameter("customer_contact");
    int days = Integer.parseInt(request.getParameter("days"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");

        // Booking ko store karna
        PreparedStatement ps = con.prepareStatement("INSERT INTO bookings (bike_id, customer_name, customer_contact, days) VALUES (?, ?, ?, ?)");
        ps.setInt(1, bikeId);
        ps.setString(2, customerName);
        ps.setString(3, customerContact);
        ps.setInt(4, days);
        ps.executeUpdate();

        // Bike ko unavailable karna
        PreparedStatement updatePs = con.prepareStatement("UPDATE bikes SET availability = 0 WHERE id = ?");
        updatePs.setInt(1, bikeId);
        updatePs.executeUpdate();

        con.close();
        %>
  
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">



    <title>Bike Rental</title>
    <style>
        .bike-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            margin: 15px;
            display: inline-block;
            width: 250px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }
        .bike-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
        }
        .book-btn {
            background-color: green;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
    <style>
        .hero {
            background: url('i2.jpg') no-repeat center center/cover;
            height: 60vh;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Bike Rental</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="userhome.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="mybooking.jsp">MyBooking</a></li>
                    <li class="nav-item"><a class="nav-link" href="mypayment.jsp">My Payment</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-primary text-white" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="hero">
           
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Bike Rental</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="userhome.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="mybooking.jsp">MyBooking</a></li>
                    <li class="nav-item"><a class="nav-link" href="mypayment.jsp">My Payment</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-primary text-white" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
           <div class="container mt-5"><h2>Booking Confirmed!</h2>
           <%
        out.println("<p>Thank you, " + customerName + ". Your bike has been booked for " + days + " days.</p>");
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</div> 