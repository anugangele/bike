 <link rel="stylesheet" href="adminpanel.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"><%@ page import="java.sql.*, java.io.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM bikes WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<html>
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
    <h2>Edit Bike</h2>
     <div class="container mt-5">
    <form action="updateBike.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" class="form-control" required value="<%= id %>">
        Name: <input type="text" name="name" class="form-control" required value="<%= rs.getString("name") %>" required><br>
        Model: <input type="text" name="model"  class="form-control" required value="<%= rs.getString("model") %>" required><br>
        Rent Price: <input type="number" name="rent_price" class="form-control" required class="form-control" required value="<%=rs.getString("rent_price") %>" required><br>
        Image: <input type="file" name="image" class="form-control" required><br>
        <input type="submit" class="btn btn-primary" value="Update Bike">
    </form>
     </div>
</body>
</html>