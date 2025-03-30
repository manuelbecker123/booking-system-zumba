<%@ page import="java.sql.*, com.caltech.dao.UserDAO, com.caltech.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    
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
    margin-left: 30%;
    margin-top:1px%;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;

    display: flex;
    flex-direction: column;
    align-items: center;
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
                        <a class="nav-link" href="loginform.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>


    <!-- Registration Form -->
    <div class="container mt-1">
        <h2 class="text-center" style="margin-top:0px">Register New User</h2>

        <form action="register.jsp" method="post">
            <div class="form-group">
                
                <input placeholder="Enter your Name" type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="form-group">
                
                <input placeholder="Enter your Age" type="number" id="age" name="age" class="form-control" required>
            </div>

            <div class="form-group">
                
                <input placeholder="Enter your Weight in kg" type="number" id="weight" name="weight" step="0.01" class="form-control" required>
            </div>

            <div class="form-group">
                
                <textarea placeholder="Enter your full Adress" id="address" name="address" class="form-control" required></textarea>
            </div>

            <div class="form-group">
               
                <input placeholder="Enter your email"type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="form-group">
                
                <input placeholder="Enter your Phone Number" type="tel" id="tel_number" name="tel_number" class="form-control" required>
            </div>

            <div class="form-group">
                
                <input placeholder="Enter your Password"type="password" id="password" name="password" class="form-control" required>
            </div>

            <div class="form-group text-center">
                <input type="submit" value="Register" class="btn btn-primary">
            </div>
        </form>

        <!-- Handle Form Submission -->
        <%
            if(request.getMethod().equalsIgnoreCase("POST")) {
                String name = request.getParameter("name");
                int age = Integer.parseInt(request.getParameter("age"));
                double weight = Double.parseDouble(request.getParameter("weight"));
                String address = request.getParameter("address");
                String email = request.getParameter("email");
                String telNumber = request.getParameter("tel_number");
                String password = request.getParameter("password");

                // Create a User object and set the values
                User user = new User();
                user.setName(name);
                user.setAge(age);
                user.setWeight(weight);
                user.setAddress(address);
                user.setEmail(email);
                user.setTelNumber(telNumber);
                user.setPassword(password);

                // Create an instance of UserDAO to interact with the database
                UserDAO userDAO = new UserDAO();

                // Check if the email already exists in the database
                if(userDAO.checkEmailExists(email)) {
                    out.println("<p class='error'>Email is already registered. Please try a different email.</p>");
                } else {
                    // Insert the user into the database
                    int result = userDAO.insertUser(user);
                    if(result > 0) {
                        // Redirect to the login page after successful registration
                        response.sendRedirect("loginform.jsp");
                    } else {
                        out.println("<p class='error'>There was an error. Please try again.</p>");
                    }
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