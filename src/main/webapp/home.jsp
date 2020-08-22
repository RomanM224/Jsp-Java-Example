<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>JSP Declarations example: </h2>
	<%! String string = "Hello 1";
	int day = 3;
	int fontSize;
	%>
	<% out.println(string); %>
	<br><br>

	<h2>Scriplet Example: </h2>
	<% out.println("Hello2 "); %>
	<%--  	<% ... %> and <jsp:scriptlet> ... </jsp:scriptlet>  are same 	--%>
	<jsp:scriptlet>
	String str = "Hello3";
	out.println(str);
	</jsp:scriptlet>
	<br><br>

	<h2>JSP Expression example: </h2>
	<%=string %>
	<br><br>

	<h2>if...else Example: </h2>
      <% if (day == 1 || day == 7) { %>
         <p> Today is weekend</p>
      <% } else { %>
         <p> Today is not weekend</p>
      <% } %>

	<h2>for-loop Example: </h2> 
      <%for ( fontSize = 1; fontSize <= 3; fontSize++){ %>
         <font color = "green" size = "<%= fontSize %>">
            JSP Tutorial
      </font><br />
      <%}%>
       
	<%@ include file = "header.jsp" %>

	<h2>The include action Example</h2>
	<jsp:include page = "date.jsp" flush = "true" />

	<h2>Client Request Example</h2>
	<form action="/jsp_1/ClientRequestExample.jsp" method = "post">
		<input type="text" name="param"> <input type="submit">
	</form>

	<h2>Using GET Method Example</h2>
	<form action = "ResponseToGetPost.jsp" method = "GET">
         First Name: <input type = "text" name = "first_name">
         <br />
         Last Name: <input type = "text" name = "last_name" />
         <input type = "submit" value = "Submit" />
	</form>

	<h2>Using POST Method Example</h2>
	<form action = "ResponseToGetPost.jsp" method = "POST">
         First Name: <input type = "text" name = "first_name">
         <br />
         Last Name: <input type = "text" name = "last_name" />
         <input type = "submit" value = "Submit" />
	</form>

	<h2>CheckboxExample</h2>
	<form action = "CheckBoxExample.jsp" method = "POST" target = "_blank">
         <input type = "checkbox" name = "maths" checked = "checked" /> Maths
         <input type = "checkbox" name = "physics"  /> Physics
         <input type = "checkbox" name = "chemistry" checked = "checked" /> Chemistry
         <input type = "submit" value = "Select Subject" />
    </form>
    

    
</body>
</html>