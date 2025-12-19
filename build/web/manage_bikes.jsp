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
        <h2>🛵 Add Bike</h2>
        <form action="addBike.jsp" method="post" enctype="multipart/form-data" class="mb-4">
            <div class="mb-3">
                <label class="form-label">Bike Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Model:</label>
                <input type="text" name="model" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Rent Price (per day):</label>
                <input type="number" name="rent_price" step="0.01" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Upload Image:</label>
                <input type="file" name="image" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Bike</button>
        </form>

        <h2>📋 Bike List</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Model</th>
                    <th>Rent Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    PreparedStatement pst = conn.prepareStatement("SELECT * FROM bikes");
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <img src="displayImage.jsp?id=<%= rs.getInt("id") %>" width="80">
                    </td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("model") %></td>
                    <td>₹<%= rs.getDouble("rent_price") %></td>
                    <td>
                        <a href="editBike.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="deleteBike.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>