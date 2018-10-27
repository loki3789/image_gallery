<%-- 
    Document   : addatdatabase
    Created on : Oct 25, 2018, 8:35:04 PM
    Author     : lokesh
--%>
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD At DATABASE</title>
    </head>
    <body>
        
        <%
            String image_name=request.getParameter("image_name");
            String image_path=request.getParameter("path");
            
           
            Connection con=null;

            ResultSet rs=null;

            PreparedStatement psmt=null;

            FileInputStream fis;

            String url="jdbc:mysql://localhost:3306/jspdb";

            try{

                    Class.forName("com.mysql.jdbc.Driver").newInstance();

                    con=DriverManager.getConnection(url,"root","root");

                    File image1=new File(image_path);

                    psmt=con.prepareStatement("insert into imagetable(image,image_name)"+"values(?,?)");
                    fis=new FileInputStream(image1);

                    psmt.setBinaryStream(1, (InputStream)fis, (int)(image1.length()));

                    psmt.setString(2,image_name);

                    int s = psmt.executeUpdate();

                    if(s>0) {

                    %>

                    <b><font color="Blue">

                    <% out.println("Image added successfully !"); %>

                    </font></b>

                    <%

                    }

                    else {

                     out.println("unsucessfull to upload image and add product.");

                    }

                    con.close();

                    psmt.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}
%>
<a href="index.jsp"><h1>Click here to go Adminpage</h1></a>
    </body>
</html>
