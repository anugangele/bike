<%@ page import="java.sql.*" %>
<%
String bikeId = request.getParameter("bike_id");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "");
PreparedStatement pst = con.prepareStatement("UPDATE bikes SET availability=0 WHERE id=?");
pst.setInt(1, Integer.parseInt(bikeId));
pst.executeUpdate();

PreparedStatement pst1 = con.prepareStatement("insert into payments(bike_id,user_email,payment_status) values(?,?,?)");
String em=(String) session.getAttribute("user");
pst1.setInt(1, Integer.parseInt(bikeId));
pst1.setString(2,em);
pst1.setString(3,"confirmed");
pst1.executeUpdate();
con.close();
response.sendRedirect("booking.jsp?bike_id=" + bikeId);
%>