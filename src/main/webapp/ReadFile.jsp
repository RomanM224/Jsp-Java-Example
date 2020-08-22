<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="java.nio.file.*"%>
<%@ page import="java.net.URL"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	    File file;
	    int maxFileSize = 5000 * 1024;
	    int maxMemSize = 5000 * 1024;
	    ServletContext context = pageContext.getServletContext();
	    //Get from web.xml
	    String filePath = context.getInitParameter("file-upload");

	    // Verify the content type
	    String contentType = request.getContentType();

	    if ((contentType.indexOf("multipart/form-data") >= 0)) {
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        // maximum size that will be stored in memory
	        factory.setSizeThreshold(maxMemSize);

	        // Location to save data that is larger than maxMemSize.
	        factory.setRepository(new File("C:\\temp"));

	        // Create a new file upload handler
	        ServletFileUpload upload = new ServletFileUpload(factory);

	        // maximum file size to be uploaded.
	        upload.setSizeMax(maxFileSize);

	        try {
	            // Parse the request to get file items.
	            List<FileItem> fileItems = upload.parseRequest(request);

	            out.println("<html>");
	            out.println("<head>");
	            out.println("<title>JSP File upload</title>");
	            out.println("</head>");
	            out.println("<body>");

	            for (FileItem fileItem : fileItems) {
	                if (!fileItem.isFormField()) {
	                    // Get the uploaded file parameters
	                    String fieldName = fileItem.getFieldName();
	                    String fileName = fileItem.getName();
	                    boolean isInMemory = fileItem.isInMemory();
	                    long sizeInBytes = fileItem.getSize();

	                    // Write the file
	                    System.out.println(fileName.lastIndexOf("\\")); //-1
	                    System.out.println(fileName.lastIndexOf("\\") + 1); //0
	                    System.out.println(fileName.substring(fileName.lastIndexOf("\\") + 1)); //HOLLO.txt
	                    if (fileName.lastIndexOf("\\") >= 0) {
	                        file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
	                    } else {
	                        file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
	                    }
	                    fileItem.write(file);
	                    out.println("Uploaded Filename: " + filePath + fileName + "<br>");
	                    
	                    BufferedReader reader = Files.newBufferedReader(Paths.get("C:\\workspace\\jsp_1\\src\\main\\resources\\" + fileName));
	                   //URL url = getClass().getClassLoader().getResource(fileName);
	                   //BufferedReader reader = Files.newBufferedReader(Paths.get(url.toURI()));
	                   int letter;
	                    while ((letter = reader.read()) != -1) {
	                       String str = new String((char) letter + reader.readLine());
	                       out.println(str + "<br>");
	                    }
	                }
	            }
	            out.println("</body>");
	            out.println("</html>");
	        } catch (Exception ex) {
	            System.out.println(ex);
	        }
	        
	        
	        
	        
	        
	    } else {
	        out.println("<html>");
	        out.println("<head>");
	        out.println("<title>Servlet upload</title>");
	        out.println("</head>");
	        out.println("<body>");
	        out.println("<p>No file uploaded</p>");
	        out.println("</body>");
	        out.println("</html>");
	    }
	%>
</body>
</html>