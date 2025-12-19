<%-- 
    Document   : DeleteBooking
    Created on : Mar 29, 2025, 7:42:51 PM
    Author     : my computers
--%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ include file="dbconfig.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        int bookingId = Integer.parseInt(request.getParameter("id"));
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
            PreparedStatement ps = con.prepareStatement("DELETE FROM bookings WHERE id=?");
            ps.setInt(1, bookingId);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("adminhome.jsp");
      %>
    </body>
</html>
