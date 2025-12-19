<%@ page import="java.sql.*, java.io.*" %>
<%@ include file="dbconfig.jsp" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PreparedStatement pst = conn.prepareStatement("SELECT image FROM bikes WHERE id=?");
    pst.setInt(1, id);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        byte[] imgData = rs.getBytes("image");
        response.setContentType("image/png");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    }
%>
