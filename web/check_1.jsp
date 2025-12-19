<%-- 
    Document   : check
    Created on : Mar 6, 2025, 4:29:13 PM
    Author     : pc
--%>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            String c="jdbc:mysql://localhost:3306/bike";
            
            String email=request.getParameter("email");
            String pass=request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection(c,"root","");
     Statement st=con.createStatement();
     
     ResultSet rs=st.executeQuery("select*from admin Where email='" +
             email +"' and password='"+pass+"'");
     if(rs.next())
     {
     session.setAttribute("user",email);
     response.sendRedirect("adminhome.jsp");
            }
            else
            {
            %>
            <script>
                alert('invalid Login please try again!');
                window.location='index.html';
                </script>
                <%
                    }
}
catch(Exception e){
out.print(e.toString());
}
%>

     
           
     
     
    </body>
</html>
