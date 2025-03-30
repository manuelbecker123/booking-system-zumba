<%@ page import="java.sql.*, java.util.List, com.caltech.dao.UserDAO, com.caltech.pojo.Participant" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Participants</title>

    <!-- Bootstrap CSS (without crossorigin attribute) -->
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

        <h2 class="text-center">Participants for Slot</h2>

        <% 
            String date = request.getParameter("date");
            String time = request.getParameter("time");

            UserDAO userDAO = new UserDAO();
            List<Participant> participants = userDAO.getParticipantsForSlot(date, time);
        %>

        <!-- Table for Participants -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Age</th>
                        <th>Weight</th>
                        <th>Slot Date</th>
                        <th>Slot Time</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (Participant participant : participants) {
                    %>
                    <tr>
                        <td><%= participant.getName() %></td>
                        <td><%= participant.getEmail() %></td>
                        <td><%= participant.getPhone() %></td>
                        <td><%= participant.getAge() %></td>
                        <td><%= participant.getWeight() %></td>
                        <td><%= participant.getSlotDate() %></td>
                        <td><%= participant.getSlotTime() %></td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </div>

    </div>

    <!-- Bootstrap JS (Optional for additional functionality) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
