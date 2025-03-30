<%@ page import="java.sql.*, com.caltech.dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Slot</title>
</head>
<body>

    <h2>Confirm Your Slot Booking</h2>

    <% 
        // Retrieve the date, time, and email from the query string
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String email = request.getParameter("email");

        // Create UserDAO to interact with the database
        UserDAO userDAO = new UserDAO();

        // Check if the user has already booked the slot
        boolean alreadyBooked = userDAO.isSlotBookedByUser(email, date, time);

        if (alreadyBooked) {
            out.println("<p>You have already registered for this slot.</p>");
            out.println("<a href='dashboard.jsp'>Go back to dashboard</a>");
        } else {
    %>

    <p>You are booking the slot:</p>
    <p>Date: <%= date %></p>
    <p>Time: <%= time %></p>

    <form action="register_slot.jsp" method="post">
        <input type="hidden" name="date" value="<%= date %>">
        <input type="hidden" name="time" value="<%= time %>">
        <input type="hidden" name="email" value="<%= email %>">
        <p>Do you want to proceed with the booking?</p>
        <input type="submit" name="proceed" value="Proceed">
    </form>

    <%
        // Handle form submission (when user clicks "Proceed")
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String proceed = request.getParameter("proceed");

            if ("Proceed".equals(proceed)) {
                // Proceed with the booking logic (decrease count and register user)
                boolean success = userDAO.bookSlot(date, time, email);

                if (success) {
                    // Successfully booked, redirect to dashboard
                    response.sendRedirect("dashboard.jsp");
                } else {
                    out.println("<p>Booking failed. Please try again.</p>");
                }
            }
        }
    %>

    <% 
        }
    %>

</body>
</html>
