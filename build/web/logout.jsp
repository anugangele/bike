<%-- 
    Document   : logout
    Created on : Sep 4, 2013, 11:32:13 AM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
  

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        <style type="text/css">
<!--
.style1 {
	font-family: "Times New Roman", Times, serif;
	color: #FF8000;
}
-->
        </style>
</head>
  <body >
      <%
session.removeValue("user");
 session.invalidate();  
 
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0

response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
response.setHeader("Cache-Control","no-store"); //HTTP 1.1

response.sendRedirect("index.jsp");//login page
%>
   
    </body>   
</html>
