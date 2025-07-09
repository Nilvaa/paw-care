<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.dbconnection"%>
<%@page import="java.util.Vector"%>
<%@include file="vet_header.jsp" %>

<%
    String vid = (String) session.getAttribute("loguid");
    if (vid == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    dbconnection con = new dbconnection();
    String qry = "SELECT * FROM vet WHERE vid='" + vid + "'";
    Vector v = con.getData(qry).isEmpty() ? null : (Vector) con.getData(qry).get(0);

    String name = (String) v.get(1);
    String email = (String) v.get(2);
    String phone = (String) v.get(3);
    String qualification = (String) v.get(5);
    String license = (String) v.get(6);
    String experience = (String) v.get(7);
    String specialization = (String) v.get(8);
    String address = (String) v.get(9);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Vet Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9f9f9;
            padding: 40px 20px;
            /*margin: 0;*/
            margin-top: 10px;
        }
        .profile-container {
            max-width: 550px;
            background: white;
            margin: auto;
            margin-top: 20px;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 35px;
            font-weight: 700;
        }
        .profile-row {
            display: flex;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
            text-align: center
        }
        .profile-row:last-child {
            border-bottom: none;
        }
        .label {
            flex: 0 0 140px; /* fixed width for label */
            font-weight: 600;
            color: #555;
            text-align: right;
            padding-right: 15px;
            white-space: nowrap;
        }
        .value {
            flex: 1;
            color: #222;
            font-size: 15px;
            word-break: break-word;
        }
    </style>
</head>
<body>

<div class="profile-container">
    <h2>My Profile</h2>

    <div class="profile-row">
        <div class="label">Name:</div>
        <div class="value">Dr. <%= name %></div>
    </div>

    <div class="profile-row">
        <div class="label">Email:</div>
        <div class="value"><%= email %></div>
    </div>

    <div class="profile-row">
        <div class="label">Phone:</div>
        <div class="value"><%= phone %></div>
    </div>

    <div class="profile-row">
        <div class="label">Qualification:</div>
        <div class="value"><%= qualification %></div>
    </div>

    <div class="profile-row">
        <div class="label">Experience:</div>
        <div class="value"><%= experience %> years</div>
    </div>

    <div class="profile-row">
        <div class="label">License:</div>
        <div class="value"><%= license %></div>
    </div>

    <div class="profile-row">
        <div class="label">Specialization:</div>
        <div class="value"><%= specialization %></div>
    </div>

    <div class="profile-row">
        <div class="label">Clinic Address:</div>
        <div class="value"><%= address %></div>
    </div>
</div>

</body>
</html>
