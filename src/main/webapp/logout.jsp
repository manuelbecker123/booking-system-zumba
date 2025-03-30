<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Invalidate the session to log the user out
    session.invalidate();  // Use the implicitly available session object
    
    // Redirect to the login page
    response.sendRedirect("loginform.jsp");
%>


</body>
</html>