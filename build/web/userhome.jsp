<%-- 
    Document   : userhome
    Created on : Mar 27, 2025, 7:55:03 PM
    Author     : my computers
--%>
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
            background: url('./images/t1.jpg') no-repeat center center/cover;
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
            <a class="navbar-brand" href="#">Bike Rental &nbsp;&nbsp;&nbsp;&nbsp;  Welcome <%=session.getAttribute("user")%></a>
           
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
        


<div style="text-align:center;">
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM bikes WHERE availability = 1");

        while(rs.next()) {
%>
            <div class="bike-card">
                <img src="displayImage.jsp?id=<%= rs.getInt("id") %>" alt="<%= rs.getString("name") %>">
                <h3><%= rs.getString("name") %> (<%= rs.getString("model") %>)</h3>
                <p>Rent: ?<%= rs.getDouble("rent_price") %>/day</p>
                <form action="payment.jsp" method="post">
                    <input type="hidden" name="bike_id" value="<%= rs.getInt("id") %>">
                    <button type="submit" class="book-btn">Book Now</button>
                   
                </form>
            </div>
<%
        }
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</div>
    </div>
 <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>&copy; 2025 Bike Rental. All Rights Reserved.</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>