<%--<jsp:include page="../header.jsp" />--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Connection.dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vet Registration - PAW CARE</title>
    <link rel="stylesheet" type="text/css" href="../styles/style_sheet.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f7fb;
             font-family: "Chelsea Market", system-ui;
        }



        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 10px 15px;
            display: block;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .reg-form {
            max-width: 700px;
            background: #ffffff;
            margin: 60px auto;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.08);
        }

        .reg-form h2 {
            text-align: center;
            margin-bottom: 10px;
            font-size: 28px;
            color: #333;
        }


        .inputs,
        textarea {
            width: 100%;
            padding: 12px 15px;
            margin-top: 8px;
            border-radius: 8px;
            border: 1px solid #ff8800;
            box-sizing: border-box;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        .inputs:focus,
        textarea:focus {
            border-color: #ff8800;
            outline: none;
        }

        .contact-gr,
        .pass-gr,
        .qual-gr,
        .exp-gr {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
        }

        .inputs-con,
        .inputs-pa,
        .qual,
        .lic_num,
        .exp,
        .sp {
            flex: 1;
        }

        .inputs-gr,
        .addrs {
            margin-bottom: 15px;
        }

        .button {
            text-align: center;
        }

        .reg_b {
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
            background-color: orange;
        }

        @media (max-width: 768px) {
            .contact-gr,
            .pass-gr,
            .qual-gr,
            .exp-gr {
                flex-direction: column;
            }
        }
        h2{
      font-family: "Chelsea Market", system-ui;
}
p{
     font-family: 'Homemade Apple', cursive;
     text-align: center;
     color: #F18F01;
}
    </style>
</head>
<body>
    <div class="navbar">
        <ul>
            <li><a href="../index.jsp">Home</a></li>
            <li class="dropdown">
                <a href="#">Register</a>
                <div class="dropdown-content">
                    <a href="../pet_parent/register_pet_parent.jsp">Pet Parent</a>
                    <a href="register_vet.jsp">Veterinarian</a>
                </div>
            </li>
            <li><a href="../login.jsp">Login</a></li>
        </ul>
    </div>

    <!-- Registration Form -->
    <div class="reg-form">
        <p>Healing paws and hearts, where care meets compassion.</p>
        <h2>Welcome! Register as Veterinarian</h2>
        <form method="post">
            <div class="inputs-gr">
                <!--<label for="p_name">Full Name</label>-->
                <input type="text" class="inputs" name="v_name" id="p_name" placeholder="Enter your full name">
            </div>

            <div class="contact-gr">
                <div class="inputs-con">
                    <!--<label for="p_em">Email</label>-->
                    <input type="email" class="inputs" name="v_em" id="p_em" placeholder="Enter your email">
                </div>
                <div class="inputs-con">
                    <!--<label for="p_phn">Contact Number</label>-->
                    <input type="tel" maxlength="10" class="inputs" name="v_phn" id="p_phn" placeholder="Enter contact number">
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

            <div class="qual-gr">
                <div class="qual">
                    <!--<label for="qua">Qualification</label>-->
                    <input type="text" class="inputs" name="qua" placeholder="Enter your Qualification">
                </div>
                <div class="lic_num">
                    <!--<label for="lic">License Number</label>-->
                    <input type="text" class="inputs" name="lic_num" placeholder="License Number">
                </div>
            </div>

            <div class="exp-gr">
                <div class="exp">
                    <!--<label for="exp">Experience</label>-->
                    <input type="text" class="inputs" name="exp" placeholder="Enter your Experience">
                </div>
                <div class="sp">
                    <!--<label for="spl">Specialization</label>-->
                    <input type="text" class="inputs" name="spl" placeholder="Enter your Specialization">
                </div>
            </div>

            <div class="addrs">
                <!--<label for="addres">Clinic Name & Address</label>-->
                <textarea class="inputs" name="addres" id="addres" placeholder="Your Clinic Name & Address" style="height: 100px"></textarea>
            </div>

            <div class="button">
                <button class="reg_b" type="submit" name="submit">Register</button>
            </div>
        </form>

        <!-- Password Match Validation -->
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

        <% 
            try {
                if (request.getParameter("submit") != null) {
                    dbconnection con = new dbconnection();
                    String na = request.getParameter("v_name");
                    String em = request.getParameter("v_em");
                    String ph = request.getParameter("v_phn");
                    String pa = request.getParameter("pass");
                    String qu = request.getParameter("qua");
                    String li = request.getParameter("lic_num");
                    String ex = request.getParameter("exp");
                    String sp = request.getParameter("spl");
                    String ad = request.getParameter("addres");

                    String qry = "insert into vet(`name`,`email`,`phn`,`pass`,`qual`,`lic`,`exp`,`spl`,`addrs`) values('" + na + "','" + em + "','" + ph + "','" + pa + "','" + qu + "','" + li + "','" + ex + "','" + sp + "','" + ad + "')";
                    String q = "insert into login(`uid`,`u_nam`,`u_pass`,`type`,`status`) values((select max(vid) from vet),'" + em + "','" + pa + "','vet','1')";

                    int j = con.putData(qry);
                    int jj = con.putData(q);

                    if ((j > 0) && (jj > 0)) {
        %>
                        <script>alert("Registration Successful"); window.location = '../login.jsp';</script>
        <% 
                    } else { 
        %>
                        <script>alert("Registration Failed"); window.location = 'register_vet.jsp';</script>
        <% 
                    }
                }
            } catch (Exception e) {
                out.println("Error: " + e);
            }
        %>
    </div>
</body>
</html>
