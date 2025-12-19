<%@ page import="java.sql.*, java.io.*" %>
<%@ include file="dbconfig.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bike Rental - Admin</title>
     <link rel="stylesheet" href="adminpanel.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
     <div class="admin-container">
        <header>
            <h1>Bike Rental Admin Panel</h1>
            <nav>
                <ul>
                    <li><a href="adminhome.jsp">Dashboard</a></li>
                    <li><a href="manage_bikes.jsp">Manage Bikes</a></li>
                    <li><a href="manage_rentals.jsp">Manage Rentals</a></li>
                    <li><a href="manage_customers.jsp">Manage Customers</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </header>
    <div class="container mt-5">
        <%
       try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM bookings");
            
            out.println("<html><head><title>Admin Booking Details</title>");
            out.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
            out.println("</head><body class='container mt-5'>");
            out.println("<h2 class='mb-4'>Booking Details</h2>");
            out.println("<table class='table table-bordered'><tr><th>Bike ID</th><th>Customer Name</th><th>Contact</th><th>Booking Date</th><th>No of Days</th><th>Action</th></tr>");
            
            while (rs.next()) {
                int bookingId = rs.getInt("id");
                out.println("<tr><td>" + rs.getInt("bike_id") + "</td><td>" + rs.getString("customer_name") + "</td><td>" + rs.getString("customer_contact") + "</td><td>" + rs.getString("booking_date") + "</td><td>" + rs.getInt("days") + "</td>");
                out.println("<td><a href='DeleteBooking.jsp?id=" + bookingId + "' class='btn btn-danger'>Delete</a></td></tr>");
            }
            out.println("</table>");
            out.println("</body></html>");
            
            con.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
      %>
        
        
    </div>
        
  
</body>
</html>