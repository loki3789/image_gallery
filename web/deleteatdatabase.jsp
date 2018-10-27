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
        <title>Delete at database</title>
    </head>
    <body>
        
        <% 
            String [] selected_image_array=request.getParameterValues("imageschecked");
            
            
           try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","root");
          
            Statement st=con.createStatement();
            for(int i=0;i<selected_image_array.length;i++)
            {
            st.executeUpdate("delete from imagetable where image_name='"+selected_image_array[i]+"'");
            }
            
            
            
            }catch(Exception e)
            {
                System.out.println(e);
            }
        %>
        <h1>successfully <% for(String s:selected_image_array)
        { 
            out.println(s);%> <br><%
        }
        %>image is deleted</h1>
            
           
        <a href="index.jsp"><h1>Click here to go Main page</h1></a>
    </body>
</html>
