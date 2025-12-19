<%@ page import="java.sql.*" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
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
    <p>  <p>  <p>  <p>  <p>  <p>  <p>  <p>
    <div align="center">
<%
String bikeId = request.getParameter("bike_id");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM bikes WHERE id=" + bikeId);
rs.next();
%>

    <h3>Bike <%= rs.getString("name") %> Booked Successfully!</h3>
    <a href="userhome.jsp">Back to Home</a>
</body>
</html>