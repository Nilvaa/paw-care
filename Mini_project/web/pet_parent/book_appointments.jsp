<%-- 
    Document   : book_appointments
    Created on : 19 May, 2025, 2:52:16 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.dbconnection"%>
<%@page import="java.util.*"%>

<%
    String uid = request.getParameter("uid");
    String vid = request.getParameter("vid");

    try {
        dbconnection con = new dbconnection();

        // Check if already booked
        String checkQry = "SELECT * FROM appointments WHERE pa_id='" + uid + "' AND d_id='" + vid + "'";
        Vector result = con.getData(checkQry);
        
        if (result.isEmpty()) {
            // Insert new appointment
            String insertQry = "INSERT INTO appointments (pa_id, d_id, status) VALUES ('" + uid + "', '" + vid + "', 'requested')";
            con.putData(insertQry);
        }

        // Redirect back to vet list
        response.sendRedirect("view_vets.jsp");
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>

