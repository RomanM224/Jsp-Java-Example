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
<h1>Display Current Date & Time</h1>
<%
LocalDateTime time = LocalDateTime.now();
out.println(time.toString());
%>

</body>
</html>