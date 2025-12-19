<!DOCTYPE html>
<html lang="en">
    <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Bike Rental System</title>
    <link rel="stylesheet" href="adminpanel.css">
</head>
<body>
    <%
    // Database Connection
    String url = "jdbc:mysql://localhost:3306/bike";
    String user = "root";
    String password = "";

    int totalBikes = 0;
    int totalCustomers = 0;
    int totalBookings = 0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // Total Bikes Count
        String bikeQuery = "SELECT COUNT(*) FROM bikes";
        PreparedStatement pst1 = conn.prepareStatement(bikeQuery);
        ResultSet rs1 = pst1.executeQuery();
        if (rs1.next()) {
            totalBikes = rs1.getInt(1);
        }

        // Total Customers Count
        String customerQuery = "SELECT COUNT(*) FROM customers";
        PreparedStatement pst2 = conn.prepareStatement(customerQuery);
        ResultSet rs2 = pst2.executeQuery();
        if (rs2.next()) {
            totalCustomers = rs2.getInt(1);
        }

        // Total Bookings Count
        String bookingQuery = "SELECT COUNT(*) FROM bookings";
        PreparedStatement pst3 = conn.prepareStatement(bookingQuery);
        ResultSet rs3 = pst3.executeQuery();
        if (rs3.next()) {
            totalBookings = rs3.getInt(1);
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
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

        <section class="content">
            <h2>Dashboard</h2>
            <div class="stats">
                <div class="stat-card">
                    <h3>Total Bikes</h3>
                    <p id="total-bikes"><%= totalBikes %></p>
                </div>
                <div class="stat-card">
                    <h3>Total Rentals</h3>
                    <p id="total-rentals"><%= totalCustomers %></p>
                </div>
                <div class="stat-card">
                    <h3>Total Customers</h3>
                    <p id="total-customers"><%= totalBookings %></p>
                </div>
            </div>

        </section>
    </div>
<%
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/bike";
    String dbUser = "root";
    String dbPassword = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "SELECT * FROM contact_us ";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
            <div class="recent-activities">
                <h3>Recent Activities</h3>
              <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                 
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("message") %></td>
                      
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
     <%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

    <script src="adminpanel.js"></script>
</body>
</html>
