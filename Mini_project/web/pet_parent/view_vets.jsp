<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="Connection.dbconnection" %>
<%@ page session="true" %>
<%@ include file="parent_header.jsp" %>

<%
//    String uid = (String) session.getAttribute("loguid");
//    if (uid == null) {
//        response.sendRedirect("../login.jsp");
//        return;
//    }

    dbconnection con = new dbconnection();
    String qry = "SELECT * FROM vet";
    Vector allVets = con.getData(qry);
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Vets</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f9;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .vet-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .vet-card {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }

        .vet-card:hover {
            transform: translateY(-5px);
        }

        .vet-name {
            font-size: 22px;
            font-weight: bold;
            color: #ff6600;
            margin-bottom: 15px;
            text-align: center;
            text-transform: uppercase;
        }

        .vet-row {
            display: flex;
            /*justify-content: space-between;*/
            margin-bottom: 10px;
            font-size: 14px;
            color: #555;
        }

        .vet-label {
            font-weight: bold;
            color: #333;
            width: 45%;
        }

        .btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            transition: background 0.3s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn.disabled {
            background-color: #999;
            color: white;
            cursor: not-allowed;
        }

        .btn.accepted {
            background-color: #28a745;
            color: white;
        }

        .btn.rejected {
            background-color: #dc3545;
            color: white;
        }

        .btn.book {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

    <h2>Available Veterinarians</h2>

    <div class="vet-grid">
        <%
            Iterator it = allVets.iterator();
            while (it.hasNext()) {
                Vector v = (Vector) it.next();
                String vetId = (String) v.get(0);
                String name = (String) v.get(1);
                String email = (String) v.get(2);
                String phone = (String) v.get(3);
                String qualification = (String) v.get(5);
                String license = (String) v.get(6);
                String experience = (String) v.get(7);
                String specialization = (String) v.get(8);
                String address = (String) v.get(9);

                String checkQry = "SELECT status FROM appointments WHERE pa_id='" + uid + "' AND d_id='" + vetId + "'";
                Vector statusData = con.getData(checkQry);

                String status = "";
                if (!statusData.isEmpty()) {
                    Vector statusRow = (Vector) statusData.get(0);
                    status = (String) statusRow.get(0);
                }
        %>

        <div class="vet-card">
            <div class="vet-name">Dr. <%= name %></div>

            <div class="vet-row">
                <div class="vet-label">Email:</div>
                <div><%= email %></div>
            </div>

            <div class="vet-row">
                <div class="vet-label">Phone:</div>
                <div><%= phone %></div>
            </div>

            <div class="vet-row">
                <div class="vet-label">Qualification:</div>
                <div><%= qualification %></div>
            </div>

            <div class="vet-row">
                <div class="vet-label">Experience:</div>
                <div><%= experience %> years</div>
            </div>

            <div class="vet-row">
                <div class="vet-label">Specialization:</div>
                <div><%= specialization %></div>
            </div>

            <div class="vet-row">
                <div class="vet-label">Clinic Address:</div>
                <div><%= address %></div>
            </div>

            <div class="vet-row">
                <div class="vet-label">License No.:</div>
                <div><%= license %></div>
            </div>

            <% if (status.equals("")) { %>
                <a href="book_appointments.jsp?uid=<%= uid %>&vid=<%= vetId %>" class="btn book">Book Appointment</a>
            <% } else if (status.equalsIgnoreCase("requested")) { %>
                <span class="btn disabled">Requested</span>
            <% } else if (status.equalsIgnoreCase("accepted")) { %>
                <span class="btn accepted">Accepted</span>
            <% } else if (status.equalsIgnoreCase("rejected")) { %>
                <span class="btn rejected">Rejected</span>
            <% } %>
        </div>

        <%
            }
        %>
    </div>

</body>
</html>
