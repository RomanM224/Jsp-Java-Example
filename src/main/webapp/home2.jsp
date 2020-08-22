<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Cookie Example</h2>
<h4>Write Cookie</h4>
<form action = "AddCookie.jsp" method = "GET">
         First Name: <input type = "text" name = "first_name">
         <br />
         Last Name: <input type = "text" name = "last_name" />
         <input type = "submit" value = "Write Cookie" />
</form>
<a href="ReadCookie.jsp"><h4>Read Cookie</h2></a>
<h4>Write Cookie</h4>
<form action = "/jsp_1/deleteCookie" method = "GET">
         Delete Cookie By Name: <input type = "text" name = "deleteCookie" />
         <input type = "submit" value = "Delete Cookie" />
</form>
<%
String info =(String) request.getAttribute("info");
if(info != null){
    out.println(info);
}
%>

<a href="SessionExample.jsp"><h2>Session Example</h2></a>

      <h3>File Upload:</h3>
      Select a file to upload: <br />
      <form action = "ReadFile.jsp" method = "post"
         enctype = "multipart/form-data">
         <input type = "file" name = "file" size = "50" />
         <br />
         <input type = "submit" value = "Upload File" />
      </form>
      
    <a href="date_2.jsp"><h2>Date Example</h2></a>  
    <a href="PageRedirection.jsp"><h2>Page Redirection Example</h2></a>  
    
    <%
         Integer hitsCount = (Integer)application.getAttribute("hitCounter");
         if( hitsCount ==null || hitsCount == 0 ) {
            /* First visit */
            out.println("Welcome to my website!<br>");
            hitsCount = 1;
			out.println("Hits: " + hitsCount);           
         } else {
            /* return visit */
            out.println("Welcome back to my website!<br>");
            hitsCount += 1;
            out.println("Hits: " + hitsCount);   
         }
         application.setAttribute("hitCounter", hitsCount);
      %>
      
      <a href="RefreshTime.jsp"><h2>Refresh current time evry 5 sec</h2></a> 
      
      <h2>Send email example</h2>
      <form action="SendEmail.jsp" method = "post">
          Email: <input type = "text" name = "recepient"><br>
          Theme: <input type = "text" name = "email_theme"><br>
          Text<textarea rows="5" cols="30" name = "email_text"></textarea>
      	  <input type = "submit" value = "Send Email">
      </form> 

</body>
</html>