<%@ page import="java.sql.*, com.caltech.dao.UserDAO, com.caltech.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .message {
            text-align: center;
            margin-bottom: 20px;
        }
        .error {
            color: red;
            text-align: center;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body class="bg-light">


 <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Zumba with Rohit</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Login Form -->
    <div class="container mt-5">
        <h2 class="text-center">Login</h2>

        <form action="loginform.jsp" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <div class="form-group text-center">
                <input type="submit" value="Login" class="btn btn-primary">
            </div>
        </form>

        <!-- Handle Form Submission -->
        <%
            if(request.getMethod().equalsIgnoreCase("POST")) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                // Create an instance of UserDAO to interact with the database
                UserDAO userDAO = new UserDAO();

                // Check if the email exists and the password matches
                User user = userDAO.authenticateUser(email, password);

                if(user != null) {
                    // Successful login, store email in the session
                    session.setAttribute("userEmail", email); // Store the email as session ID

                    // Check the role of the user and redirect accordingly
                    if ("admin".equals(user.getRole())) {
                        // Redirect to the admin dashboard
                        response.sendRedirect("admin_dashboard.jsp");
                    } else {
                        // Redirect to the regular dashboard for regular users
                        response.sendRedirect("dashboard.jsp");
                    }
                } else {
                    // If login failed, show an error message
                    out.println("<p class='error'>Invalid email or password. Please try again.</p>");
                }
            }
        %>
    </div>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
