<%-- 
    Document   : vet_home
    Created on : 18 May, 2025, 5:13:16 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="vet_header.jsp" %> <%-- This includes the navbar --%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pet Parent Home</title>
    <link rel="stylesheet" type="text/css" href="../styles/style_sheet.css">
    <style>
        body, html {
            margin: 0; padding: 0; height: 100%;
            font-family: Arial, sans-serif;
            /*background-color: #F18F01;*/
        }

        .content {
            position: relative;
            height: 100vh;
            width: 100%;
            overflow: hidden;
            color: #F18F01;
             font-family: 'Homemade Apple', cursive;
            text-align: center;
        }

        .bg-image {
            position: absolute;
            left: 0;
            width: 100%;
            height: 90%;
            object-fit: cover;
            z-index: -1;
            image-rendering: auto;
            -webkit-font-smoothing: antialiased;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            transform: translateZ(0);
        }

        .text-overlay {
            position: relative;
            top: 20%;
            transform: translateY(-50%);
            padding: 20px;
            text-shadow: 2px 2px 6px  black;
            max-width: 700px;
            margin: 0 auto;
        }

        .text-overlay h1 {
            font-size: 3rem;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .text-overlay p {
            font-size: 1.5rem;
            font-style: italic;
        }

        /* Responsive font sizing */
        @media (max-width: 700px) {
            .text-overlay h1 {
                font-size: 2rem;
            }
            .text-overlay p {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="content">
        <img src="../images/vett.jpeg" alt="Happy pet parent with pet" class="bg-image" />
        <div class="text-overlay">
            <h1>Welcome to Paw Care, Vets!</h1>
            <p>“A veterinarian is someone who has a heart that cares for every paw, claw, and feather”</p>
        </div>
    </div>
</body>
</html>

</body>
</html>
