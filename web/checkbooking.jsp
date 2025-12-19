<%-- 
    Document   : checkbooking
    Created on : Mar 29, 2025, 7:47:53 PM
    Author     : my computers
--%>
<%@ page import="java.sql.*, java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike_rental", "root", "password");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM bookings WHERE DATE_ADD(booking_date, INTERVAL no_of_days DAY) <= CURDATE()");
            
            while (rs.next()) {
                String contact = rs.getString("customer_contact");
                sendWhatsAppMessage(contact, "Your bike rental period has ended. Please return the bike.");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void sendWhatsAppMessage(String phone, String message) {
        // Integrate WhatsApp API here
    }
        %>
    </body>
</html>
