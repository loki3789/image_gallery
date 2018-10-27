<%-- 
    Document   : delete
    Created on : Oct 24, 2018, 7:54:41 PM
    Author     : lokesh
--%>

<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="newcss1.css">
        


    </head>
    <body>
   
        <h2 style="align-content:center;background-color:black;color:white"> Delete image</h2>
        </br>
        </br>
        <form action="deleteatdatabase.jsp">
        <%
            try {
                String connectionURL = "jdbc:mysql://localhost:3306/jspdb";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                ResultSet rs1 = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "root");
                statement = connection.createStatement();
                String QueryString = "SELECT * from imagetable";
                rs = statement.executeQuery(QueryString);
        %>




        <div class="row">
            <%
                while (rs.next()) {
            %>
            <div class="column">
                <%
                    Blob image = rs.getBlob("image");
                    byte[] image_array = image.getBytes(1, (int) image.length());
                    byte[] x64_image = Base64.getEncoder().encode(image_array);
                    String xstring = new String(x64_image, "UTF-8");
                %>

                <figure>
                    <img src="data: image/png;base64,<%=xstring%>" style="width:100%;height: 100%"  class="hover-shadow cursor">
                    <figcaption style="margin-left:40%">
                        <%=rs.getString(3)%>
                        
                        
                        <input check="checked"  type="checkbox" name="imageschecked" value="<%=rs.getString(3)%>" >
                        
                        
                    </figcaption>
                </figure>
            </div>
            <%  } %>
            <%
                rs.close();
                statement.close();
                connection.close();
            } catch (Exception ex) {
            %>
            <%
                    out.println("Unable to connect to database.");
                }
            %>

        </div>
            <input  type="submit" value="delete selected images" style="margin-left:200px;"/>
            </form>
    </body>
</html>
