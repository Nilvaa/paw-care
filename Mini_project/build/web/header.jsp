<%-- 
    Document   : header
    Created on : 17 May, 2025, 11:58:56 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PAW CARE</title>
    <link rel="stylesheet" type="text/css" href="styles/style_sheet.css">
</head>
<body>
    <div class="navbar">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li class="dropdown">
                <a href="#">Register</a>
                <div class="dropdown-content">
                    <a href="pet_parent/register_pet_parent.jsp">Pet Parent</a>
                    <a href="vet/register_vet.jsp">Veterinarian</a>
                </div>
            </li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
    </div>