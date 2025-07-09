<%-- 
    Document   : view_pet_parent
    Created on : 20 May, 2025, 7:21:59 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="Connection.dbconnection"%>
<%@include file="vet_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pet Parent Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            padding: 30px;
        }
        .card {
            max-width: 500px;
            margin: auto;
            margin-top: 30px;
            background: white;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #007bff;
        }
        .info-row {
            display: flex;
            margin: 10px 0;
        }
        .label {
            width: 140px;
            font-weight: bold;
            color: #555;
        }
        .value {
            color: #333;
        }
    </style>
</head>
<body>

<%
    String pa_id = request.getParameter("pa_id");
    dbconnection con = new dbconnection();

    String qry = "SELECT * FROM pet_parent WHERE pid='" + pa_id + "'";
    Vector v = con.getData(qry).isEmpty() ? null : (Vector) con.getData(qry).get(0);

    if (v != null) {
        String name = (String) v.get(1);
        String email = (String) v.get(2);
        String phone = (String) v.get(3);
        String address = (String) v.get(5);
%>

<div class="card">
    <h2>Pet Parent Details</h2>
    <div class="info-row">
        <div class="label">Name:</div>
        <div class="value"><%= name %></div>
    </div>
    <div class="info-row">
        <div class="label">Email:</div>
        <div class="value"><%= email %></div>
    </div>
    <div class="info-row">
        <div class="label">Phone:</div>
        <div class="value"><%= phone %></div>
    </div>
    <div class="info-row">
        <div class="label">Address:</div>
        <div class="value"><%= address %></div>
    </div>
</div>

<% } else { %>
    <p style="color: red; text-align: center;">Pet parent not found.</p>
<% } %>

</body>
</html>

