<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Bike Rental System</title>
    <link rel="stylesheet" href="adminpanel.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <h2 class="text-center">Customer Details</h2>
        <table class="table table-bordered table-striped mt-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                     <th>city</th>
                  
                    <th>Phone</th>
                    
                     <th>Aadhar</th>
                    <th>License</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM customers");
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("customer_id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("phone") %></td>
                      <td><%= rs.getString("city") %></td>
                  
                      <td><%= rs.getString("aadhar") %></td>
                        <td><%= rs.getString("license") %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="adminpanel.js"></script>
</body>
</html>
