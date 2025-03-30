<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zumba Classes Booking System</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Custom styles */
        .hero {
            background-image: url('https://via.placeholder.com/1500x500');
            background-size: cover;
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .feature {
            padding: 60px 0;
            text-align: center;
        }
        .feature h3 {
            margin-bottom: 20px;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Zumba with Rohit</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="loginform.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <div class="container">
            <h1>Welcome to Zumba Classes Booking System</h1>
            <p>Join us for fun, fitness, and health!</p>
            <a href="register.jsp" class="btn btn-primary btn-lg">Get Started</a>
        </div>
    </div>

    <!-- Features Section -->
    <div class="feature bg-light">
        <div class="container">
            <h3>Why Choose Our Zumba Classes?</h3>
            <div class="row">
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Feature 1">
                        <div class="card-body">
                            <h5 class="card-title">Expert Instructors</h5>
                            <p class="card-text">Our certified instructors ensure you have the best experience during each class.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Feature 2">
                        <div class="card-body">
                            <h5 class="card-title">Flexible Schedules</h5>
                            <p class="card-text">We offer a variety of class schedules to fit your busy lifestyle. Find a time that works for you!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Feature 3">
                        <div class="card-body">
                            <h5 class="card-title">Fun & Energetic Classes</h5>
                            <p class="card-text">Get moving with our high-energy Zumba classes that will keep you smiling and sweating!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <div class="container">
            <p>&copy; 2025 Zumba Classes. All Rights Reserved.</p>
            <p>
                <a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a>
            </p>
        </div>
    </div>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
