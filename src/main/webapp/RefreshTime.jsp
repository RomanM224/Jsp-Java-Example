<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

       <%
            // Set refresh, autoload time as 5 seconds
            response.setIntHeader("Refresh", 5);
            
            // Get current time
            DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss");
            LocalTime time = LocalTime.now();
            time.format(FORMATTER);
            out.println("Crrent Time: " + time.format(FORMATTER) + "\n");
         %>
</body>
</html>