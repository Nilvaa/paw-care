<%@page import="java.util.*, java.io.*"%>
<%@page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*"%>
<%@page import="Connection.dbconnection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="parent_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Pets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f8f8;
            margin: 0; padding: 0;
        }
        .reg-form {
            width: 480px;
            margin: 60px auto;
            background: #ffffff;
            padding: 30px 40px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 18px;
        }
        label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #444;
        }
        input[type="text"],
        input[type="number"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }
        textarea {
            min-height: 80px;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #F18F01;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background: #e57700;
        }
        @media (max-width: 500px) {
            .reg-form {
                width: 90%;
                padding: 20px;
            }
        }
        .form-row {
            display: flex;
            gap: 20px;
        }
        .half-width {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="reg-form">
    <h2>Add a Pet</h2>
    <form method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="pet_name">Pet Name:</label>
            <input type="text" name="pet_name" required>
        </div>
        <div class="form-group">
            <label for="typ">Type:</label>
            <input type="text" name="typ" required>
        </div>
        <div class="form-row">
            <div class="form-group half-width">
                <label for="breed">Breed:</label>
                <input type="text" name="breed" required>
            </div>
            <div class="form-group half-width">
                <label for="age">Age:</label>
                <input type="number" name="age" required>
            </div>
        </div>
        <div class="form-group">
            <label for="weight">Weight:</label>
            <input type="number" step="0.1" name="weight" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea name="description" required></textarea>
        </div>
        <div class="form-group">
            <label for="image">Pet Image:</label>
            <input type="file" name="image" accept="image/*" required>
        </div>
        <button type="submit" name="submit">Add Pet</button>
    </form>
</div>

<%
if (ServletFileUpload.isMultipartContent(request)) {
    try {
        String pa_id = (String) session.getAttribute("loguid");
        dbconnection con = new dbconnection();

        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);

        String pet_name = "", typ = "", breed = "", age = "", weight = "", description = "", imageFileName = "";

        // Set the path where images will be saved - adjust for your system
        String uploadPath = "D:/Mini_project/Mini_project/web/pet_parent/uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();  // Create directory if it doesn't exist
        }

        for (FileItem item : items) {
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String value = item.getString("UTF-8");

                if(fieldName.equals("pet_name")) {
                    pet_name = value;
                } else if(fieldName.equals("typ")) {
                    typ = value;
                } else if(fieldName.equals("breed")) {
                    breed = value;
                } else if(fieldName.equals("age")) {
                    age = value;
                } else if(fieldName.equals("weight")) {
                    weight = value;
                } else if(fieldName.equals("description")) {
                    description = value;
                }
            } else {
                String fileName = new File(item.getName()).getName();

                // Optional: to avoid filename conflicts, use a timestamp or UUID prefix
                String uniqueFileName = System.currentTimeMillis() + "_" + fileName;

                String filePath = uploadPath + File.separator + uniqueFileName;
                File storeFile = new File(filePath);

                // Save the file on disk
                item.write(storeFile);

                imageFileName = uniqueFileName;
            }
        }

        String sql = "INSERT INTO pets (pa_id, pet_name, typ, breed, age, weig, desp, image) VALUES (" +
                     "'" + pa_id + "', '" + pet_name + "', '" + typ + "', '" + breed + "', '" + age + "', " +
                     "'" + weight + "', '" + description + "', '" + imageFileName + "')";

        int result = con.putData(sql);
        if (result > 0) {
%>
<script>
    alert("Pet added successfully!");
    window.location = 'parent_home.jsp';
</script>
<%
        } else {
%>
<script>alert("Failed to add pet.");</script>
<%
        }
    } catch (Exception ex) {
        out.println("<p style='color:red;'>Error: " + ex.getMessage() + "</p>");
    }
}
%>

</body>
</html>
