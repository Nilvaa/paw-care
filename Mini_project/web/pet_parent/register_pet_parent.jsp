<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Connection.dbconnection"%>

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
    <link rel="stylesheet" type="text/css" href="../styles/style_sheet.css">
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
<link rel="stylesheet" type="text/css" href="../styles/pet_parent.css">
<html>
<head>
    <title>Register - Pet Parent</title>
    <link rel="stylesheet" type="text/css" href="styles/register.css">
</head>
<body>
    <div class="reg-form">
        <style>
           .reg_b {
   width: 100px;
  padding: 12px 25px;
  font-size: 16px;
  background-color: #F18F01;  
  border: none;
  color: white;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.reg_b:hover {
  background-color: #e57700; 
}
h2{
      font-family: "Chelsea Market", system-ui;
}
p{
     font-family: 'Homemade Apple', cursive;
     text-align: center;
     color: #F18F01;
}
.inputs{
  border: 1px solid #ff8800;
}
textarea {
  border: 1px solid #ff8800 !important;
  border-radius: 8px;  
}

        </style>
          <p>A pet is the only thing on earth that loves you more than you love yourself.</p>
        <h2>Welcome! Register as Pet Parent </h2>
      
        <form method="post">
            <div class="inputs-gr">
                <!--<label for="p_name">Full Name</label>-->
                <input type="text" class="inputs" name="p_name" id="p_name" placeholder="Enter your full name">
            </div>

            <div class="contact-gr">
                <div class="inputs-con">
                    <!--<label for="p_em">Email</label>-->
                    <input type="email" class="inputs" name="p_em" id="p_em" placeholder="Enter your email">
                </div>
                <div class="inputs-con">
                    <!--<label for="p_phn">Contact Number</label>-->
                    <input type="tel" maxlength="10" class="inputs" name="p_phn" id="p_phn" placeholder="Enter contact number">
                </div>
            </div>

            <div class="pass-gr">
                <div class="inputs-pa">
                    <!--<label for="pass">Password</label>-->
                    <input type="password" class="inputs" name="pass" id="pass" placeholder="Create a password">
                </div>
                <div class="inputs-pa">
                    <!--<label for="pass_con">Confirm Password</label>-->
                    <input type="password" class="inputs" name="pass_con" id="pass_con" placeholder="Confirm password">
                </div>
            </div>
           
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");
        form.addEventListener("submit", function (e) {
            const password = document.getElementById("pass").value;
            const confirmPassword = document.getElementById("pass_con").value;

            if (password !== confirmPassword) {
                e.preventDefault(); 
                alert("Passwords do not match! Please check.");
            }
        });
    });
</script>

           
            <div class="addrs">
                <!--<label for="addres">Address</label>-->
                <textarea class="form-control" placeholder="Your full address" name="addres" id="addres" style="height: 100px"></textarea>
            </div>

            <div class="button">
                <button class="reg_b" type="submit" name="submit">Register</button>
            </div>
        </form>
        <% try {
                            if (request.getParameter("submit") != null) {
                                dbconnection con = new dbconnection();
                                String na = request.getParameter("p_name");
                                String em = request.getParameter("p_em");
                                String ph = request.getParameter("p_phn");
                                String pa = request.getParameter("pass");
                                String ad = request.getParameter("addres");
                                String qry = "insert into pet_parent(`name`,`email`,`phn`,`pass`,`address`)values('" + na + "','" + em + "','"+ph+"','" + pa + "','" + ad + "')";
                                String q = "insert into login(`uid`,`u_nam`,`u_pass`,`type`,`status`)values((select max(pid)from pet_parent),'" + em + "','" + pa + "','parent','1')";
                                int j = con.putData(qry);
                                int jj = con.putData(q);
                                if ((j > 0) && (jj > 0))  {
                        %>
                        <script>alert("Registration Successful"); window.location = '../login.jsp';</script>
                        <% } else { %>
                        <script>alert("Registration Failed"); window.location = 'register_pet_parent.jsp';</script>
                        <% } } } catch (Exception e) { out.println(e); } %>
    </div>
</body>
</html>
