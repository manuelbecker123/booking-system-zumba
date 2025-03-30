<%@ page import="java.sql.*, java.util.List, com.caltech.dao.UserDAO, com.caltech.pojo.Slot" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .header {
            display: flex;
            justify-content: flex-end;
            padding: 10px;
            background-color: #f4f4f4;
        }
        .header a {
            margin-left: 20px;
            text-decoration: none;
           
        }

        .disabled-btn {
            background-color: #ccc;
            cursor: not-allowed;
        }
        .disabled-btn:hover {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body class="bg-light">


    <!-- Header Section -->
    <div class="header">
        <span>Login successful</span>
        <span style="margin-left: 20px;">|</span>
        <% 
            String userEmail = (String) session.getAttribute("userEmail");
            if (userEmail != null) {
        %>
            <span><strong>Session ID (Email):</strong> <%= userEmail %></span>
        <% 
            } else {
                response.sendRedirect("loginform.jsp");
            }
        %>
        <a href="logout.jsp" class="btn btn-danger">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="container mt-4">
        <h2 class="text-center">Welcome to your Dashboard!</h2>
        <p class="text-center">This is where you can register for available Slots with Rohit.</p>

        <h3 class="text-center">Available Slots</h3>

        <% 
            UserDAO userDAO = new UserDAO();
            List<Slot> slotsList = userDAO.getAllSlots(); // Assuming getAllSlots() is implemented
            String currentDate = "";
        %>

        <!-- Table for Available Slots -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Count</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (Slot slot : slotsList) {
                            String slotDate = slot.getDate().toString();
                            if (!slotDate.equals(currentDate)) {
                                // New date, display the date only once
                                currentDate = slotDate;
                    %>
                        <tr>
                            <td rowspan="2"><%= currentDate %></td>
                            <td><%= slot.getTime() %></td>
                            <td><%= slot.getCount() %></td>
                            <td style="width:5%">
                                <% 
                                    if (slot.getCount() > 0) {
                                %>
                                    <a href="register_slot.jsp?date=<%= currentDate %>&time=<%= slot.getTime() %>&email=<%= userEmail %>">
                                        <button class="btn btn-success">Register</button>
                                    </a>
                                <% 
                                    } else {
                                %>
                                    <button class="btn disabled-btn" disabled>Sold Out</button>
                                <% 
                                    }
                                %>
                            </td>
                        </tr>
                    <% 
                            } else {
                    %>
                        <tr>
                            <td><%= slot.getTime() %></td>
                            <td><%= slot.getCount() %></td>
                            <td>
                                <% 
                                    if (slot.getCount() > 0) {
                                %>
                                    <a href="register_slot.jsp?date=<%= currentDate %>&time=<%= slot.getTime() %>&email=<%= userEmail %>">
                                        <button class="btn btn-success">Register</button>
                                    </a>
                                <% 
                                    } else {
                                %>
                                    <button class="btn btn-secondary disabled-btn" disabled>Sold Out</button>
                                <% 
                                    }
                                %>
                            </td>
                        </tr>
                    <% 
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
