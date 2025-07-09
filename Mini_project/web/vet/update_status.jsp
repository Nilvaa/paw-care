<%-- 
    Document   : update_status
    Created on : 19 May, 2025, 4:18:18 PM
    Author     : HP
--%>

<%@page import="Connection.dbconnection"%>
<%
    String ap_id = request.getParameter("ap_id");
    String status = request.getParameter("status");

    try {
        dbconnection con = new dbconnection();
        String qry = "UPDATE appointments SET status='" + status + "' WHERE ap_id='" + ap_id + "'";
        con.putData(qry);
        response.sendRedirect("view_con.jsp");
    } catch (Exception e) {
        out.println("Error updating status: " + e.getMessage());
    }
%>

