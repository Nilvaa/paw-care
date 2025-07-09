<jsp:include page="header.jsp"></jsp:include>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Connection.dbconnection"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Paw Care</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fdfdfd;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .left-panel, .right-panel {
            width: 50%;
            height: 100%;
        }

        .left-panel {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .right-panel img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .reg-form {
            width: 100%;
            max-width: 400px;
            background: #ffffff;
            padding: 30px 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .reg-form h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .inputs-con, .inputs-pa {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #555;
              font-family: "Chelsea Market", system-ui;
        }

        .inputs {
            width: 100%;
            padding: 10px;
            border: 1px solid #F18F01;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 15px;
        }

        .reg_b {
            width: 100%;
            padding: 12px;
            background: #F18F01;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .reg_b:hover {
            background: #e57700;
        }

        .button {
            margin-top: 20px;
        }

        .error {
            text-align: center;
            color: red;
        }

        @media screen and (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            .left-panel, .right-panel {
                width: 100%;
                height: auto;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Left: Login Form -->
    <div class="left-panel">
        <div class="reg-form">
            <h2>Welcome Back! Please Login</h2>
            <form method="post">
                <div class="inputs-con">
                    <label for="p_em">E-mail</label>
                    <input type="email" class="inputs" name="p_em" id="p_em" placeholder="Enter your Email">
                </div>
                <div class="inputs-pa">
                    <label for="pass">Password</label>
                    <input type="password" class="inputs" name="pass" id="pass" placeholder="Enter your Password">
                </div>

                <div class="button">
                    <button class="reg_b" type="submit" name="loginbtn">Sign In</button>
                </div>
            </form>

            <%
                try {
                    dbconnection db = new dbconnection();
                    if (request.getParameter("loginbtn") != null) {
                        String le = request.getParameter("p_em");
                        String lpa = request.getParameter("pass");
                        String sq = "Select * from login where u_nam='" + le + "' and u_pass='" + lpa + "' and status='1'";
                        Iterator it = db.getData(sq).iterator();
                        if (it.hasNext()) {
                            Vector vt = (Vector) it.next();
                            session.setAttribute("loguid", vt.get(1));
                            if (vt.get(4).equals("parent")) {
                                response.sendRedirect("./pet_parent/parent_home.jsp?UID=" + vt.get(1));
                            } else if (vt.get(4).equals("vet")) {
                                response.sendRedirect("./vet/vet_home.jsp?UID=" + vt.get(1));
                            }
                        } else {
            %>
            <script>
                alert("Login failed. Please try again.");
                window.location = "login.jsp";
            </script>
            <%
                        }
                    }
                } catch (Exception e) {
                    out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
                }
            %>
        </div>
    </div>

    <!-- Right: Image -->
    <div class="right-panel">
        <img src="./images/main2.jpg" alt="Vet Login Image">
    </div>
</div>

</body>
</html>
