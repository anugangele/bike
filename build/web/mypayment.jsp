<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bike Rental Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
    <div class="container mt-5">
        <h2 class="text-center">My Bike Rental Bookings</h2>
        <table class="table table-striped table-bordered mt-4">
            <thead class="table-dark">
                <tr>
                    <th>Booking ID</th>
                    <th>Bike_id</th>
                    <th>Payment Status</th>
                   
                   
                </tr>
            </thead>
            <tbody>
                <%
                    String userEmail = (String) session.getAttribute("user");
                    if (userEmail == null) {
                        response.sendRedirect("login.jsp");
                    } else {
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
                            PreparedStatement ps = con.prepareStatement("SELECT * FROM payments WHERE user_email = ?");
                            ps.setString(1, userEmail);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("bike_id") %></td>
                    <td><%= rs.getString("payment_status") %></td>
                  
                </tr>
                <%
                            }
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
