<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="Connection.dbconnection"%>
<%@include file="parent_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Pets</title>
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
    </style>
</head>
<body>

<h2>Your Pets</h2>

<div class="grid-container">

<%
    try {
        String pa_id = (String) session.getAttribute("loguid");
        dbconnection con = new dbconnection();

        String qry = "SELECT * FROM pets WHERE pa_id = '" + pa_id + "'";
        Vector<Vector> petsData = con.getData(qry);

        Iterator<Vector> it = petsData.iterator();

        while (it.hasNext()) {
            Vector pet = it.next();

            String pet_name = (String) pet.get(2); // pet_name
            String breed = (String) pet.get(4);    // breed
            String age = (String) pet.get(5);      // age
            String weig = (String) pet.get(6);     // weight
            String desp = (String) pet.get(7);     // description
            String image = (String) pet.get(8);    // image filename
%>

    <div class="card">
        <img src="uploads/<%= image %>" alt="Pet Image">
        <h3><%= pet_name %></h3>
        <div class="details-row">
            <p><strong>Breed:</strong> <%= breed %></p>
            <p><strong>Age:</strong> <%= age %> years</p>
        </div>
        <div class="details-row">
            <p><strong>Weight:</strong> <%= weig %> kg</p>
            <p></p> <!-- Empty cell to keep alignment -->
        </div>
        <p class="description"><strong>Description:</strong> <%= desp %></p>
    </div>

<%
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading pets: " + e.getMessage() + "</p>");
    }
%>

</div>

</body>
</html>
