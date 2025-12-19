<%-- 
    Document   : addBike
    Created on : Mar 27, 2025, 7:29:35 PM
    Author     : my computers
--%>
<%@page import="java.sql.*, java.io.*" %>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
      String name = request.getParameter("name");
        String model = request.getParameter("model");
        double rent_price = Double.parseDouble(request.getParameter("rent_price"));

        InputStream imageStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {
            imageStream = filePart.getInputStream();
        }

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
            String sql = "INSERT INTO bikes (name, model, rent_price, image) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, model);
            pst.setDouble(3, rent_price);
            if (imageStream != null) {
                pst.setBlob(4, imageStream);
            }
            pst.executeUpdate();
            response.sendRedirect("manage_bikes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    
%>
    </body>
</html>
