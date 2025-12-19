<%@ page import="java.sql.*, java.io.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PreparedStatement pst = conn.prepareStatement("DELETE FROM bikes WHERE id=?");
    pst.setInt(1, id);
    pst.executeUpdate();
    response.sendRedirect("manage_bikes.jsp");
%>
