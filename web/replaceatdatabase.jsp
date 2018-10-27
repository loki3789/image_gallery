<%-- 
    Document   : replaceatdatabase
    Created on : Oct 26, 2018, 9:42:57 PM
    Author     : lokesh
--%>

<%-- 
    Document   : deleteatdatabase
    Created on : Oct 24, 2018, 8:19:38 PM
    Author     : lokesh
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Replace at database</title>
    </head>
    <body>
        
        <% 
            Connection con=null;

ResultSet rs=null;

PreparedStatement psmt=null;

FileInputStream fis;

String url="jdbc:mysql://localhost:3306/jspdb";
Class.forName("com.mysql.jdbc.Driver").newInstance();

con=DriverManager.getConnection(url,"root","root");

String j;
String image_path;
String[] pros = request.getParameterValues("imageschecked");
for (int i = 0; i < pros.length; i++) {
         j = pros[i];
         image_path = request.getParameter(j);
            
            
        try{



            File image1=new File(image_path);

            psmt=con.prepareStatement("update  imagetable set image=? where image_name='"+pros[i]+"'");

            fis=new FileInputStream(image1);

            psmt.setBinaryStream(1, (InputStream)fis, (int)(image1.length()));
            int s = psmt.executeUpdate();

            if(s>0) {

            %>

            <b><font color="Blue">

            <% out.println("Image Updated successfully !"); %>

            </font></b>

            <%

            }

            else {

            out.println("unsucessfull to upload image and add product.");

        }
}
catch(Exception ex){
  out.println("Error in connection : "+ex);
}
}
con.close();
psmt.close();
%>
            
            
           
        <a href="index.jsp"><h1>Click here to go Adminpage</h1></a>
    </body>
</html>

