<%-- 
    Document   : register
    Created on : Mar 5, 2025, 3:17:21 PM
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
     Connection connection=null;
     
     String c="jdbc:mysql://localhost:3306/bike";
     
     //Resultset rs=nul//
     PreparedStatement psmnt= null;
     String name=(String)request.getParameter("name");
     String email=(String)request.getParameter("email");
          String city=(String)request.getParameter("city");
     String phone=(String)request.getParameter("phone");    
 
     String aadhar=(String)request.getParameter("aadhar");
     String pass=(String)request.getParameter("pass");
     
      String license=(String)request.getParameter("license");
     try{
     
     Class.forName("com.mysql.jdbc.Driver");
     connection=DriverManager.getConnection(c,"root","");
     String sql="INSERT INTO customers(name,email,city,phone,aadhar,license,pass)"
        +" values(?,?,?,?,?,?,?)";
        PreparedStatement P1=connection.prepareStatement(sql);
        
        P1.setString(1,name);
        P1.setString(2,email);
        P1.setString(3,city);
         P1.setString(4,phone);
          P1.setString(5,aadhar);
          
           P1.setString(6,license);
            P1.setString(7,pass);
        int row=P1.executeUpdate();
        
        if(row>0){
        %>
        <script>
    
       window.location.href='index.jsp';
        </script>
<%    } 
}
       catch(Exception e)
       {
out.print(e.toString());
}

%>
     
     
     
     
    </body>
</html>
