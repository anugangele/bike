<%@ page import="java.sql.*" %>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"><%@ page import="java.sql.*, java.io.*" %>
<%
    int bikeId = Integer.parseInt(request.getParameter("bike_id"));
    String bikeName = "";
    String bikeModel = "";
    double rentPerDay = 0.0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM bikes WHERE id = ?");
        ps.setInt(1, bikeId);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            bikeName = rs.getString("name");
            bikeModel = rs.getString("model");
            rentPerDay = rs.getDouble("rent_price");
        }
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<html>
<head>
    <title>Book Bike</title>
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
      <div class="container mt-5">
    <h2>Book <%= bikeName %> (<%= bikeModel %>)</h2>
    <p>Rent Per Day: ?<%= rentPerDay %></p>
    
    <form action="confirm_booking.jsp" method="post">
        <input type="hidden" name="bike_id" value="<%= bikeId %>">
        <label>Your Name:</label>
        <input type="text" name="customer_name" class="form-control" required><br><br>

        <label>Your Contact:</label>
        <input type="text" name="customer_contact" class="form-control" required><br><br>

        <label>Days to Rent:</label>
        <input type="number" name="days" min="1" class="form-control" required><br><br>

        <input type="submit" class="btn btn-danger" value="Confirm Booking">
    </form>
</body>
</html>