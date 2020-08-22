<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	    final String email = "maistrromans@gmail.com";
	    final String password = "roma920801";
	    String recepient = request.getParameter("recepient");
	    
	    Properties properties = new Properties();
	    properties.put("mail.smtp.auth", "true");
	    properties.put("mail.smtp.starttls.enable", "true");
	    properties.put("mail.smtp.host", "smtp.gmail.com");
	    properties.put("mail.smtp.port", "587");


	    Session mailSession = Session.getInstance(properties, new Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(email, password);
	        }
	    });

            Message message = new MimeMessage(mailSession);
	    try {
            message.setFrom(new InternetAddress(email));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject(request.getParameter("email_theme"));
            message.setText(request.getParameter("email_text"));

        } catch (MessagingException e) {
            e.printStackTrace();
        }	    try {
	        Transport.send(message);
	        System.out.println("Message sent successfully");
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
	%>

	<center>
		<h1>Send Email using JSP</h1>
	</center>

	<p align="center">
		<%
		    out.println("Result: " + "\n");
		%>
	</p>

</body>
</html>