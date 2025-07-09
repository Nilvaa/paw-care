<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="Connection.dbconnection"%>
<%@include file="vet_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background: #f9f9f9;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 20px;
        }
        .card {
            background: white;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.2s ease-in-out;
            text-align: center;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .card h3 {
            margin: 10px 0 5px;
            font-size: 20px;
            color: orange;
            text-transform: uppercase;
        }
        .details-row {
            display: flex;
            justify-content: space-between;
            margin: 4px 0;
            font-size: 14px;
            color: #555;
        }
        .details-row p {
            margin: 0;
            width: 48%;
            text-align: left;
        }
        .description {
            margin-top: 6px;
            font-size: 14px;
            color: #555;
            text-align: left;
        }
        .btn {
            display: block;
            padding: 8px 0;
            margin: 8px 0 0;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            color: white;
            font-size: 14px;
        }
        .btn-view {
            background-color: #007bff;
        }
        .btn-accept {
            background-color: #28a745;
        }
        .btn-reject {
            background-color: #dc3545;
        }
    </style>
</head>
<body>

<h2>Your Appointments</h2>

<div class="grid-container">

<%
    try {
        String vetId = (String) session.getAttribute("loguid");
        if (vetId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        dbconnection con = new dbconnection();
  String appQry = "SELECT * FROM appointments WHERE d_id='" + vetId + "' AND status='requested'";

        Vector<Vector> appointments = con.getData(appQry);

        for (Vector ap : appointments) {
            String ap_id = (String) ap.get(0);
            String pa_id = (String) ap.get(2);
            String status = (String) ap.get(3);

            String petQry = "SELECT * FROM pets WHERE pa_id='" + pa_id + "'";
            Vector<Vector> pets = con.getData(petQry);

            if (!pets.isEmpty()) {
                Vector pet = pets.get(0);

                String pet_name = (String) pet.get(2);
                String breed = (String) pet.get(4);
                String age = (String) pet.get(5);
                String weig = (String) pet.get(6);
                String desp = (String) pet.get(7);
                String image = (String) pet.get(8);
%>

    <div class="card">
        <img src="../pet_parent/uploads/<%= image %>" alt="Pet Image">
        <h3><%= pet_name %></h3>
        <div class="details-row">
            <p><strong>Breed:</strong> <%= breed %></p>
            <p><strong>Age:</strong> <%= age %> years</p>
        </div>
        <div class="details-row">
            <p><strong>Weight:</strong> <%= weig %> kg</p>
            <p></p> <!-- for layout balance -->
        </div>
        <p class="description"><strong>Description:</strong> <%= desp %></p>
        <p class="description"><strong>Status:</strong> <%= status %></p>

        <a class="btn btn-view" href="view_pet_parent.jsp?pa_id=<%= pa_id %>">View Pet Parent</a>
        <a class="btn btn-accept" href="update_status.jsp?ap_id=<%= ap_id %>&status=accepted">Accept</a>
        <a class="btn btn-reject" href="update_status.jsp?ap_id=<%= ap_id %>&status=rejected">Reject</a>
    </div>

<%
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading appointments: " + e.getMessage() + "</p>");
    }
%>

</div>

</body>
</html>
