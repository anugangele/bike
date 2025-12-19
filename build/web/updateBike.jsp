<%@ page import="java.sql.*, java.io.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String model = request.getParameter("model");
    String rentPrice = request.getParameter("rent_price");
    Part imagePart = request.getPart("image");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
    if (imagePart.getSize() > 0) {
        InputStream imageStream = imagePart.getInputStream();
        PreparedStatement ps = con.prepareStatement("UPDATE bikes SET name=?, model=?, rent_price=?, image=? WHERE id=?");
        ps.setString(1, name);
        ps.setString(2, model);
        ps.setString(3, rentPrice);
        ps.setBlob(4, imageStream);
        ps.setInt(5, id);
        ps.executeUpdate();
    } else {
        PreparedStatement ps = con.prepareStatement("UPDATE bikes SET name=?, model=?, rent_price=? WHERE id=?");
        ps.setString(1, name);
        ps.setString(2, model);
        ps.setString(3, rentPrice);
        ps.setInt(4, id);
        ps.executeUpdate();
    }
    con.close();
    response.sendRedirect("manage_bikes.jsp");
%>