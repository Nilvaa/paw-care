<%-- 
    Document   : vet_header
    Created on : 19 May, 2025, 3:29:32 PM
    Author     : HP
--%>

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
        <li><a href="vet_home.jsp">Home</a></li>
        <li><a href="view_con.jsp?UID=<%=uid%>">View Consultations</a></li>
        <li><a href="view_profile.jsp?UID=<%=uid%>">View Profile</a></li>
        <li><a href="../login.jsp">Logout</a></li>
    </ul>
</div>


