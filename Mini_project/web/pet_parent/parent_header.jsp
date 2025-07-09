<%-- 
    Document   : parent_header
    Created on : 18 May, 2025, 5:57:53 PM
    Author     : HP
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--<title>PAW CARE</title>-->
    <link rel="stylesheet" type="text/css" href="../styles/style_sheet.css">
</head>
<body>
<%
    String uid = (String) session.getAttribute("loguid");
%>
<div class="navbar">
    <ul>
        <li><a href="parent_home.jsp">Home</a></li>
        <li><a href="add_pets.jsp?UID=<%=uid%>">Add Pets</a></li>
        <li><a href="view_pets.jsp?UID=<%=uid%>">View Pets</a></li>
        <li><a href="view_vets.jsp?UID=<%=uid%>">Veterinarians</a></li>
        <!--<li><a href="appointments.jsp?UID=<%=uid%>">Appointments</a></li>-->
        <li><a href="../login.jsp">Logout</a></li>
    </ul>
</div>

