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


         <h2>HTTP Header Request Example</h2>
         
         <table width = "100%" border = "1" align = "center">
            <tr bgcolor = "#949494">
               <th>Header Name</th>
               <th>Header Value(s)</th>
            </tr>
            <%
               Enumeration headerNames = request.getHeaderNames();
               while(headerNames.hasMoreElements()) {
                  String paramName = (String)headerNames.nextElement();
                  out.print("<tr><td>" + paramName + "</td>\n");
                  String paramValue = request.getHeader(paramName);
                  out.println("<td> " + paramValue + "</td></tr>\n");
               }
            %>
         </table>

</body>
</html>